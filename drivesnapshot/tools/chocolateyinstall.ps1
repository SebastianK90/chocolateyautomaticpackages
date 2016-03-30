$packageName= 'drivesnapshot'
$toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$url        =  'http://www.drivesnapshot.de/download/snapshot.exe'
$url64      =  'http://www.drivesnapshot.de/download/snapshot64.exe'

if (Get-ProcessorBits -eq '64')
{
$fullpath = Join-Path $toolsDir 'snapshot64.exe'
}
else
{
$fullpath = Join-Path $toolsDir 'snapshot.exe'
}

Get-ChocolateyWebFile $packageName $fullpath $url $url64
Install-ChocolateyPath $toolsDir
