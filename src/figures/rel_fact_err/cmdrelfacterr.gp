# !!! you need to manually change "cn" to "figures/cn" in cn.tex after building the plot. Otherwise main build will fail

set terminal epslatex
set output "rel_fact_err.tex"
set key box
set xlabel "Iterations"
set ylabel "Factorization error"
set xrange [20:1500]
set yrange [0.893 : 0.96]
set style line 1 linecolor rgb '#0060ad' linetype 1 linewidth 3
set style line 2 linecolor rgb '#dd181f' linetype 1 linewidth 3
set style line 3 linecolor rgb 'purple' linetype 1 linewidth 3
plot 'rel_fact_err.fmbc' smooth csplines with lines ls 1 title 'FMCB', \
	 'rel_fact_err.fmbc-l2' smooth csplines with lines ls 2 title 'FMCB-EN',\
	 'rel_fact_err.fmbc-bootstrap' smooth csplines with lines ls 3 title 'FMCB-B'