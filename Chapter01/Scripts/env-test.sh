#!/bin/bash

env -i PATH=HELLO /usr/bin/env | grep -A1 -B1 ^PATH
