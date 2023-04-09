$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path $MyInvocation.MyCommand.Definition

Get-Process paintdotnet -ErrorAction SilentlyContinue | Stop-Process -ErrorAction SilentlyContinue
Remove-Item $toolsPath\*.zip -ErrorAction SilentlyContinue
