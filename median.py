import pandas as pd
import numpy as np

df = pd.read_csv("country_vaccination_stats.csv",low_memory=False)

# Check missing data:
# print(impute_df.isnull().sum())

def impute_zero(dataframe,column_name:str) -> pd.DataFrame:
    dataframe[column_name] = dataframe[column_name].fillna(0)
    return dataframe

impute_df = impute_zero(df,"daily_vaccinations")

#list the top-3 countries with highest median daily vaccination numbers
print(impute_df.groupby(["country"])["daily_vaccinations"]
      .median()
      .sort_values(ascending=False)
      .head(3))

