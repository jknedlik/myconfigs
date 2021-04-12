#!/bin/bash

echo running $1
perf record --call-graph dwarf -F99999 $PWD/$1
perf script > perf.out
/home/jknedlik/documents/FlameGraph/stackcollapse-perf.pl perf.out >perf.folded
/home/jknedlik/documents/FlameGraph/flamegraph.pl --flamechart --width 1920 perf.folded >run.svg
firefox --new-window file://$PWD/run.svg
