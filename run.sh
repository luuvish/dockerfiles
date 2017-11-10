#!/bin/bash

docker run --rm -it -u $(id -u):$(id -g) -v $(pwd):$(pwd) -w $(pwd) rocket-chip bash
