#!/bin/bash

Xvfb :0 -screen 0 1024x768x16 &
wineboot
winetricks -q vcrun2008 vcrun2010
regsvr32 readw/XRawfile2.dll