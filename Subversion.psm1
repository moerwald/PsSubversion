﻿<#

.SYNOPSIS
 Subversion Module, exposes a bunch of functions and aliases to work with
 Subversion working copies.

.DESCRIPTION
 Requires the Subversion command-line binary svn.exe

 The exposed functions provide only basic functionality and were successfully
 tested with the subversion command line client from
 http://www.collab.net/downloads/subversion

.NOTES
 Created on : 2014-07-03
 Updated on : 2017-01-06
 Created by : Frank Peter Schultze, www.out-web.net

 DISCLAIMER: This PowerShell module is provided "as is", without any warranty,
 whether express or implied, of its accuracy, completeness, fitness for a
 particular purpose, title or non-infringement, and none of the third-party
 products or information mentioned in the work are authored, recommended,
 supported or guaranteed by me. Further, I shall not be liable for any damages
 you may sustain by using this module, whether direct, indirect, special,
 incidental or consequential, even if it has been advised of the possibility
 of such damages.

#>

Write-Verbose 'Initializing Module...'

try
{
    $SvnBinary = (Get-Command -Name svn.exe -ErrorAction Stop).Path
}
catch
{
    'Subversion command-line binary not found - {0}' -f $svnBinary | Write-Error
    return
}

$SvnStatus = [PSCustomObject]@{
    NoModifications      = ' '
    Added                = 'A'
    Conflicted           = 'C'
    Deleted              = 'D'
    Ignored              = 'I'
    Modified             = 'M'
    Replaced             = 'R'
    UnversionedDirectory = 'X'
    UnversionedItem      = '?'
    Missing              = '!'
    Obstructed           = '~'
}

Get-ChildItem -Path $PSScriptRoot -Filter *.ps1 | ForEach-Object {. $_.FullName}

$orgPrompt = Get-Content -Path Function:\prompt
function prompt
{
  $prompt = & $orgprompt

  if (Test-Path -Path .svn)
  {
    $wc = Get-SvnWorkingCopy
    $UnversionedItem = @($wc | Where-Object {$_.Status -eq $SvnStatus.UnversionedItem}).Count
    $Added = @($wc | Where-Object {$_.Status -eq $SvnStatus.Added}).Count
    $Modified = @($wc | Where-Object {$_.Status -eq $SvnStatus.Modified}).Count
    $URL = ((svn info | sls "^Relative URL: *") -split " ")[2]

    Write-Host 'SVN ' -NoNewLine
    Write-Host "[$($SvnStatus.UnversionedItem):$UnversionedItem] " -NoNewLine 

    if ($Added -gt 0) {
            Write-Host "[$($SvnStatus.Added):$Added] " -NoNewLine -ForeGroundColor Red 
    }
    else {
            Write-Host "[$($SvnStatus.Added):$Added] " -NoNewLine 
    }

    if ($Modified -gt 0) {
            Write-Host "[$($SvnStatus.Modified):$Modified] " -NoNewLine -ForeGroundColor Red 
    }
    else {
            Write-Host "[$($SvnStatus.Modified):$Modified] " -NoNewLine 
    }

    Write-Host " - $URL -" -NoNewLine -ForeGroundColor Green


    #$p = 'SVN [{0}:{1}] [{2}:{3}] [{4}:{5}] - {7} - {6}' -f $SvnStatus.UnversionedItem, $UnversionedItem, $SvnStatus.Added, $Added, $SvnStatus.Modified, $Modified, $prompt, $URL
    #$p + "`r`n"
    $p = ($prompt -replace "PS ", " ") -replace ">", " "
    Write-Host $p -ForeGroundColor Cyan
    ">"
  }
  else
  {
    $prompt
  }
}
