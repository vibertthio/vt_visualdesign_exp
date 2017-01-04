#!/bin/sh
processing-java --sketch=/Users/vibertthio/Documents/Processing/vtvsd/parametric --run
cd frame/
convert *.png dla.gif
rm *.png
cd..
