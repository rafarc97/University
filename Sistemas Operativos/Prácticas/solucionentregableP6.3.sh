#! /bin/bash
B = $((0)) 2> /dev/null
while [ $# -ge 2 ]; do
 ls -Ri $1 | grep $2 >> fich
 shift 2
done
 
 A=$( wc -l fich )
echo "$A coinciedencias"
rm fich