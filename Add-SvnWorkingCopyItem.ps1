<#
    .NOTES
        Created on : 2014-07-03
        Created by : Frank Peter Schultze, www.out-web.net

    .SYNOPSIS
        Wrapper function for "svn.exe add"

    .DESCRIPTION
        Put files and directories under version control, scheduling them for addition to repository in next commit.

    .EXAMPLE
        Add-SvnWorkingCopyItem -Path .\myProject\final.txt
#>
function Add-SvnWorkingCopyItem {
    [CmdletBinding()]
    Param (
        # The Path parameter identifies the file or directory to be put under version control.
        [Parameter(Mandatory=$true, Position=0)]
        [String]
        $Path
    )
    svn.exe add "$Path"
}

Set-Alias -Name asvnwci -Value Add-SvnWorkingCopyItem
