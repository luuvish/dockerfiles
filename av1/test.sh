#!/bin/bash

docker run --rm -it av1 bash -c "cd /opt/aom-build; make runtest; make testdata"
