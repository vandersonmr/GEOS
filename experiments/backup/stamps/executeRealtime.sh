#!/bin/bash

TIMEFORMAT='%3U'
./$1
(time ./$1 &> /dev/null) &>> stamp

