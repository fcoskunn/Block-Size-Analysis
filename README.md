# Block-Size-Analysis
Hit and miss rate analysis of different block sizes
analyse.sh is a bash script which evaluates the
matmul command with gem5 according the size of
block sizes respectively, 8, 16, 32, 64, 128, 256,
512 Bits. The miss rate of the L1 caches is saved
to results.csv file. By using these L1 miss rates,
the graph of the block sizes vs hit rates(1.0 - miss
rates) are plotted. The python script, plot_result.py
reads the miss rates, calculates the hit rates and
plots it.
Please execute the analysis.sh command after
copying the Project folder into the gem5 directory.
It will run for different block sizes and plot the
hit-rate graph.

![Results](https://raw.githubusercontent.com/fcoskunn/Block-Size-Analysis/master/block_size_analyses.png)
