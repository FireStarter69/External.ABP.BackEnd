$currentFolder = $PSScriptRoot

$slnFolder = Join-Path $currentFolder "../"
$certsFolder = Join-Path $currentFolder "certs"

If(!(Test-Path -Path $certsFolder))
{
    New-Item -ItemType Directory -Force -Path $certsFolder
    if(!(Test-Path -Path (Join-Path $certsFolder "localhost.pfx") -PathType Leaf)){
        Set-Location $certsFolder
        dotnet dev-certs https -v -ep localhost.pfx -p c8dfe4de-d88f-4c33-b7c5-3bac2214413e -t        
    }
}

Set-Location $currentFolder
docker-compose up -d