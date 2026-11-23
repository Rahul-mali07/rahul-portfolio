#Requires -Version 5.1
$ErrorActionPreference = "Stop"

$containerName = "portfolio-container"
$imageName = "portfolio-website:latest"
$hostPort = 8080
$containerPort = 80

function Test-ContainerExists {
    $matches = docker ps -a --filter "name=^/$containerName$" --format "{{.Names}}"
    return ($LASTEXITCODE -eq 0 -and $matches -eq $containerName)
}

Write-Host "Preparing portfolio container '$containerName'..." -ForegroundColor Cyan

try {
    if (-not (Test-ContainerExists)) {
        $imageId = docker images -q $imageName
        if ($LASTEXITCODE -ne 0 -or [string]::IsNullOrWhiteSpace($imageId)) {
            throw "Image '$imageName' was not found. Run .\scripts\build.ps1 first."
        }

        Write-Host "Creating container and mapping host port $hostPort to container port $containerPort..."
        $runOutput = docker run -d --name $containerName -p "${hostPort}:${containerPort}" $imageName 2>&1
        if ($LASTEXITCODE -ne 0) {
            throw "Container could not be created. Check whether port $hostPort is already used and whether another container has the same name. Docker output: $runOutput"
        }
        Write-Host "Container created: $runOutput" -ForegroundColor Green
    }
    else {
        $isRunning = docker inspect --format "{{.State.Running}}" $containerName 2>$null
        if ($LASTEXITCODE -ne 0) {
            throw "Could not inspect container '$containerName'."
        }

        if ($isRunning -eq "true") {
            Write-Host "Container '$containerName' is already running." -ForegroundColor Green
        }
        else {
            Write-Host "Starting existing container '$containerName'..."
            docker start $containerName 2>&1 | Out-Host
            if ($LASTEXITCODE -ne 0) {
                throw "Existing container '$containerName' could not be started."
            }
            Write-Host "Existing container started." -ForegroundColor Green
        }
    }

    $portMapping = docker port $containerName "$containerPort/tcp" 2>$null
    if ($LASTEXITCODE -eq 0 -and $portMapping) {
        Write-Host "Port mapping: $portMapping" -ForegroundColor Green
    }

    Write-Host "Open the portfolio at http://localhost:$hostPort" -ForegroundColor Cyan
}
catch {
    Write-Error $_.Exception.Message
    exit 1
}
