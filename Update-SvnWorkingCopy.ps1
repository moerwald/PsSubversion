<#
    .NOTES
        Created on : 2014-07-03
        Created by : Frank Peter Schultze, www.out-web.net

    .SYNOPSIS
        Wrapper function for "svn.exe update"

    .DESCRIPTION
        Bring the latest changes from the repository into the working copy (HEAD revision).

    .EXAMPLE
        Update-SvnWorkingCopy -Path .\myProject
#>
function Update-SvnWorkingCopy {
    [CmdletBinding()]
    Param (
        # The Path parameter identifies the directory of the working copy.
        [Parameter(Mandatory=$true, Position=0)]
        [String]
        $Path
    )
    svn.exe update "$Path"
}

Set-Alias -Name udsvnwc -Value Update-SvnWorkingCopy
