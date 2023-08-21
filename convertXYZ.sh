#!/bin/bash

number=" -40 -30 -20 -10 0 10 20 30 40 50 60"

template_file=GaO_temp.inp
input_file=GaO.inp
short=short_2.pbs
short2=short_re.pbs
std=std_2.pbs
wfn_file=GaO-RESTART.wfn
XYZ_bash_dir=/work/e05/e05/ucapcka/Charge/bin/cif2xyz.sh
input_dir=/work/e05/e05/ucapcka/Ov-a-Ga2O3/Ov_CN2/O_temp

for i in $number ; do
    work_dir=Bond_Distortion_${i}.0%

    line=${i}
    $XYZ_bash_dir/cif2xyz.sh $work_dir/structure.cif
    sed -e "s/Ga3+/Ga/g" \
        $work_dir/structure.xyz
    sed -e "s/O2-/O/g" \
        $work_dir/structure.xyz
    cp  $input_file $work_dir
    cp  $input_dir/$short $work_dir
    cp  $input_dir/$std $work_dir

done
