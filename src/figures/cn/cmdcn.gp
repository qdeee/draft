# !!! you need to manually change "cn" to "figures/cn" in cn.tex after building the plot. Otherwise main build will fail

set terminal epslatex
set output "cn.tex"
set key box
set key top left
set datafile missing "Infinity"
set xlabel "Iterations"
set ylabel "Condition number of matrix"
set xrange [20:600]
set style line 1 linecolor rgb '#0060ad' linetype 1 linewidth 4
set style line 2 linecolor rgb '#dd181f' linetype 1 linewidth 4
plot 'cn.fmbc' smooth csplines with lines ls 1 title 'FMCB', \
	 'cn.fmbc-l2' smooth csplines with lines ls 2 title 'FMCB-EN'