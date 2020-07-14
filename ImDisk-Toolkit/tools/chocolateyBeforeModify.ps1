$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
$toolkitPath = Join-Path -Path $toolsPath -ChildPath 'toolkit'

# this will remove older versions that are not installed to the new $toolkitPath
if (Test-Path -Path (Join-Path -Path $toolsPath -ChildPath 'config.exe')) {
    Get-ChildItem -Path $toolspath -Exclude 'chocolatey*.ps1' | Remove-Item -Recurse -ErrorAction SilentlyContinue
}
else {
    Get-ChildItem -Path $toolkitPath -Recurse | Remove-Item -Recurse -ErrorAction SilentlyContinue
}