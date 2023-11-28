data test;
input gender $ exam1;
datalines;
M 80
F 90
M 86
F 78
;
proc print data = test;
run;

* Create a file test then print it
my names is Ian
by the way, todays is hot;
Data test;
input gender /*you know*/$ /*m*/ exam1/* firt exam*/;
variables;
*data part almost finish;
M 80
F 90
M 86
F 78
;
*
* above is the data
*;
proc print data = test; /* Print the test data */
run;
/*******************************************
proc corr data = test;
run;
********************************************/

