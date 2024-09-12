#!/usr/bin/bash

grep -r "^draft.*=.*true$" ./content/ && exit 1