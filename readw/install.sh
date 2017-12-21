#!/bin/bash
rm -rf ~/.win32

# note that wineboot fails if DISPLAY is set to anything before it is run!
DISPLAY= wineboot --init

Xvfb :0 -screen 0 1024x768x16 &
winetricks -q vcrun2008 vcrun2010
regsvr32 readw/XRawfile2.dll

DISPLAY= wineboot -e
DISPLAY= wineboot -s
