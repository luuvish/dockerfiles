FROM ubuntu:16.04
LABEL MAINTAINER luuvish@gmail.com

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
      git vim wget perl python doxygen \
      build-essential cmake yasm ccache && \
    DEBIAN_FRONTEND=noninteractive apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN cd /opt && \
    wget https://s3.amazonaws.com/mozilla-games/emscripten/releases/emsdk-portable.tar.gz && \
    tar zxvf emsdk-portable.tar.gz && \
    cd emsdk-portable && \
    ./emsdk update && \
    ./emsdk install latest && \
    ./emsdk activate latest && \
    source /opt/emsdk-portable/emsdk_env.sh && \
    echo "source /opt/emsdk-portable/emsdk_env.sh" >> /root/.bashrc

RUN cd /opt && \
    git clone https://aomedia.googlesource.com/aom && \
    mkdir -p /opt/aom-build && cd /opt/aom-build && \
    cmake /opt/aom && \
    make && \
    make runtests && \
    make testdata

RUN cd /opt && \
    wget https://arewecompressedyet.com/analyzer/release_builds/AOMAnalyzer-linux-x64.tar.gz && \
    mkdir -p /opt/aom-inspect && cd /opt/aom-inspect && \
    cmake /opt/aom \
      -DENABLE_CCACHE=1 \
      -DAOM_TARGET_CPU=generic \
      -DENABLE_DOCS=0 \
      -DCONFIG_ACCOUNTING=1 \
      -DCONFIG_INSPECTION=1 \
      -DCONFIG_MULTITHREAD=0 \
      -DCONFIG_RUNTIME_CPU_DETECT=0 \
      -DCONFIG_UNIT_TESTS=0 \
      -DCONFIG_WEBM_IO=0 \
      -DCMAKE_TOOLCHAIN_FILE=$(find /opt/emsdk-portable -name Emscripten.cmake) && \
    make inspect

ENV TERM xterm
CMD ["/bin/bash"]

