<#

.SYNOPSIS
 Wrapper function for "svn.exe delete"

.DESCRIPTION
 Remove files and directories from version control. Each item specified by Path
 is scheduled for deletion upon the next commit. Items that have not been
 committed, are immediately removed from the working copy.

.EXAMPLE
 Remove-SvnWorkingCopyItem -Path .\myProject\test.txt

#>
function Remove-SvnWorkingCopyItem
{
    [CmdletBinding(SupportsShouldProcess=$true)]
    Param (
        # Identifies the file or directory to be removed from version control.
        [Parameter(Mandatory=$true,
                   ValueFromPipeline=$true,
                   ValueFromPipelineByPropertyname=$true)]
        [Alias('Name')]
        [String]
        $Path
    )
    Begin
    {
    }
    Process
    {
        if ($PSCmdlet.ShouldProcess($Path, 'Remove from version control'))
        {
            & $SvnBinary delete `"$Path`"
        }
    }
    End
    {
    }
}

Set-Alias -Name rsvnwci -Value Remove-SvnWorkingCopyItem
