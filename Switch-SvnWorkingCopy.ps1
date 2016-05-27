<#

.SYNOPSIS
 Wrapper function for "svn.exe switch"

.DESCRIPTION
 Update the working copy to a different URL within the same repository.

.EXAMPLE
 Switch-SvnWorkingCopy -Url https://myserver/svn/myrepo

#>
function Switch-SvnWorkingCopy
{
    [CmdletBinding()]
    Param (
        # Identifies the new URL with the repository.
        [Parameter(Mandatory=$true)]
        [String]
        $Url
    )
    & $SvnBinary switch `"$Url`"
}

Set-Alias -Name swsvnwc -Value Switch-SvnWorkingCopy
