# caffe2 build environment

### build docker image

```bash
$ docker pull caffe2ai/caffe2:c2v0.8.1.cuda8.cudnn7.ubuntu16.04
$ docker pull caffe2ai/caffe2:c2v0.8.1.cpu.full.ubuntu14.04
```

### run docker in `pwd`

```bash
$ docker run --rm -it -u $(id -u):$(id -g) -v $(pwd):$(pwd) -w $(pwd) caffe2ai/caffe2:c2v0.8.1.cpu.full.ubuntu14.04 /bin/bash
```

### run tests

```bash
$ docker run --rm -it caffe2ai/caffe2:c2v0.8.1.cpu.full.ubuntu14.04 python -m caffe2.python.operator_test.relu_op_test
```
