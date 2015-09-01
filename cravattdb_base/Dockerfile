FROM ubuntu:14.04

MAINTAINER Radu Suciu <radusuciu@gmail.com>

RUN echo "deb http://www.rabbitmq.com/debian/ testing main" >> /etc/apt/sources.list
RUN apt-key adv --keyserver pgp.mit.edu --recv-keys 0x056E8E56

RUN apt-get update && apt-get install -y \
    python3-pip \
    npm \
    git \
    rabbitmq-server

RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN pip3 install virtualenv
RUN npm install -g bower gulp