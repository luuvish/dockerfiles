# nyuzi-processor build environment

### build docker image

```bash
$ docker build -t nyuzi-processor .
```

### run docker in `pwd`

```bash
$ docker run --rm -it -u $(id -u):$(id -g) -v $(pwd):$(pwd) -w $(pwd) nyuzi-processor bash
```
