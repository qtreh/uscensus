us census 1994
========

<h4>US Census (1994) data analysis. Prediction of income (> or &lt; $50.000).</h4>

===

<b>1st method</b>

We keep all continued variables as is. The discrete ones are transformed into dummy variables and excluded (the discrete versions).

We take 5000 samples:
- 1000 of them are kept to train our predictors: logistic regression and random forest. 
- To do some testing, 700 of them were taken (possibly the same, but the ratio seems low enough to prevent overfitting).


<b>2nd method</b>

The 'hourly wage' variable is a huge bias. 95% of the dataset has 0$ as a wage, which is highly improbable. Thus, in a second method, I take only the rows where it is not zero. But it is a bias as well, that does not represent jobless people. The logistic regression predictor seems to overcome that second bias: its accuracy stands when we try it against original data (with a lot of hourly wage = 0). Excluding those rows leaves about 11.000 rows.

We can also see that if we try to exclude people who answered 'Not in universe' for 'Class of worker' variable from the previous restrained dataset, nothing happens: all were already deleted in the previous operation.

The following variables seem not relevant enough, so they were deleted to reduce noise: 39 (year), 11 (hispanic origin, 'race' is enough), 2 et 3 (recode), 20/21 (previous area), # 28 (migr sunbelt), 24/25/26 (migration code), 27 (in house for 1yr), 36 (veterans quest, 'veterans' benfits is enough).

The country of birth led to multiple dummy variables (high noise). It's preferable to simplify it. V31 has been transformed into a scoring continue variable : 1 point for each family member (self, mother and father) who was born in the US. The idea is to represent the attach the family has to the country, if the family immigrated recently or is american since more than one generation.

Capital gains et losses were reduced to only one variable: (V16 - V17)

Dividends were transformed into a nominal variable (0 or 1). Usually, receiving dividends or not can be seen as a sufficient indicator, so it was transformed to avoid noise.

Every nominal variable was transformed into dummy variable, and the original were deleted, like in the 1st method. A small subset of these dummy variables had to be deleted: it was not present in the testing dataset. However, those variables concerned some family ties with a householder, when it was a grandchild, so it was anecdotic enough.

We then take the first 1000 samples (which were previously shuffled) and use them to train 4 predictors : logistic regression, SVM polynomial kernel degree 3, random forest, prediction tree. It had to limited to 1000 samples due to computer limitations.

The cross-validated results can be seen in detail in the file 'uscensus/Results'. For the testing operation, we have to consider two cases: test the predictor with 'hourly wage>0' testing data only or not. 

hourly wage>0
If we restrict on those who had a hourly wage superior to zero, we have the following results:
<table>
<tr>
  <th></th><th>Logistic regression</th><th>Random forest</th>
</tr>
<tr>
  <th>Sensitivity</th><th>0.9651</th><th>0.9566</th>
</tr>
</table>








=== Extract from census_income_metadata.txt ===

<br/>Variables being manipulated in R files.
<br/>Warning 1: There is an additional 25th variable in the original dataset, which represents the weight and is ignored when doing the prediction job.
<br/>Warning 2: The dataset in R may start with V0 or V1. 
<br/>Warning 3: Attribute #40, not shown here, is the outcome variable (-50000/50000+).

<br/>|   91 distinct values for attribute #0 (age) continuous
<br/>|    9 distinct values for attribute #1 (class of worker) nominal
<br/>|   52 distinct values for attribute #2 (detailed industry recode) nominal
<br/>|   47 distinct values for attribute #3 (detailed occupation recode) nominal
<br/>|   17 distinct values for attribute #4 (education) nominal
<br/>| 1240 distinct values for attribute #5 (wage per hour) continuous
<br/>|    3 distinct values for attribute #6 (enroll in edu inst last wk) nominal
<br/>|    7 distinct values for attribute #7 (marital stat) nominal
<br/>|   24 distinct values for attribute #8 (major industry code) nominal
<br/>|   15 distinct values for attribute #9 (major occupation code) nominal
<br/>|    5 distinct values for attribute #10 (race) nominal
<br/>|   10 distinct values for attribute #11 (hispanic origin) nominal
<br/>|    2 distinct values for attribute #12 (sex) nominal
<br/>|    3 distinct values for attribute #13 (member of a labor union) nominal
<br/>|    6 distinct values for attribute #14 (reason for unemployment) nominal
<br/>|    8 distinct values for attribute #15 (full or part time employment stat) nominal
<br/>|  132 distinct values for attribute #16 (capital gains) continuous
<br/>|  113 distinct values for attribute #17 (capital losses) continuous
<br/>| 1478 distinct values for attribute #18 (dividends from stocks) continuous
<br/>|    6 distinct values for attribute #19 (tax filer stat) nominal
<br/>|    6 distinct values for attribute #20 (region of previous residence) nominal
<br/>|   51 distinct values for attribute #21 (state of previous residence) nominal
<br/>|   38 distinct values for attribute #22 (detailed household and family stat) nominal
<br/>|    8 distinct values for attribute #23 (detailed household summary in household) nominal
<br/>|   10 distinct values for attribute #24 (migration code-change in msa) nominal
<br/>|    9 distinct values for attribute #25 (migration code-change in reg) nominal
<br/>|   10 distinct values for attribute #26 (migration code-move within reg) nominal
<br/>|    3 distinct values for attribute #27 (live in this house 1 year ago) nominal
<br/>|    4 distinct values for attribute #28 (migration prev res in sunbelt) nominal
<br/>|    7 distinct values for attribute #29 (num persons worked for employer) continuous
<br/>|    5 distinct values for attribute #30 (family members under 18) nominal
<br/>|   43 distinct values for attribute #31 (country of birth father) nominal
<br/>|   43 distinct values for attribute #32 (country of birth mother) nominal
<br/>|   43 distinct values for attribute #33 (country of birth self) nominal
<br/>|    5 distinct values for attribute #34 (citizenship) nominal
<br/>|    3 distinct values for attribute #35 (own business or self employed) nominal
<br/>|    3 distinct values for attribute #36 (fill inc questionnaire for veteran's admin) nominal
<br/>|    3 distinct values for attribute #37 (veterans benefits) nominal
<br/>|   53 distinct values for attribute #38 (weeks worked in year) continuous
<br/>|    2 distinct values for attribute #39 (year) nominal
