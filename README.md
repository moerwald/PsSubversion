# PsSubversion
Subversion PowerShell Module

The Subversion module exposes a bunch of functions and aliases to work with Subversion/SVN working copies.

The function Update-SvnWorkingCopy (Alias udsvnwc) is a wrapper for "svn.exe update" and brings the latest changes (HEAD revision) from the repository into an existing working copy.
The function Publish-SvnWorkingCopy (Alias pbsvnwc) is a wrapper for "svn.exe commit" and sends the changes from your working copy to the repository.
The function Import-SvnUnversionedFilePath (Alias ipsvn) is a wrapper for "svn.exe import" and commits an unversioned file or directory tree into the repository.
The function New-SvnWorkingCopy (Alias nsvnwc) is a wrapper for "svn.exe checkout" and checks out a working copy from a repository (HEAD revision).
The function Get-SvnWorkingCopy (Alias gsvnwc) is a wrapper for "svn.exe status" and returns the status of working copy files and directories.
The function Add-SvnWorkingCopyItem (Alias asvnwci) is a wrapper for "svn.exe add" and puts files and directories under version control, that is scheduling them for addition to repository in next commit.
The function Remove-SvnWorkingCopyItem (Alias rsvnwci) is a wrapper for "svn.exe delete" and removes files and directories from version control, this is scheduling them for deletion upon the next commit. (Items that have not been committed are immediately removed from the working copy.)
The function Repair-SvnWorkingCopy fixes a working copy that has been modified by non-svn commands in terms of file addition and removal. The function identifies items that are not under version control and items that are missing. It puts non-versioned items under version control, and it removes missing items from version control (i.e. schedule for deletion upon next commit)

The functions provide only basic functionality and work fine with the subversion command line client svn.exe from http://www.collab.net/downloads/subversion