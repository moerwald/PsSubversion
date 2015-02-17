<#
    .NOTES
        Created on : 2014-07-03
        Created by : Frank Peter Schultze, www.out-web.net

        DISCLAIMER: This PowerShell module is provided "as is", without any warranty,
        whether express or implied, of its accuracy, completeness, fitness for a
        particular purpose, title or non-infringement, and none of the third-party
        products or information mentioned in the work are authored, recommended,
        supported or guaranteed by me. Further, I shall not be liable for any damages
        you may sustain by using this module, whether direct, indirect, special,
        incidental or consequential, even if it has been advised of the possibility
        of such damages.

    .SYNOPSIS
        Subversion Module, exposes a bunch of functions and aliases to work with
        Subversion working copies.

    .DESCRIPTION
        Requires the Subversion command-line binary svn.exe

        The exposed functions provide only basic functionality and were successfully
        tested with the subversion command line client from
        http://www.collab.net/downloads/subversion.
#>

$reqdExe = 'svn.exe'

if (Get-Command -Name $reqdExe -ErrorAction SilentlyContinue) {

    Write-Verbose 'Initializing Module...'

    function prompt {
        if (Test-Path -Path .svn) {
            $unknownItem = $addedItem = $modifiedItem = 0
            switch -Regex (svn.exe status) {
                '^?' {$unknownItem += 1}
                '^A' {$addedItem += 1}
                '^M' {$modifiedItem += 1}
                default {}
            }
            "SVN [?:$unknownItem] [a:$addedItem] [m:$modifiedItem] $($executionContext.SessionState.Path.CurrentLocation)$('>' * ($nestedPromptLevel + 1)) "
        }
        else {
            "PS $($executionContext.SessionState.Path.CurrentLocation)$('>' * ($nestedPromptLevel + 1)) "
        }
    }

    Get-ChildItem $PSScriptRoot\*.ps1 | ForEach-Object {
        . $_.FullName
    }
}
else {
    Write-Error 'Subversion command-line binary svn.exe not found.'
}

