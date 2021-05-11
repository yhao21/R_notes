import pandas as pd
import numpy as np


df = pd.read_csv('NewCleanData.csv')



volume = df['Volume'].values

indexing = 0
volume_change = [0]

# 0 if change is negative, 1 if positive.
for item in volume:
    if indexing == 0:
        pass
    else:
        vol_diff = item - volume[indexing-1]
        if vol_diff < 0:
            volume_change.append(0)
        else:
            volume_change.append(1)

    indexing += 1
print(volume_change)

df['vol_change'] = volume_change
print(df.head())
df.to_csv('NewCleanData.csv')
