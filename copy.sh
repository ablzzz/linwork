i=1;
file=$1
while read type
do

start=`echo $type | cut -d " "  -f1`
end=`echo $type | cut -d " " -f2`
ch_wave $file -start $start -end $end > f.$i.wav
i=`expr $i + 1`
done < lab
