us census 1994
========
(Better read this text RAW)

<h2>US Census (1994) data analysis. Prediction of income (> or &lt; $50.000).</h2>

===

<b>1st method</b>

We keep all continued variables as is. The discrete ones are transformed into dummy variables and excluded (the discrete versions).

We take 5000 samples:
- 1000 of them are kept to train our predictors: logistic regression and random forest. 
- To do some testing, 700 of them were taken (possibly the same, but the ratio seems low enough to prevent overfitting).


<b>2nd method</b>

Coming soon.




=== Extract from census_income_metadata.txt ===

Variables being manipulated in R files.
Warning 1: There is an additional 25th variable in the original dataset, which represents the weight and is ignored when doing the prediction job.
Warning 2: The dataset in R may start with V0 or V1. 
Warning 3: Attribute #40, not shown here, is the outcome variable (-50000/50000+).

|   91 distinct values for attribute #0 (age) continuous
|    9 distinct values for attribute #1 (class of worker) nominal
|   52 distinct values for attribute #2 (detailed industry recode) nominal
|   47 distinct values for attribute #3 (detailed occupation recode) nominal
|   17 distinct values for attribute #4 (education) nominal
| 1240 distinct values for attribute #5 (wage per hour) continuous
|    3 distinct values for attribute #6 (enroll in edu inst last wk) nominal
|    7 distinct values for attribute #7 (marital stat) nominal
|   24 distinct values for attribute #8 (major industry code) nominal
|   15 distinct values for attribute #9 (major occupation code) nominal
|    5 distinct values for attribute #10 (race) nominal
|   10 distinct values for attribute #11 (hispanic origin) nominal
|    2 distinct values for attribute #12 (sex) nominal
|    3 distinct values for attribute #13 (member of a labor union) nominal
|    6 distinct values for attribute #14 (reason for unemployment) nominal
|    8 distinct values for attribute #15 (full or part time employment stat) nominal
|  132 distinct values for attribute #16 (capital gains) continuous
|  113 distinct values for attribute #17 (capital losses) continuous
| 1478 distinct values for attribute #18 (dividends from stocks) continuous
|    6 distinct values for attribute #19 (tax filer stat) nominal
|    6 distinct values for attribute #20 (region of previous residence) nominal
|   51 distinct values for attribute #21 (state of previous residence) nominal
|   38 distinct values for attribute #22 (detailed household and family stat) nominal
|    8 distinct values for attribute #23 (detailed household summary in household) nominal
|   10 distinct values for attribute #24 (migration code-change in msa) nominal
|    9 distinct values for attribute #25 (migration code-change in reg) nominal
|   10 distinct values for attribute #26 (migration code-move within reg) nominal
|    3 distinct values for attribute #27 (live in this house 1 year ago) nominal
|    4 distinct values for attribute #28 (migration prev res in sunbelt) nominal
|    7 distinct values for attribute #29 (num persons worked for employer) continuous
|    5 distinct values for attribute #30 (family members under 18) nominal
|   43 distinct values for attribute #31 (country of birth father) nominal
|   43 distinct values for attribute #32 (country of birth mother) nominal
|   43 distinct values for attribute #33 (country of birth self) nominal
|    5 distinct values for attribute #34 (citizenship) nominal
|    3 distinct values for attribute #35 (own business or self employed) nominal
|    3 distinct values for attribute #36 (fill inc questionnaire for veteran's admin) nominal
|    3 distinct values for attribute #37 (veterans benefits) nominal
|   53 distinct values for attribute #38 (weeks worked in year) continuous
|    2 distinct values for attribute #39 (year) nominal
