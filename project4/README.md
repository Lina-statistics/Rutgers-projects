Project II. Comparing low income housing in New Jersey with other US
states.
Dataset: You need the file with NJ data (Gnj.zip) plus the other two states
assigned to your group.
Important variables for affordability are
Value = housing value code
Puma1 = puma 1% sample region
Hht = household type (1,2,3 = family)
finc = family income
hinc = household income
hweight = census weight
persons = number of people in the houseold
yrbuilt = year built 1,2,3 last ten years
grent = rent per month
rooms = number of rooms
unittype= type of unit (0=housing unit,1,2=inst. Quarters)
smocapi = percent of income going to house
grapi = percent of income going to rent
bldgsz = building size
vehicl = number of cars
educ = education level of the head of household
sex = gender of the head of household
age = age of the head of household
trvtime = travel time of the head of household
lhinc = log household income.
You are assigned 3 states, NJ plus two others. Please check on the web page to
see the data assigned to your group on Sakai.
You could perform the analysis in R or in SAS, but not any other software.

These are the objectives of the project:
1. Compare the income distributions of the states in pairs.
2. Compare the state basic statistics. Produce tables of
- median income
- proportion of low income families, (rat3)
- Among the new units, what is the proportion of units that are low income,
and are affordable and are not crowded. (rat)
- Among all new units that are occupied by low income families, what is the
proportion of units that are affordable and are not crowded. (rat2)
3. For every state you need to separate the data into two datasets Owners and
Rentals
Produce several logistic regression models for each state.
Dataset: All new and low income.
Response: Y = 1 if AFF & UNCROWD
Y= 0 Otherwise.
Predictors: It is up to you from the set of variables but you should use as many
as possible
Which variables seem to impact the responses?
Summarize your findings.
