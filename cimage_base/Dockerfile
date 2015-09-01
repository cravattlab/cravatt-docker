FROM ubuntu:14.04

MAINTAINER Radu Suciu <radusuciu@gmail.com>

RUN echo "deb http://cran.stat.ucla.edu/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9

RUN apt-get update && apt-get -y install \
    r-base \
    netcdf-bin \
    libnetcdf-dev \
    pdftk

RUN echo 'source("http://bioconductor.org/biocLite.R")' >> rscript.R
RUN echo 'biocLite("xcms")' >> rscript.R
RUN echo 'biocLite("limma")' >> rscript.R

RUN Rscript rscript.R
RUN rm rscript.R