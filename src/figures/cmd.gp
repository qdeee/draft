# !!! you need to manually change "cn" to "figures/cn" in cn.tex after building the plot. Otherwise main build will fail

set terminal epslatex
set output "cn.tex"
set key box
set xlabel "Iterations"
set ylabel "Condition number of matrix"
set xrange [20:1500]
set style line 1 linecolor rgb '#0060ad' linetype 1 linewidth 4
set style line 2 linecolor rgb '#dd181f' linetype 1 linewidth 4
plot 'gf.series' smooth csplines with lines ls 1 title 'GF', 'gfen.series' smooth csplines with lines ls 2 title 'GFEN'
