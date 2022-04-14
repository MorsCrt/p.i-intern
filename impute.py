import pandas as pd

df = pd.read_csv("country_vaccination_stats.csv",low_memory=False)

# Check missing data:
# print(df.isnull().sum())

def impute_zero(dataframe,column_name:str) -> pd.DataFrame:
    dataframe[column_name] = dataframe[column_name].fillna(0)
    return dataframe

impute_df = impute_zero(df,"daily_vaccinations")
print(impute_df.isnull().sum())
