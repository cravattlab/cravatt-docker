FROM radusuciu/wine

MAINTAINER Radu Suciu <radusuciu@gmail.com>

USER wine
WORKDIR /home/wine
ENV DISPLAY :0

COPY --chown=wine:wine readw readw/
COPY --chown=wine:wine install.sh .

RUN bash install.sh
RUN echo 'alias readw="wine /home/wine/readw/ReAdW.exe --mzXML --centroid"' >> .bashrc
ENTRYPOINT ['/usr/bin/wine', '/home/wine/readw/ReAdW.exe', '--mzXML', '--centroid']
