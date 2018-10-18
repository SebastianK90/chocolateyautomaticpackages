import-module au

. $PSScriptRoot\..\telegram.install\update.ps1

function global:au_SearchReplace {
  @{
        "$($Latest.PackageName).nuspec" = @{
            "(\<dependency .+?`"$($Latest.PackageName).install`" version=)`"([^`"]+)`"" = "`$1`"$($Latest.Version)`""
        }
    }
 }

 function global:au_BeforeUpdate { }

update -ChecksumFor none
