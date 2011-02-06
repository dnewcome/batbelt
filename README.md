# About

Batbelt is a small toolkit for bootstrapping utilities on Windows machines. Batbelt is not a 
full package manager but has some things in common with tools like apt on Linux. It is
implemented using simple Windows batch scripts and uses 7zip, pscp and curl
for archiving and copying files.

# Motivation

Batbelt was created out of a need for the me to have access to the many small
tools that I download repeatedly from the Web every time I work on a new Windows
machine in the course of my consulting work. Often times I need to leave the 
client's machine clean as I found it afterward, so Batbelt was designed with zero
footprint in mind. 

For example, I would download Putty over and over again, and I would hesitate to 
put it in the path for fear that I would forget to delete it or remove it from 
the path when finished. Batbelt allows you to set up the tool once and download
it transparently and on demand as it is needed. There is also only one path to 
worry about for all installed tools. This greatly simplifies use and cleanup.

Batbelt is a 'bootstrapper' meaning that once installed, other tools are available
by simply typing the shortcut that would oridnarily be used to launch the tool.
For example, typing 'putty' at the shell would lauch putty if it was available
or download it from a repository and then launch it if it was not already available.
This happens automatically, as not to interrupt your workflow.

Cleanup can be done by simply deleting the entire Batbelt folder when finished.

# Concepts

At its core, Batbelt emulates the traditional Unix-style bin\ directory containing links
or wrapper scripts to executables. Batbelt calls scripts in this folder 'aliases'.
Typically, installed packages will have a short alias that is easy to type. For example
The fantastic Sysinternals Process Explorer might be shortened to just 'pe'.

However, in addition to serving as an installation location for programs and short aliases,
it is able to download programs on-demand if they aren't available locally. This is 
accomplished using curl to download package archives from a web site configured as a
remote package repository.

# Repository

Batbelt is designed to use a simple http accessible repository for fetching new tools.
If the tool is not installed locally, Batbelt will look at the configured remote 
repository to fetch the requested package.

Packages are simple zip files that can be created with any archiver or with 
the Batbelt utility scripts for deploying packages.


# Setting up a repository

Create a web server directory that is readable using http and writable with sftp/scp.

Running deploy-batbelt.bat will create a self extracting archive of the main batbelt tool which
includes the essential tools curl and 7zip. Batbelt requires these tools to bootstrap 
other programs so they are included in the base installation. Any further tools are
set up using packages and aliases.

Deploying aliases is done using deploy-alias.bat. This will archive all alias files in 
alias\ and upload the archive to the repository using scp.

# Adding a new program

Any program that can be installed via xcopy may be installed via Batbelt. Some Windows
applications that provide an installer can be installed first and then the files 
copied for use with Batbelt. Not all applications can be installed this way however.

Two steps are necessary to add a new program to the repository - creating the package
and creating an alias. To add a new package, arrange the files in a folder and give the folder the name of 
the desired package. Make sure that the executable is in the first level under the folder
and not in a subfolder. Run deploy-tool.bat to install the tool to the remote repository.

To create a new alias, run the tool create-alias.bat giving the desired short name 
of the alias (this is what you will type to launch the program), the package name 
(this is what we named the package folder in the previous step) and the exectuable
name of the program. This will create a new batch file in alias\.

Deploying the alias is accomplished by redeploying all aliases. For simplicity and speed
all aliases are kept in the same zip archive and are downloaded at once, thus, they
are deployed at once as well. Simply run 'deploy-alias.bat' to deploy to the repository.

# Installation

Getting Batbelt set up on a client requires downloading only a single file over the web.
Use a web browser to navigate to the Batbelt repository on the web and download the 
self-extracting archive 'Batbelt.exe'. Run the archive to unzip the contents of 
Batbelt to the current directory. Batbelt can be used directly from the location
at which it was unpacked for a zero-footprint scenario or installed to a desired location
on the system using 'install.bat', which will also add it to the user path. The 
second scenario is useful if you prefer convenience over zero-footprint, as it 
will modify the path.

Since the main Batbelt installer does not contain the aliases for configured programs
we have to take one additional step to update the list of available programs.
Run 'get-aliases.bat' to download aliases.zip and unpack it to the Batbelt client
directory.



# Notes

Batbelt uses 32 bit versions of curl and 7-zip for maximum compatibility. Many 
64bit Windows systems are able to run 32bit programs transparently. However, 
later Windows Server versions don't have WoW64 enabled by default, in which
case 64bit versions of curl and 7-zip must be subsituted.

# Further work

Although Batbelt is not intended to be a package manager, it could be made easier
to use via some more tools for discovering packages and perhaps using multiple 
repositories. Currently it is designed to be as simple as possible using a single
repository and supporting only simple 'unzip' installation semantics.