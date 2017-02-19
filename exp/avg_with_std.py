import sys
import pandas as pd
from scikits.bootstrap import bootstrap
import itertools

INPUT_HEADER = ['iters', 'learn_mll', 'learn_mF', 'learn_MF', 'test_mll', 'test_mf', 'test_MF']
SELECTED_COLUMNS = ['iters', 'test_mf', 'test_MF']


def get_final_ci(series):
    mean = series.mean()
    std = series.std(ddof=1)
    low_ci, high_ci = bootstrap.ci(series, n_samples=1000)
    return mean, std, low_ci, high_ci


if __name__ == '__main__':
    dataframes = [pd.read_table(filename, names=INPUT_HEADER)[SELECTED_COLUMNS] for filename in sys.argv[1:]]
    full_df = pd.concat(dataframes, axis=1)
    rows = full_df.shape[0]

    for i in range(rows):
        row_slice = full_df.iloc[i]
        iters = row_slice['iters'][0]
        micro_f1_series = row_slice['test_mf']
        macro_f1_series = row_slice['test_MF']

        micro_f1_stats = get_final_ci(micro_f1_series)
        macro_f1_stats = get_final_ci(macro_f1_series)

        result = ["%d" % iters]
        result.extend(map(lambda v: "%.6f"% v, micro_f1_stats))
        result.extend(map(lambda v: "%.6f"% v, macro_f1_stats))
        print '\t'.join(result)
