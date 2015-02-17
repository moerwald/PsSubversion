<#
    .NOTES
        Created on : 2014-07-03
        Created by : Frank Peter Schultze, www.out-web.net

    .SYNOPSIS
        Fix a working copy that has been modified by non-svn commands in terms of adding and removing files.

    .DESCRIPTION
        Identify items that are not under version control and items that are missing (i.e. removed by non-svn command).
        Put non-versioned items under version control (i.e. schedule for adding upon next commit).
        Remove missing items from version control (i.e. schedule for deletion upon next commit).

    .EXAMPLE
        Repair-SvnWorkingCopy -Path .\myProject
#>
function Repair-SvnWorkingCopy {
    [CmdletBinding()]
    Param (
        # The Path parameter identifies the directory of the working copy.
        [Parameter(Mandatory=$true, Position=0)]
        [String]
        $Path
    )

    Set-Variable -Name C_SVN_ITEM_MISSING -Value '!' -Option ReadOnly
    Set-Variable -Name C_SVN_ITEM_UNKNOWN -Value '?' -Option ReadOnly

    Get-SvnWorkingCopy -Path $Path |
        Where-Object {$_ -match '^(?<Status>\S)\s+(?<File>\S+)$'} |
            ForEach-Object {
                $Status = $Matches.Status
                $File   = $Matches.File
                switch ($Status) {
                    $C_SVN_ITEM_MISSING {
                        Remove-SvnWorkingCopyItem -Path "$File"
                    }
                    $C_SVN_ITEM_UNKNOWN {
                        Add-SvnWorkingCopyItem -Path "$File"
                    }
                }
            }
}
