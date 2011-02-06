# Batbelt

# About
Batbelt is a small toolkit for bootstrapping utilities on Windows machines. Batbelt is not a 
full package manager but has some things in common with tools like apt on Linux. 

# Concepts

# Repository
Batbelt is designed to use a simple http accessible repository for fetching new tools.

Remote repository layout
/Batbelt.exe
/repo
/alias


# Installation


# Local file layout

# Building
7zip is the console version, but we need one extra file from the gui version for making self-extractable archives
7zCon.sfx

we use 32 bit versions for max compatibility

TODO: using non-ssl version of curl could make things a lot smaller to bootstrap
initially.

/batbelt - this is a 'live' version of the batbelt folder - anything here
will get zipped up into the default distribution when deploy.bat is run.
Typically we'll only want the basic tools here, so we'll need to clean this
out before deployment if any testing was done with this.

deploytool.bat - zip up a tool and push it to the webserver - TODO: this doesn't
work very well right now, as we expect the .exe file to be in the first
folder level, and zipping up an archive that contains folders is problematic.

deploy.bat - create a self extracting archive of the main batbelt tool which
includes the stub batch files for all tools as well as curl and 7zip.

