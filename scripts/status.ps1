#Requires -Version 5.1
$ErrorActionPreference = "Stop"

$containerName = "portfolio-container"
$imageName = "portfolio-website:latest"
$localUrl = "http://localhost:8080"

Write-Host "Docker image status:" -ForegroundColor Cyan
$imageId = docker images -q $imageName
if ($LASTEXITCODE -ne 0) {
    Write-Host "Could not query Docker images. Is Docker Desktop running?" -ForegroundColor Red
}
elseif ([string]::IsNullOrWhiteSpace($imageId)) {
    Write-Host "Image '$imageName' was not found. Run .\scripts\build.ps1." -ForegroundColor Yellow
}
else {
    docker images $imageName --format "table {{.Repository}}\t{{.Tag}}\t{{.ID}}\t{{.CreatedSince}}\t{{.Size}}"
}

Write-Host ""
Write-Host "Container status:" -ForegroundColor Cyan
$matches = docker ps -a --filter "name=^/$containerName$" --format "{{.Names}}"
if ($LASTEXITCODE -ne 0 -or $matches -ne $containerName) {
    Write-Host "No container named '$containerName' exists. Run .\scripts\run.ps1." -ForegroundColor Yellow
}
else {
    docker ps -a --filter "name=^/$containerName$" --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"

    $isRunning = docker inspect --format "{{.State.Running}}" $containerName 2>$null
    if ($LASTEXITCODE -eq 0 -and $isRunning -eq "true") {
        $portMapping = docker port $containerName "80/tcp" 2>$null
        if ($LASTEXITCODE -eq 0 -and $portMapping) {
            Write-Host "Port mapping: $portMapping" -ForegroundColor Green
        }

        try {
            $response = Invoke-WebRequest -Uri $localUrl -UseBasicParsing -TimeoutSec 5
            Write-Host "HTTP check: $localUrl returned $($response.StatusCode) ($($response.RawContentLength) bytes)." -ForegroundColor Green
        }
        catch {
            Write-Host "HTTP check failed for $localUrl. $($_.Exception.Message)" -ForegroundColor Red
        }
    }
}
