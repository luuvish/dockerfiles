FROM ubuntu:16.04
LABEL MAINTAINER luuvish@gmail.com

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
      autoconf cmake make gcc g++ bison flex python \
      python3 perl emacs openjdk-8-jdk swig zlib1g-dev python-dev \
      libxml2-dev libedit-dev libncurses5-dev libsdl2-dev gtkwave imagemagick \
      git vim && \
    DEBIAN_FRONTEND=noninteractive apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV NYUZI=/opt/NyuziProcessor

RUN git clone https://github.com/jbush001/NyuziProcessor.git ${NYUZI} && \
    cd ${NYUZI} && \
    git submodule update --init --recursive && \
    build/setup_tools.sh && \
    make && \
    make test

ENV TERM xterm
CMD ["/bin/bash"]

