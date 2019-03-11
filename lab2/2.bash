#!/bin/bash
echo "INFORMATION:" > full.log

grep -r -h -s "II" /var/log/Xorg.0.log   | sed -e 's/II/information/' -e '1d' >> full.log 

echo "WARNING: " >> full.log

grep -r -h -s "WW" /var/log/Xorg.0.log   | sed -e 's/WW/warning/' -e '1d' >> full.log

cat full.log
