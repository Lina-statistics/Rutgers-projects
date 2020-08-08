SALES OF ORTHOPEDIC EQUIPMENT

The objective of this study is to find ways to increase sales of orthopedic products from our
company to all hospitals in the United States. Find those who have high consumption of such
equipment but where our sales are low. Come up with a selected group where you think our efforts
will be rewarded.
The following description of the dataset includes variable names and some summaries of
variable. 
DATASET ORTHOPEDIC
VARIABLES:
 ZIP : US POSTAL CODE
 HID : HOSPITAL ID
 CITY : CITY NAME
 STATE : STATE NAME
 BEDS : NUMBER OF HOSPITAL BEDS
 RBEDS : NUMBER OF REHAB BEDS
 OUT-V : NUMBER OF OUTPATIENT VISITS
 ADM : ADMINISTRATIVE COST(In $1000's per year)
 SIR : REVENUE FROM INPATIENT
 SALES : SALES OF REHAB. EQUIP in $1000's per year
 HIP : NUMBER OF HIP OPERATIONS
 KNEE : NUMBER OF KNEE OPERATIONS
 TH : TEACHING HOSPITAL? 0, 1
TRAUMA : DO THEY HAVE A TRAUMA UNIT? 0, 1
 REHAB : DO THEY HAVE A REHAB UNIT? 0, 1
 HIP2 : NUMBER HIP OPERATIONS Year 2
KNEE2 : NUMBER KNEE OPERATIONS Year 2
FEMUR2 : NUMBER FEMUR OPERATIONS Year 2
Overview of the Analysis
Part 1. Select your market segment-s. 
1. Select cases:
Select a group of states for the study (it is enough to select about 2000-2500
hospitals at random or by region). Set the zero values on SALES to missing
values.
2. Transformations:
Look at each individual variable and decide "if and which" transformation is
appropriate. Some transformations are log(1+c*x) where the constant c changes
from variable to variable ( 0.1,0.01,0.001,…) or sqrt transformation or any other.
3. Dimension reduction.
4. Market segmentations.
i) Independent variables are used to divide the list of hospitals (all possible
clients = the market) into subsets which we call market segments or
clusters.
ii) Once the clusters are chosen we must study the summary statistics for
each cluster and try to describe their content. Interpretation is very
important at this stage.
iii) Finally we select the cluster or clusters that agree with our objectives.
These are clusters with high sales and with good characteristics, such as
high number of operations, etc
Part 2. Estimating potential gain in sales. Potential gain in sales is the difference
between current sales and the average of sales to similar hospitals. If you are
analyzing a very small cluster (N <20) then we might assume that the sales are
homogeneous and the “average sales to similar hospitals” is just the average sale to
that cluster. But if the cluster is larger we will need to obtain a regression estimate.
