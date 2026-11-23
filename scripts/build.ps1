#Requires -Version 5.1
$ErrorActionPreference = "Stop"

$scriptDirectory = Split-Path -Parent $MyInvocation.MyCommand.Path
$projectRoot = Split-Path -Parent $scriptDirectory

Write-Host "Building Docker image 'portfolio-website' from: $projectRoot" -ForegroundColor Cyan

Push-Location -LiteralPath $projectRoot
try {
    docker build -t portfolio-website .
    if ($LASTEXITCODE -ne 0) {
        throw "Docker build failed with exit code $LASTEXITCODE. Check that Docker Desktop is running and read the build output above."
    }
    Write-Host "Docker image 'portfolio-website' built successfully." -ForegroundColor Green
}
catch {
    Write-Error $_.Exception.Message
    exit 1
}
finally {
    Pop-Location
}
