#!/bin/sh

set -eu

if [ $# -ne 1 ]
then
  exec $@
fi

str2str \
  -c /usr/local/share/rtklib/data/ubx_m8t_glsb_raw_5hz.cmd \
  -in serial://ttyACM0#ubx -out tcpsvr://:8020#rtcm3 \
  -msg "1017,1019,1020,1044,1077,1087,1107,1117,4001"
