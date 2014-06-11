dirList=$1
ext1=$2
all='_all_'
line1=`wc -l $dirList | cut -d " "  -f1`
for i in `seq 1 $line1`; do
	dir=`cat $dirList | head -$i | tail -1 | cut -d " " -f1`
	fileList=$dir/list
	line2=`wc -l $fileList | cut -d " "  -f1`
	
	for j in `seq 1 $line2`; do
		file=`cat $fileList | head -$j | tail -1`
		for k in 2 4 6 8; do
			for k1 in `seq 1 7`; do
				cat $dir$file*$ext1\_al_$k\_dim_$k1 > $dir$file\_all_$ext1\_al_$k\_dim_$k1
	# > $dir$file$all$ext1\_al_$k\_dim_$k1
			done
		done
	done
done 
