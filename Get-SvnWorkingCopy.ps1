<#
    .NOTES
        Created on : 2014-07-03
        Created by : Frank Peter Schultze, www.out-web.net

    .SYNOPSIS
        Wrapper function for "svn.exe status"

    .DESCRIPTION
        Print the status of working copy files and directories.

    .EXAMPLE
        Get-SvnWorkingCopy -Path .\myProject
#>
function Get-SvnWorkingCopy {
    [CmdletBinding()]
    Param (
        # The Path parameter identifies the directory of the working copy.
        [Parameter(Mandatory=$true, Position=0)]
        [String]
        $Path
    )
    svn.exe status "$Path"
}

Set-Alias -Name gsvnwc -Value Get-SvnWorkingCopy
