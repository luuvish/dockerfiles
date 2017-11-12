#!/bin/bash

docker run --rm -it caffe2ai/caffe2:c2v0.8.1.cpu.full.ubuntu14.04 python -m caffe2.python.operator_test.relu_op_test
