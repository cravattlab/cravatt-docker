FROM ubuntu:16.04

MAINTAINER Radu Suciu <radusuciu@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# recommended for better compatibility
RUN dpkg --add-architecture i386

RUN apt-get update && apt-get -y \
    install software-properties-common \
    wget \
    xvfb \
    apt-transport-https

ADD https://dl.winehq.org/wine-builds/Release.key .
RUN apt-key add Release.key
RUN apt-add-repository https://dl.winehq.org/wine-builds/ubuntu/

RUN apt-get update
RUN apt-get -y install winehq-devel

# install winetricks
ADD https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks /usr/local/bin/
RUN chmod 755 /usr/local/bin/winetricks

# work-around for xvfb being weird..
# _XSERVTransmkdir: ERROR: euid != 0,directory /tmp/.X11-unix will not be created.
# RUN mkdir /tmp/.X11-unix
# RUN chmod 1777 /tmp/.X11-unix
# RUN chown root /tmp/.X11-unix/

# perform rest of installation
RUN adduser --disabled-password --gecos '' wine
WORKDIR /home/wine
COPY readw readw/
COPY install.sh .
RUN chown -R wine:wine /home/wine

USER wine

ENV DISPLAY :0.0
ENV WINEPREFIX /home/wine/.wine32
ENV WINEARCH win32

# RUN bash install.sh
# WINEPREFIX=~/.wine32 winetricks vcrun2008 vcrun2010 dotnet20 dotnet20sp1 dotnet20sp2 
# run WINEPREFIX=~/.wine32 wine readw
