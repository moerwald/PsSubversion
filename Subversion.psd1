#
# Modulmanifest für das Modul "Subversion"
#
# Generiert von: Frank Peter Schultze
#
# Generiert am: 05.06.2016
#

@{

RootModule = 'Subversion.psm1'

ModuleVersion = '1.2.2'

GUID = '11a32e85-fd6f-4954-8bf5-6c710221dc74'

Author = 'Frank Peter Schultze'

CompanyName = 'www.out-web.net'

Copyright = 'Frank Peter Schultze'

Description = 'Wrapper functions for Subversion svn.exe'

PowerShellVersion = '2.0'

# PowerShellHostName = ''

# PowerShellHostVersion = ''

# DotNetFrameworkVersion = ''

# CLRVersion = ''

ProcessorArchitecture = 'None'

# RequiredModules = @()

RequiredAssemblies = @()

ScriptsToProcess = @()

TypesToProcess = @()

FormatsToProcess = @()

# NestedModules = @()

FunctionsToExport = 'prompt', 'Add-SvnWorkingCopyItem', 'Get-SvnWorkingCopy', 
               'Import-SvnUnversionedFilePath', 'New-SvnWorkingCopy', 
               'Publish-SvnWorkingCopy', 'Remove-SvnWorkingCopyItem', 
               'Repair-SvnWorkingCopy', 'Switch-SvnWorkingCopy', 
               'Update-SvnWorkingCopy'

CmdletsToExport = @()

VariablesToExport = @()

AliasesToExport = 'swsvnwc', 'udsvnwc', 'asvnwci', 'gsvnwc', 'ipsvn',
               'nsvnwc', 'pbsvnwc', 'rsvnwci'

# DscResourcesToExport = @()

# ModuleList = @()

FileList = @()

PrivateData = @{

    PSData = @{

        Tags = 'SVN','Subversion','VersionControl'

        # LicenseUri = ''

        ProjectUri = 'https://github.com/fpschultze/PsSubversion'

        # IconUri = ''

        # ReleaseNotes of this module
        ReleaseNotes = 'Get-SvnWorkingCopy supports file names with white space characters'

        # ExternalModuleDependencies = ''

    } # End of PSData hashtable
    
 } # End of PrivateData hashtable

# HelpInfoURI = ''

# DefaultCommandPrefix = ''

}

