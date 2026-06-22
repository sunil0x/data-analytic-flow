# Spotify Tracks Analysis using Pandas

## Project Overview

This project performs Exploratory Data Analysis (EDA) on the Spotify Tracks Dataset using Python and Pandas. The goal is to analyze song characteristics, artist performance, genre trends, and relationships between audio features to extract meaningful insights from the data.

## Dataset

* **Dataset:** Spotify Tracks Dataset
* **Source:** Kaggle
* **Format:** CSV
* **Tools Used:** Python, Pandas, NumPy, Matplotlib

---

## Project Structure

```text
.
├── solution.ipynb
├── spotify_tracks.csv
└── README.md
```

---

## Libraries Used

```python
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
```

---

# Data Exploration

Performed initial exploration to understand the dataset structure.

### Tasks

* Load dataset into Pandas DataFrame
* Examine shape and dimensions
* Inspect column names and data types
* Check for missing values
* Generate descriptive statistics

### Sample Code

```python
df = pd.read_csv('spotify_tracks.csv')

df.shape
df.info()
df.isnull().sum()
df.describe()
```

---



### Questions Answered

* 1. Which artists appears most frequently?

```python
df.groupby("artist_name")['track_id'].count().sort_values(ascending= False).head()
```

* 2. What are the top 10 most popular songs?

```python
df.sort_values(by = 'popularity', 
               ascending= False).drop_duplicates(subset = ['track_name','artist_name','popularity'])[['track_name','artist_name','popularity']].head(10)

```

* 3. Which genres contains the most songs?

```python 
df.groupby('genre')['track_id'].count().sort_values(ascending= False).head()
```

*  4. Which artists have the highest average popularity

```python
df.groupby('artist_name').agg(
    avg_popularity = ('popularity','mean'),
    num_songs = ('track_name','count')).sort_values(by ='avg_popularity',
                                                    ascending = False).head(10)
    
```

* 8. Which genre has the highest average popularity?
```python
df.groupby('genre')['popularity'].mean().sort_values(ascending = False).head(1)
```

* 9. Which songs are longer than the average duration?

```python 
avg_duration =df['duration_ms'].mean()
print(avg_duration.round(2))

df[df['duration_ms'] >= avg_duration][['track_name','duration_ms']].head()
```


* 10. Which genres have the longest average songs?

```python
df.groupby('genre')['duration_ms'].mean().sort_values(ascending =False).head(1)
```

## Intermediate Level

* 1. Which artist has released the most songs in each genre?

```python
top_artists_by_genre = (
    df.groupby(['genre', 'artist_name'])['track_id']
      .count()
      .reset_index(name='song_count')
      .sort_values(['genre', 'song_count'], ascending=[True, False])
      .drop_duplicates(subset='genre')
)

print(top_artists_by_genre)
```

* 12. Which artists have above-average popularity?

```python 
overall_avg_popularity = df['popularity'].mean()
print(overall_avg_popularity)

#filtering these artists
above_average_artists = (
    df.groupby('artist_name')['popularity'].mean()
    .loc[lambda x:x> overall_avg_popularity]
    .sort_values(ascending= False)
)
print(above_average_artists)
    

```

* 13. Find the top 5 songs within each genre.

```python
top_5 = (
    df.sort_values('popularity',ascending = False)
    .groupby('genre').head(5)
)
print(top_5)
```

* 14. Which genres are the most danceable?

```python
genre_rank = (
    df.groupby('genre')['popularity']
      .mean()
      .rank(ascending=False, method='dense')
)

df['dance_rank'] = df['genre'].map(genre_rank)

print(df[['dance_rank', 'genre', 'popularity']].head())
```
# Pandas Concepts Used

* Data Loading
* Data Cleaning
* Filtering
* Sorting
* GroupBy Operations
* Aggregation Functions
* Multi-level Aggregation
* Descriptive Statistics
* Correlation Analysis
* Ranking

---

# Skills Demonstrated

* Exploratory Data Analysis (EDA)
* Data Manipulation with Pandas
* Statistical Analysis
* Data Aggregation
* Insight Generation

---

# Conclusion

This project demonstrates how Pandas can be used to explore and analyze music data efficiently. Through artist, genre, and song-level analysis, meaningful insights were obtained regarding popularity trends and relationships between Spotify audio features.
