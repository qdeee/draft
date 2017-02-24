# !!! you need to manually change "cn" to "figures/cn" in cn.tex after building the plot. Otherwise main build will fail

set terminal epslatex
set output "gradnorm.tex"
set key box
set xlabel "Iterations"
set ylabel "Gradient norm"
set xrange [20:1500]
set style line 1 linecolor rgb '#0060ad' linetype 1 linewidth 3
set style line 2 linecolor rgb '#dd181f' linetype 1 linewidth 3
set style line 3 linecolor rgb 'purple' linetype 1 linewidth 3
plot 'grad_norm.fmbc' smooth csplines with lines ls 1 title 'FMCB', \
	 'grad_norm.fmbc-l2' smooth csplines with lines ls 2 title 'FMCB-EN',\
	 'grad_norm.fmbc-bootstrap' smooth csplines with lines ls 3 title 'FMCB-B'