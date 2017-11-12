#!/bin/bash

#docker run --rm -it caffe2ai/caffe2:c2v0.8.1.cpu.full.ubuntu14.04 /bin/bash
docker run --rm -it -u $(id -u):$(id -g) -v $(pwd):$(pwd) -w $(pwd) caffe2ai/caffe2:c2v0.8.1.cpu.full.ubuntu14.04 /bin/bash
