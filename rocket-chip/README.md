# rocket-chip build environment

### build docker image

```bash
$ docker build -t rocket-chip .
```

### run docker in `pwd`

```bash
$ docker run --rm -it -u $(id -u):$(id -g) -v $(pwd):$(pwd) -w $(pwd) rocket-chip bash
```

### run tests

```bash
$ docker run --rm -it rocket-chip bash -c "cd /opt/rocket-chip; cd emulator; make run-asm-tests; make run-bmark-tests"
```
