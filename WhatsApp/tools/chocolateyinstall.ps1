  $packageName= 'WhatsApp'
  $toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
  $installerType = 'EXE'
  $url        =  'https://web.whatsapp.com/desktop/windows/release/ia32/WhatsAppSetup.exe'
  $url64 = 'https://web.whatsapp.com/desktop/windows/release/x64/WhatsAppSetup.exe'
  Install-ChocolateyPackage $packageName $fileType $silentArgs $url $url64
  
  