<#

.SYNOPSIS
 Wrapper function for "svn.exe import"

.DESCRIPTION
 Commit an unversioned file or directory tree into the repository.

.EXAMPLE
 Import-SvnUnversionedFilePath -Path .\myProject -Url https://myserver/svn/myrepo

#>
function Import-SvnUnversionedFilePath
{
    [CmdletBinding(SupportsShouldProcess=$true)]
    Param (
        # Identifies the path of an unversioned file or directory tree. If it is not given '.' is assumed.
        [Parameter(ValueFromPipeline=$true)]
        [String]
        $Path = '.'
        ,
        # Identifies the URL of the Subversion repository.
        [Parameter(Mandatory=$true)]
        [String]
        $Url
        ,
        # Identifies a log message.
        [Parameter(Mandatory=$true)]
        [String]
        $Message
    )
    Begin
    {
    }
    Process
    {
        if ($PSCmdlet.ShouldProcess($Url, "Import $Path into repository"))
        {
            & $SvnBinary import `"$Path`" `"$Url`" --message `"$Message`"
        }
    }
    End
    {
    }
}

Set-Alias -Name ipsvn -Value Import-SvnUnversionedFilePath
