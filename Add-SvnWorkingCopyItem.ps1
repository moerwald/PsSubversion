<#

.SYNOPSIS
 Wrapper function for "svn.exe add"

.DESCRIPTION
 Put files and directories under version control, scheduling them for addition
 to repository in next commit.

.EXAMPLE
 Add-SvnWorkingCopyItem -Path .\myProject\final.txt

#>
function Add-SvnWorkingCopyItem
{
    [CmdletBinding(SupportsShouldProcess=$true)]
    Param (
        # Identifies the file or directory to be put under version control.
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
        if ($PSCmdlet.ShouldProcess($Path, 'Add to working copy'))
        {
            & $SvnBinary add `"$Path`"
        }
    }
    End
    {
    }
}

Set-Alias -Name asvnwci -Value Add-SvnWorkingCopyItem
