FROM ubuntu:latest

MAINTAINER Matthias Reinarz <mreinarz@thoughtworks.com>

RUN apt-get update && apt-get install -y texlive
RUN apt-get install -y texlive-latex-extra
RUN apt-get install -y wget \
    && wget http://mirrors.ctan.org/fonts/opensans.zip \
    && apt-get install -y unzip \
    && unzip opensans.zip \
    && mkdir -p $HOME/texmf \
    && cp -r opensans/* $HOME/texmf/ \
    && rm -r opensans opensans.zip \
    && mktexlsr && updmap-sys --enable Map=opensans.map
