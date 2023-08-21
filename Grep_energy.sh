#!/bin/bash

number="-30 -20 -10 0 10 20 30 40 50 60"

template_file=GaO_temp.inp
input_file=GaO.inp
short=short_2.pbs
short2=short_re.pbs
std=std_2.pbs
wfn_file=GaO-RESTART.wfn
XYZ_bash_dir=/work/e05/e05/ucapcka/Charge/bin/cif2xyz.sh
input_dir=/work/e05/e05/ucapcka/Ov-a-Ga2O3/Ov_CN2/O_temp
sum_files=sum_Energy.txt

for i in $number ; do
    work_dir=Bond_Distortion_${i}.0%
    grep 'ENERGY' $work_dir/GaO.out | tail -1 | awk -v line=$i '{print $9,line}' >> $sum_files
done
