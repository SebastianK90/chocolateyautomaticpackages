$ErrorActionPreference = 'Stop'

$packageName = 'mp3gain-gui'
$url32       = 'https://sourceforge.net/projects/mp3gain/files/MP3Gain-Windows%20%28Stable%29/1.2.5/mp3gain-win-full-1_2_5.exe/download'
$checksum32  = 'b3515abe190eb4098a40d76865ada6b3f2dd8aad02e9652387172510e781dc00'
$toolsPath   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

$packageArgs = @{
  packageName            = $packageName
  fileType               = 'EXE'
  url                    = $url32
  checksum               = $checksum32
  checksumType           = 'sha256'
  silentArgs             = '/S'
  validExitCodes         = @(0)
  registryUninstallerKey = $packageName
}

Install-ChocolateyPackage @packageArgs

$FileFullPath = get-childitem $toolsPath -recurse -include *.ini

if (Get-ProcessorBits -eq '64')
     
        {
            foreach ($file in $FileFullPath)
                {
                    Copy-Item $file.FullName "${env:ProgramFiles(x86)}\MP3Gain\" -Force
                }
        
        }
    else 
        {
             foreach ($file in $FileFullPath)
                {
                    Copy-Item $file.FullName "$env:ProgramFiles\MP3Gain\" -Force
                }
        }

$lang = @{"1026" = "BULGARIAN.MP3GAIN.INI"; 
"1027"="CATALÀ.MP3GAIN.INI";
"1029"="CESKY.MP3GAIN.INI";
"2052"="CHINESE(SIMPLIFIED).MP3GAIN.INI";
"1028"="CHINESE(TRADITIONAL).MP3GAIN.INI";
"1031"="DEUTSCH.MP3GAIN.INI";
"3079"="DEUTSCH.MP3GAIN.INI";
"5127"="DEUTSCH.MP3GAIN.INI";
"4103"="DEUTSCH.MP3GAIN.INI";
"2055"="DEUTSCH.MP3GAIN.INI";
"2067"="DUTCH.MP3GAIN.INI";
"3082"="ESPAÑOL.MP3GAIN.INI";
"1034"="ESPAÑOL.MP3GAIN.INI";
"11274"="ESPAÑOL.MP3GAIN.INI";
"16394"="ESPAÑOL.MP3GAIN.INI";
"13322"="ESPAÑOL.MP3GAIN.INI";
"9226"="ESPAÑOL.MP3GAIN.INI";
"5130"="ESPAÑOL.MP3GAIN.INI";
"7178"="ESPAÑOL.MP3GAIN.INI";
"12298"="ESPAÑOL.MP3GAIN.INI";
"17418"="ESPAÑOL.MP3GAIN.INI";
"4106"="ESPAÑOL.MP3GAIN.INI";
"18442"="ESPAÑOL.MP3GAIN.INI";
"22538"="ESPAÑOL.MP3GAIN.INI";
"2058"="ESPAÑOL.MP3GAIN.INI";
"19466"="ESPAÑOL.MP3GAIN.INI";
"6154"="ESPAÑOL.MP3GAIN.INI";
"15370"="ESPAÑOL.MP3GAIN.INI";
"10250"="ESPAÑOL.MP3GAIN.INI";
"20490"="ESPAÑOL.MP3GAIN.INI";
"21514"="ESPAÑOL.MP3GAIN.INI";
"14346"="ESPAÑOL.MP3GAIN.INI";
"8202"="ESPAÑOL.MP3GAIN.INI";
"1035"="FINNISH.MP3GAIN.INI";
"1036"="FRENCH.MP3GAIN.INI";
"2060"="FRENCH.MP3GAIN.INI";
"11276"="FRENCH.MP3GAIN.INI";
"3084"="FRENCH.MP3GAIN.INI";
"9228"="FRENCH.MP3GAIN.INI";
"12300"="FRENCH.MP3GAIN.INI";
"15372"="FRENCH.MP3GAIN.INI";
"5132"="FRENCH.MP3GAIN.INI";
"13324"="FRENCH.MP3GAIN.INI";
"6156"="FRENCH.MP3GAIN.INI";
"14348"="FRENCH.MP3GAIN.INI";
"58380"="FRENCH.MP3GAIN.INI";
"8204"="FRENCH.MP3GAIN.INI";
"10252"="FRENCH.MP3GAIN.INI";
"4108"="FRENCH.MP3GAIN.INI";
"7180"="FRENCH.MP3GAIN.INI";
"1032"="GREEK.MP3GAIN.INI";
"1037"="HEBREW.MP3GAIN.INI";
"1050"="HRVATSKI.MP3GAIN.INI";
"4122"="HRVATSKI.MP3GAIN.INI";
"1040"="ITALIAN.MP3GAIN.INI";
"1041"="JAPANESE.MP3GAIN.INI";
"1042"="KOREAN.MP3GAIN.INI";
"1038"="MAGYAR.MP3GAIN.INI";
"1043"="NEDERLANDS.MP3GAIN.INI";
"1045"="POLISH.MP3GAIN.INI";
"1046"="PORTUGUES (BRASIL).MP3GAIN.INI";
"2070"="PORTUGUES.MP3GAIN.INI";
"1048"="ROMANIAN.MP3GAIN.INI";
"2072"="ROMANIAN.MP3GAIN.INI";
"1049"="RUSSIAN.MP3GAIN.INI";
"2073"="RUSSIAN.MP3GAIN.INI";
"1051"="SLOVENSKY.MP3GAIN.INI";
"1060"="SLOVENSKY.MP3GAIN.INI";
"3098"="SRPSKI.MP3GAIN.INI";
"2074"="SRPSKI.MP3GAIN.INI";
"1055"="TURKISH.MP3GAIN.INI";
"2115"="UZBEK.MP3GAIN.INI";
"1091"="UZBEK.MP3GAIN.INI";
"1033"="ORIGINAL";
"2057"="ORIGINAL";
"3081"="ORIGINAL";
"10249"="ORIGINAL";
"4105"="ORIGINAL";
"9225"="ORIGINAL";
"15369"="ORIGINAL";
"16393"="ORIGINAL";
"14345"="ORIGINAL";
"6153"="ORIGINAL";
"8201"="ORIGINAL";
"17417"="ORIGINAL";
"5129"="ORIGINAL";
"13321"="ORIGINAL";
"18441"="ORIGINAL";
"7177"="ORIGINAL";
"11273"="ORIGINAL";
"12297"="ORIGINAL"
}

$lang_setting = $lang.get_Item((Get-Culture).LCID.ToString())
 
New-Item 'HKCU:\Software\VB and VBA Program Settings\MP3GainAnalysis\StartUp' -Force
New-ItemProperty 'HKCU:\Software\VB and VBA Program Settings\MP3GainAnalysis\StartUp' -Name 'LanguageFile' -Value $lang_setting -Force
