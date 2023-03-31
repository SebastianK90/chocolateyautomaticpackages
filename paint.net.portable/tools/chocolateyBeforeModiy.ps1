$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path $MyInvocation.MyCommand.Definition

Get-Process paintdotnet -ErrorAction SilentlyContinue | Stop-Process -ErrorAction SilentlyContinue
Remove-Item $toolsPath\*.zip -ErrorAction SilentlyContinue

#for cleaning up / migration to C:\tools - will be removed after this version 5.0.3
Remove-Item -Path C:\ProgramData\chocolatey\lib\paint.net.portable\tools -Exclude '*.ps1' -Recurse
