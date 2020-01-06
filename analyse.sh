#!/bin/bash
gcc -o ./Matmul/matmul ./Matmul/matmul.c
mkdir -p Results
echo "Size; L1D Miss Rate; L1I Miss Rate" > results.csv
for i in {3..9}
do
    size=$((2 ** $i))
    folder_name="SIZE_${size}"
    mkdir -p ./Results/$folder_name
    echo -e "BLOCK SIZE: $size"
    ../build/X86/gem5.opt -d ./Results/$folder_name ../configs/example/se.py -c ./Matmul/matmul < ./Matmul/matmul_input.txt 1> ./Results/$folder_name/matmul_out 2> /dev/null --caches --l1d_size=64kB  --l1i_size=64kB --cacheline_size=$size
    L1D_missrate=$(grep "system.cpu.dcache.overall_miss_rate::total" ./Results/$folder_name/stats.txt  | awk '{print $2}' )
    L1I_missrate=$(grep "system.cpu.icache.overall_miss_rate::total" ./Results/$folder_name/stats.txt  | awk '{print $2}' )
    echo "$size; $L1D_missrate; $L1I_missrate" >> results.csv
    echo -e "MISS RATE L1D: $L1D_missrate"
    echo -e "MISS RATE L1I: $L1I_missrate\n"
done

rm -f matmul.inp matmul.out matmul.dat
python3 plot_results.py

