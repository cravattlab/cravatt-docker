FROM cravattlab/cimage_base

MAINTAINER Radu Suciu <radusuciu@gmail.com>

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash
RUN apt-get update && apt-get -y install \
    python3-pip \
    nodejs \
    libpq-dev \
    python-psycopg2 \
    git

RUN pip3 install virtualenv