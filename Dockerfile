FROM ubuntu:16.04
LABEL MAINTAINER luuvish@gmail.com

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
      autoconf automake autotools-dev curl device-tree-compiler \
      libmpc-dev libmpfr-dev libgmp-dev gawk build-essential bison flex \
      texinfo gperf libtool patchutils bc zlib1g-dev \
      git default-jdk wget python vim pkg-config && \
    DEBIAN_FRONTEND=noninteractive apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV RISCV=/opt/riscv-tools
ENV ROCKETCHIP=/opt/rocket-chip

RUN git clone https://github.com/ucb-bar/rocket-chip.git ${ROCKETCHIP} && \
    cd ${ROCKETCHIP} && \
    git submodule update --init && \
    cd ${ROCKETCHIP}/riscv-tools && \
    git submodule update --init --recursive && \
    ./build.sh && \
    ./build-rv32ima.sh

RUN cd ${ROCKETCHIP}/riscv-tools/riscv-openocd && \
    git checkout riscv && \
    cd ${ROCKETCHIP}/emulator && \
    make && \
    make debug && \
    cd ${ROCKETCHIP}/riscv-tools/riscv-openocd && \
    git checkout riscv && \
    cd ${ROCKETCHIP}/vsim && \
    make verilog

ENV TERM xterm
CMD ["/bin/bash"]

