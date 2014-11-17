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

Coming soon.




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
