# aomedia av1 build environment

### build docker image

```bash
$ docker build -t av1 .
```

### run docker in `pwd`

```bash
$ docker run --rm -it -u $(id -u):$(id -g) -v $(pwd):$(pwd) -w $(pwd) av1 bash
```

### run tests

```bash
$ docker run --rm -it av1 bash -c "cd /opt/aom-build; make runtest; make testdata"
```
