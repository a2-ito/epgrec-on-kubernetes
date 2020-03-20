#!/bin/sh
echo "CHANNEL : $CHANNEL"
echo "DURATION: $DURATION"
echo "OUTPUT  : $OUTPUT"
echo "TUNER : $TUNER"
echo "TYPE : $TYPE"
echo "MODE : $MODE"

RECORDER=/usr/local/bin/recfriio
B25=/usr/local/bin/b25_bcas

if [ ${MODE} = 0 ]; then
   $RECORDER $CHANNEL $DURATION ${OUTPUT} --b25 --strip
elif [ ${MODE} = 1 ]; then
   $RECORDER $CHANNEL $DURATION --b25 --strip | 何か加工 >${OUTPUT}
elif [ ${MODE} = 2 ]; then
   $RECORDER $CHANNEL $DURATION ${OUTPUT}.tmp.ts --b25 --strip
   ffmpeg -i ${OUTPUT}.tmp.ts ... 適当なオプション ${OUTPUT}
fi
