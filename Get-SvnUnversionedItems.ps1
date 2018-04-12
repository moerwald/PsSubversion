<#

.SYNOPSIS
 Lists all files with the given extension that were not added to subversion.


.EXAMPLE
 "cs" | Get-SvnUnversionedItems

#>

function Get-SvnUnversionedItems {
    [CmdletBinding(SupportsShouldProcess=$false)]
    param (
        [Parameter(ValueFromPipeline=$true, Mandatory=$true)]
        [string[]] $fileEndingsToSearchFor
    )
    
    begin {
        $findings = @()
    }
    
    process {
        $findings +=  & $SvnBinary status | Select-String ".*.$_$" | Select-String "^\?.*" | ForEach-Object { $_.Line.split('?')[1].Trim()} 
    }
    
    end {
        $findings
    }
}