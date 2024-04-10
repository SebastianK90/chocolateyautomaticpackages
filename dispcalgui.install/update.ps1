Import-Module Chocolatey-AU

$releases = 'https://sourceforge.net/projects/dispcalgui/files/release/'

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*packageName\s*=\s*)('.*')"  = "`$1'$($Latest.PackageName)'"
        }


        ".\legal\VERIFICATION.txt" = @{
          "(?i)(\s+x32:).*"            = "`${1} $($Latest.URL32)"
          "(?i)(checksum32:).*"        = "`${1} $($Latest.Checksum32)"
        }
    }
}

function global:au_BeforeUpdate { Get-RemoteFiles -Purge -FileNameBase 'DisplayCAL-Setup.exe'}


function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $latest = ($download_page.links | Where-Object {$_ -like '*Click to enter*'} | Select-Object -ExpandProperty title -First 3).substring(15)
    $url32 = (Invoke-WebRequest -Uri ($releases + $latest[0])).Links
    
   if ($url32 = ((Invoke-WebRequest -Uri ($releases + $latest[0])).Links | Where-Object ({$_.href -like "*Setup.exe/download*"})).href){

        [string]$version =  [regex]::match($url32,'[0-9]+(\.[0-9]+)*').value

        }
  elseif($url32 = ((Invoke-WebRequest -Uri ($releases + $latest[1])).Links | Where-Object ({$_.href -like "*Setup.exe/download*"})).href){
       [string]$version =  [regex]::match($url32,'[0-9]+(\.[0-9]+)*').value

       }

  elseif($url32 = ((Invoke-WebRequest -Uri ($releases + $latest[2])).Links | Where-Object ({$_.href -like "*Setup.exe/download*"})).href){

       [string]$version =  [regex]::match($url32,'[0-9]+(\.[0-9]+)*').value
       }

     @{
        URL32        = $url32
        FileType     = 'exe'
        Version      = $version
    }
}


Update-Package -ChecksumFor none