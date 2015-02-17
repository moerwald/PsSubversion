<#
    .NOTES
        Created on : 2014-07-03
        Created by : Frank Peter Schultze, www.out-web.net

    .SYNOPSIS
        Wrapper function for "svn.exe delete"

    .DESCRIPTION
        Remove files and directories from version control. Each item specified by Path is scheduled for deletion upon the next commit. Items that have not been committed, are immediately removed from the working copy.

    .EXAMPLE
        Remove-SvnWorkingCopyItem -Path .\myProject\test.txt
#>
function Remove-SvnWorkingCopyItem {
    [CmdletBinding()]
    Param (
        # The Path parameter identifies the file or directory to be removed from version control.
        [Parameter(Mandatory=$true, Position=0)]
        [String]
        $Path
    )
    svn.exe delete "$Path"
}

Set-Alias -Name rsvnwci -Value Remove-SvnWorkingCopyItem
