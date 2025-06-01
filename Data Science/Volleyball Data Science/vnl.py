import pandas as pd

data_file = [
    'Data Science/Volleyball Data Science/data/2024_VNL_BUL_vs_FRA.csv',
    'Data Science/Volleyball Data Science/data/2024_VNL_FRA_vs_ITA.csv',
    'Data Science/Volleyball Data Science/data/2024_VNL_FRA_vs_NED.csv',
    'Data Science/Volleyball Data Science/data/2024_VNL_FRA_vs_USA.csv',
    'Data Science/Volleyball Data Science/data/2024_VNL_SLO_vs_FRA.csv',
    'Data Science/Volleyball Data Science/data/2024_VNL_TUR_vs_FRA.csv',
]

data = [pd.read_csv(file) for file in data_file]
all_data = pd.concat(data, ignore_index=True)

print(all_data.head())