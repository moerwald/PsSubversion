<#
    .NOTES
        Created on : 2014-07-03
        Created by : Frank Peter Schultze, www.out-web.net

    .SYNOPSIS
        Wrapper function for "svn.exe commit"

    .DESCRIPTION
        Send changes from your working copy to the repository.

    .EXAMPLE
        Publish-SvnWorkingCopy -Path .\myProject -Message 'Fixed bug #456'
#>
function Publish-SvnWorkingCopy {
    [CmdletBinding()]
    Param (
        # The Path parameter identifies the directory of the working copy.
        [Parameter(Mandatory=$true)]
        [String]
        $Path
        ,
        # The Message parameter identifies a log message. If it is not given PowerShell will prompt for it.
        [Parameter(Mandatory=$true)]
        [String]
        $Message
    )
    svn.exe commit "$Path" --message "$Message"
}

Set-Alias -Name pbsvnwc -Value Publish-SvnWorkingCopy
