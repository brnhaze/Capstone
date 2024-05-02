# Instructions

## Steps

### 1. [Data Profiling, Validation,and Testing](https://github.com/brnhaze/capstone/blob/main/data/sql/1%20profile_validate_cleaning.sql)
#### Data Profiling
-  Identify schema and its tables.
-  Write queries determining data types, null values, and unique values.
-  Analyze results of queries and document potential data quality issues.

#### Data Validation
-   Write queries validating data
-   Check for missing or duplicate data

#### Data Cleansing
- Write queries to clean data
- Identify & correct errors or inconsistencies
- Identify data quality issues

#### Testing
- Develop hypothesis and test ensuing valid values and accuracy
- Write queries to execute hypothesis testing
- Document the results

### 2. [Data Collection:](https://github.com/brnhaze/capstone/blob/main/data/sql/2%20data_collection.sql)
Gather data on penalties called in NFL games, including the player positions penalized and the type of penalties incurred

### 3. [Data Preparation:](https://github.com/brnhaze/capstone/blob/main/data/sql/3%20Data%20Preparation.sql)
Organize the data into a format suitable for analysis, ensuring that each penalty instance is associated with the player position it was called against.

### 4. [Importing Files to Pythong](https://github.com/brnhaze/capstone/blob/main/data/Python/0%20import_files_check.ipynb)

### 5. EDA Statistical Analysis:
Conduct statistical analysis to examine the distribution of penalties across different player positions. This could involve calculating summary statistics such as the mean number of penalties per player position, as well as visualizing the data using histograms or box plots.
- Files
    - [Python](https://github.com/brnhaze/capstone/blob/main/data/Python/1%20EDA.ipynb)
    - [SQL](https://github.com/brnhaze/capstone/blob/main/data/sql/4%20EDA_help.sql)

### 6. Hypothesis
Testing: Use appropriate statistical tests, such as chi-squared tests or ANOVA, to determine if there are significant differences in penalty frequencies among player positions.

### 7. Post-hoc Analysis:
If significant differences are found, conduct post-hoc analysis to identify which player positions are associated with higher or lower penalty rates. This could involve pairwise comparisons between player positions using techniques like Tukey's HSD test.

### 8. Interpretation and Conclusion:
Interpret the results of the analysis to determine whether there is evidence to support the hypothesis that certain player positions tend to receive more penalties than others. Consider the implications of these findings for coaching strategies, player development, and game officiating in the NFL.
