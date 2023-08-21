#!/bin/bash

number=" -40 -30 -20 -10 0 10 20 30 40 50 60"

template_file=GaO_temp.inp
input_file=GaO.inp
short=short_2.pbs
short2=short_re.pbs
std=std_2.pbs
wfn_file=GaO-RESTART.wfn
XYZ_bash_dir=/work/e05/e05/ucapcka/Charge/bin
input_dir=/work/e05/e05/ucapcka/Ov-a-Ga2O3/Ov_CN2/O_temp
cif_file=structure.cif

for i in $number ; do
    work_dir=Bond_Distortion_${i}.0%
        /work/e05/e05/ucapcka/Charge/bin/cif2xyz.sh $work_dir/$cif_file

    sed -i "s/Ga3+/Ga/g" \
        $work_dir/structure.xyz
    sed -i "s/O2-/O/g" \
        $work_dir/structure.xyz
    cp  $input_file $work_dir
    cp  $input_dir/$short $work_dir
    cp  $input_dir/$std $work_dir



done

