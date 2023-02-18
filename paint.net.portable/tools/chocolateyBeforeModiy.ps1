$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path $MyInvocation.MyCommand.Definition

Remove-Item $toolsPath\*.zip -ea 0