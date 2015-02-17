<#
    .NOTES
        Created on : 2014-07-03
        Created by : Frank Peter Schultze, www.out-web.net

    .SYNOPSIS
        Wrapper function for "svn.exe import"

    .DESCRIPTION
        Commit an unversioned file or directory tree into the repository.

    .EXAMPLE
        Import-SvnUnversionedFilePath -Path .\myProject -Url https://myserver/svn/myrepo
#>
function Import-SvnUnversionedFilePath {
    [CmdletBinding()]
    Param (
        # The Path parameter identifies the path of an unversioned file or directory tree. If it is not given '.' is assumed.
        [Parameter()]
        [String]
        $Path = '.'
        ,
        # The Url parameter identifies the URL of the Subversion repository.
        [Parameter(Mandatory=$true)]
        [String]
        $Url
        ,
        # The Message parameter identifies a log message. If it is not given 'Import' is assumed.
        [Parameter()]
        [String]
        $Message = 'Import'
    )
    svn.exe import "$Path" "$Url" --message "$Message"
}

Set-Alias -Name ipsvn -Value Import-SvnUnversionedFilePath
