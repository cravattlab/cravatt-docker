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
RUN apt-get -y install winehq-stable

# install winetricks
ADD https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks /usr/local/bin/
RUN chmod 755 /usr/local/bin/winetricks

# perform rest of installation
RUN adduser --disabled-password --gecos '' wine
WORKDIR /home/wine
COPY readw readw/
COPY install.sh .
RUN chown -R wine:wine /home/wine

USER wine
ENV WINEARCH win32
ENV WINEPREFIX /home/wine/.wine32
ENV DISPLAY :0
RUN bash install.sh
RUN echo 'alias readw="wine /home/wine/readw/ReAdW.exe --mzXML --centroid"' >> .bashrc