<#

.SYNOPSIS
 Wrapper function for "svn.exe add"

.DESCRIPTION
 Put files and directories under version control, scheduling them for addition
 to repository in next commit. 
 Only items with "?"-status are added to the working copy.

.EXAMPLE
 Add-SvnUnversionedItems -Path .\myProject\final.txt

#>
function Add-SvnUnversionedItems {
    [CmdletBinding(SupportsShouldProcess = $true)]
    Param (
        # Identifies the file or directory to be put under version control.
        [Parameter(Mandatory = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyname = $true)]
        [Alias('Name')]
        [String]
        $Path
    )
    Begin {
        Push-Location
    }
    Process {
        
        Set-Location $Path
        $unversionedSvnItems = & $SvnBinary status | Select-String -notmatch "bin|obj" | Select-String "^\?"
        foreach ($item in $unversionedSvnItems) {
            $item = $item.Line.Trim('?').Trim()
            $result = Read-Host -Promp "Add item: $item (y/n)" 
            if ($result -eq 'y') {
                if ($PSCmdlet.ShouldProcess($Path, "Add $item to working copy")) {
                    & $SvnBinary add $item
                }
            }
        }
    }
    End {
        Pop-Location
    }
}

Set-Alias -Name asvnui -Value Add-SvnUnversionedItems
