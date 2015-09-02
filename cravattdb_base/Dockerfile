FROM ubuntu:14.04

MAINTAINER Radu Suciu <radusuciu@gmail.com>

RUN echo "deb http://cran.stat.ucla.edu/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9

RUN apt-get update && apt-get install -y \
    r-base \
    netcdf-bin \
    libnetcdf-dev \
    pdftk \
    python3-pip \
    npm \
    git

# Setup R dependencies for cimage
RUN echo 'source("http://bioconductor.org/biocLite.R")' >> rscript.R
RUN echo 'biocLite("xcms")' >> rscript.R
RUN echo 'biocLite("limma")' >> rscript.R
RUN Rscript rscript.R
RUN rm rscript.R

# Dependencies for cravattdb
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN pip3 install virtualenv
RUN npm install -g bower gulp