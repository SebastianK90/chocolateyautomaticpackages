import-module au

$releases = 'http://www.sordum.org/7615/'

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_GetLatest {

    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $content = $download_page.Content

    $pattern = '(?<=content="Sordum")[\S\s]*Easy Context menu v(?<Version>[\d\.]+)'

    $version = [regex]::Match($content, $pattern).groups['Version'].value
        
    $url     = 'https://www.sordum.org/files/easy-context-menu/ec_menu.zip'

    $current_checksum = (gi $PSScriptRoot\tools\chocolateyInstall.ps1 | sls '^[$]checksum32\b') -split "=|'" | Select -Last 1 -Skip 1
    if ($current_checksum.Length -ne 64) { throw "Can't find current checksum" }
    $remote_checksum  = Get-RemoteChecksum $url
    if ($current_checksum -ne $remote_checksum) {
        Write-Host 'Remote checksum is different then the current one, forcing update'
        $global:au_old_force = $global:au_force
        $global:au_force = $true
    }

    @{
        Version    = $version
        URL32      = $url
        Checksum32 = $remote_checksum
    }
}

update -ChecksumFor none
if ($global:au_old_force -is [bool]) { $global:au_force = $global:au_old_force }
