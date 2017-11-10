#!/bin/bash

docker run --rm -it rocket-chip bash -c "cd /opt/rocket-chip; cd emulator; make run-asm-tests; make run-bmark-tests"
