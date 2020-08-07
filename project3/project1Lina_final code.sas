*create a RTF file;
ODS RTF FILE = 'C:\Users\gln_d\Desktop\rutgers class\interperation of data\project1\results10172018.rtf';
*table 8, chiq test;
Data table8;
input group $ source $ count;
cards;
1	1 14
1	2 11
1	3 32
1	4 36
1	5 38
1	6 23
2	1 22
2	2 9
2	3 35
2	4 33
2	5 30
2	6 33
;
run;
proc print;
run;
proc freq data= table8;
weight count;
tables group*source / chisq;
run;

*table 9, fisher exact or wilcoxon;
Data table9;
input group $ satisf $ count;
cards;
1	5 4
1	4 5
1	3 3
2	5 4
2	4 14
2	3 4
;
run;
proc print;
run;
Proc npar1way wilcoxon;
Class group;
Var count;
run;
proc freq data = table9;
weight count;
tables group*satisf / fisher;
run;
*table 15, found difference;
data table15;
input group $ confi $ count;
cards;
1	10 4
1	9 8
1	8 13
1	7 5
1	6 4
1	5 6
1	4 5
1	3 5
1	2 0
1	1 4
2	10 6
2	9 4
2	8 11
2	7 13
2	6 6
2	5 7
2	4 2
2	3 1
2	2 0
2	1 1
;
run;
proc print;
run;
Proc npar1way wilcoxon;
Class group;
Var count;
run;
proc freq data = table15;
weight count;
tables group*confi / fisher;
run;
*table 18;
data table18;
input group $ area $ count;
cards;
1	1 38
1	2 32
1	3 35
1	4 38
2	1 35
2	2 22
2	3 21
2	4 36
;
run;
proc print;
run;
proc freq data= table18;
weight count;
tables group*area / chisq;
run;

*table 19, found difference;
data table19;
input group $ format $ count;
cards;
1	1 14
1	2 17
1	3 45
1	4 34
1	5 2
2	1 30
2	2 8
2	3 23
2	4 34
2	5 1
;
run;
proc print;
run;
proc freq data= table19;
weight count;
tables group*format / chisq;
run;

*table 20, found difference;
data table20;
input group $ wtp $ count;
cards;
1	1 19
1	2 20
1	3 15
2	1 32
2	2 18
2	3 1
;
run;
proc print;
run;
proc freq data= table20;
weight count;
tables group*wtp / chisq;
run;

*table 22;
data table22;
input group $ interest$ count;
cards;
1	1 8
1	2 28
1	3 18
2	1 6
2	2 22
2	3 23
;
run;
proc print;
run;
proc freq data= table22;
weight count;
tables group*interest / chisq;
run;

*table 25;
data table25;
input group $ comp $ count;
cards;
1	10	0
1	9	2
1	8	2
1	7	3
1	6	6
1	5	11
1	4	0
1	3	2
1	2	0
1	1	1
1	0	0
2	10	0
2	9	0
2	8	2
2	7	3
2	6	6
2	5	3
2	4	3
2	3	2
2	2	2
2	1	3
2	0	2
;
run;
proc print;
run;
proc freq data= table25;
weight count;
tables group*comp / fisher;
run;
Proc npar1way wilcoxon;
Class group;
Var count;
run;

*table 26;
data table26;
input group $ willing $ count;
cards;
1	1	16
1	2	4
1	3	7
2	1	16
2	2	2
2	3	8
;
run;
proc print;
run;
proc freq data= table26;
weight count;
tables group*willing / fisher;
run;
Proc npar1way wilcoxon;
Class group;
Var count;
run;

*table 37;
data table37;
input group $ score $ count;
cards;
1	10	0
1	9	3
1	8	0
1	7	3
1	6	5
1	5	7
1	4	8
1	3	12
1	2	10
1	1	5
1	0	1
2	10	3
2	9	3
2	8	0
2	7	2
2	6	10
2	5	18
2	4	9
2	3	4
2	2	2
2	1	0
2	0	. 
;
run;
proc print;
run;
proc freq data= table37;
weight count;
tables group*score / fisher;
run;
Proc npar1way wilcoxon;
Class group;
Var count;
run;
proc means data = table37;
var count;
by group;
run;

*table21;
data table21;
input group $ cost $ count;
cards;
1	1	8
1	2	4
1	3	2
1	4	2
1	5	.
1	6	.
1	7	.
1	8	3
2	1	.
2	2	2
2	3	8
2	4	3
2	5	6
2	6	3
2	7	8
2	8	2
;
run;
proc print;
run;
Proc npar1way wilcoxon;
Class group;
Var count;
run;

*table17;
data table17;
input group $ li $ count;
cards;
1	1	.
1	2	27
1	3	27
2	1	1
2	2	17
2	3	33
;
run;
proc print;
run;
Proc npar1way wilcoxon;
Class group;
Var count;
run;
proc freq data= table17;
weight count;
tables group*li / fisher;
run;

*table16;
data table16;
input group $ achi $ count;
cards;
1	1	14
1	2	.
1	3	27
1	4	17
1	5	24
1	6	7
1	7	1
2	1	15
2	2	4
2	3	36
2	4	17
2	5	6
2	6	3
2	7	2
;
run;
proc print;
run;
Proc npar1way wilcoxon;
Class group;
Var count;
run;
proc freq data= table16;
weight count;
tables group*achi / fisher;
run;
*close the RTF file;
ODS RTF CLOSE;




 





