#!/bin/bash
for i in $(seq 1 12); do
    filename="auto$i"
    echo "Running $filename"
    ./buildscript_new_without_static.sh $filename
done