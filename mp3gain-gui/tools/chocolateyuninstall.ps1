$toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
if (Get-ProcessorBits -eq '64')
    {
    Start-Process "${env:ProgramFiles(x86)}\MP3Gain\uninst-mp3gain.exe"
    }
    else
    {
    Start-Process "$env:ProgramFiles\MP3Gain\uninst-mp3gain.exe"
    }
    

Autohotkey.exe $toolsDir\uninstall.ahk