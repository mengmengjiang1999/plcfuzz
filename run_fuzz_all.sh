#!/bin/bash
for i in $(seq 1 12); do
    filename="auto$i"
    echo "Running $filename"
    ./buildscript_new.sh $filename
done