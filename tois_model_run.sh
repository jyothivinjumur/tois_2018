#!/bin/bash

INPUT=/fs/clip-ediscovery/jyothi/Research/jvdofs/Fall2016/cats4minecore.csv
OLDIFS=$IFS
IFS=,
[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }
while read rcat pcat 
do
	SECONDS=0
	bash jcmruninit.sh 100.0 0.03 10.0 2.0 8.0 8.0 781265 FullColRun-$rcat-$pcat-JB-eruns $rcat $pcat >> /fs/clip-ediscovery/jyothi/Research/jvdofs/Fall2016/logfiles/FullColRun-$rcat-$pcat-JB-eruns-toismodel.log 2>&1
	bash rmrun.sh 100.0 0.03 10.0 2.0 8.0 8.0 781265 FullColRun-$rcat-$pcat-JB-eruns $rcat $pcat >> /fs/clip-ediscovery/jyothi/Research/jvdofs/Fall2016/logfiles/FullColRun-$rcat-$pcat-JB-eruns-toismodel.log 2>&1
	echo "Completed $rcat $pcat Category Pair"
	duration=$SECONDS
	echo "$(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed."
done < $INPUT
IFS=$OLDIFS


# 600.0 5.0 150.0 3.0 15.0 15.0 DL

# 100.0 0.03 10.0 2.0 8.0 8.0  JB

# 1000.0 0.1 1.0 1.0 1.0 1.0 MG

# grep 'RESULTVALUE' ECAT-MCAT-DLALvRS-toismodel.log

# grep 'EFFICIENCY-IN-TIME' ECAT-MCAT-DLALvRS-toismodel.log



# 781265
