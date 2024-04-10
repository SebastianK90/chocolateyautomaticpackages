Import-Module Chocolatey-AU

$releases = 'https://sourceforge.net/projects/dispcalgui/files/release/'

function global:au_SearchReplace {
  @{
        "$($Latest.PackageName).nuspec" = @{
            "(\<dependency .+?`"dispcalgui.portable`" version=)`"([^`"]+)`"" = "`$1`"[$($Latest.Version)]`""
        }
    }
 }

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $latest = ($download_page.links | Where-Object {$_ -like '*Click to enter*'} | Select-Object -ExpandProperty title -First 3).substring(15)
    $url32 = (Invoke-WebRequest -Uri ($releases + $latest[0])).Links
    
   if ($url32 = ((Invoke-WebRequest -Uri ($releases + $latest[0])).Links | Where-Object ({$_.href -like "*win32.zip/download*"})).href)
    {

        [string]$version =  [regex]::match($url32,'[0-9]+(\.[0-9]+)*').value

    }
  elseif($url32 = ((Invoke-WebRequest -Uri ($releases + $latest[1])).Links | Where-Object ({$_.href -like "*win32.zip/download*"})).href)

    {
       [string]$version =  [regex]::match($url32,'[0-9]+(\.[0-9]+)*').value
    }

  elseif($url32 = ((Invoke-WebRequest -Uri ($releases + $latest[2])).Links | Where-Object ({$_.href -like "*win32.zip/download*"})).href)

    {
       [string]$version =  [regex]::match($url32,'[0-9]+(\.[0-9]+)*').value
    }
    
     return @{Version = $version }
}

update -ChecksumFor none