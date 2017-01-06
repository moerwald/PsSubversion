<#

.SYNOPSIS
 Wrapper function for "svn.exe status"

.DESCRIPTION
 Get the status of working copy files and directories.

.EXAMPLE
 Get-SvnWorkingCopy -Path .\myProject

#>
function Get-SvnWorkingCopy
{
    [CmdletBinding()]
    Param (
        # Identifies the directory of the working copy.
        [Parameter(ValueFromPipeline=$true)]
        [String]
        $Path = '.'
    )

    $regex = '^(?<Status>\S{1})*\s+(?<File>.+)$'
    & $SvnBinary status `"$Path`" | Where-Object {$_ -match $regex} | ForEach-Object {
        [PSCustomObject]@{
            Name   = $Matches.File
            Status = $Matches.Status
        }
    }
}

Set-Alias -Name gsvnwc -Value Get-SvnWorkingCopy
