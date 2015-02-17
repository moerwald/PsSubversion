<#
    .NOTES
        Created on : 2015-02-12
        Created by : Frank Peter Schultze, www.out-web.net

    .SYNOPSIS
        Wrapper function for "svn.exe switch"

    .DESCRIPTION
        Update the working copy to a different URL within the same repository.

    .EXAMPLE
        Switch-SvnWorkingCopy -Url https://myserver/svn/myrepo
#>
function Switch-SvnWorkingCopy {
    [CmdletBinding()]
    Param (
        # The Url parameter identifies the new URL with the repository.
        [Parameter(Mandatory=$true)]
        [String]
        $Url
    )
    svn.exe switch "$Url"
}

Set-Alias -Name swsvnwc -Value Switch-SvnWorkingCopy
