<#
    .NOTES
        Created on : 2014-07-03
        Created by : Frank Peter Schultze, www.out-web.net

    .SYNOPSIS
        Wrapper function for "svn.exe checkout"

    .DESCRIPTION
        Check out a working copy from a repository (HEAD revision).

    .EXAMPLE
        New-SvnWorkingCopy -Url https://myserver/svn/myrepo -Path .\myProject
#>
function New-SvnWorkingCopy {
    [CmdletBinding()]
    Param (
        # The Url parameter identifies the URL of the Subversion repository.
        [Parameter(Mandatory=$true)]
        [String]
        $Url
        ,
        # The Path parameter identifies an non-existing directory for the working copy.
        [Parameter(Mandatory=$true)]
        [String]
        $Path
    )
    svn.exe checkout "$Url" "$Path"
}

Set-Alias -Name nsvnwc -Value New-SvnWorkingCopy
