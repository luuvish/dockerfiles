#!/bin/bash

docker run --rm -it -p 8888:8888 caffe2ai/caffe2:c2v0.8.1.cpu.full.ubuntu14.04 sh -c "jupyter notebook --allow-root --no-browser --ip 0.0.0.0 /caffe2/caffe2/python/tutorials"
