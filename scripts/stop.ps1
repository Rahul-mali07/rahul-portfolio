#Requires -Version 5.1
$ErrorActionPreference = "Stop"

$containerName = "portfolio-container"

function Test-ContainerExists {
    $matches = docker ps -a --filter "name=^/$containerName$" --format "{{.Names}}"
    return ($LASTEXITCODE -eq 0 -and $matches -eq $containerName)
}

try {
    if (-not (Test-ContainerExists)) {
        Write-Host "No container named '$containerName' exists. Nothing was stopped." -ForegroundColor Yellow
        exit 0
    }

    $isRunning = docker inspect --format "{{.State.Running}}" $containerName 2>$null
    if ($LASTEXITCODE -ne 0) {
        throw "Could not inspect container '$containerName'."
    }

    if ($isRunning -ne "true") {
        Write-Host "Container '$containerName' is already stopped." -ForegroundColor Yellow
        exit 0
    }

    Write-Host "Stopping container '$containerName'..."
    docker stop $containerName 2>&1 | Out-Host
    if ($LASTEXITCODE -ne 0) {
        throw "Container '$containerName' could not be stopped."
    }
    Write-Host "Container '$containerName' stopped. It was not removed." -ForegroundColor Green
}
catch {
    Write-Error $_.Exception.Message
    exit 1
}
