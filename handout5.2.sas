/**paired t tests**/
data paired;
input ctime ttime;
diff = ttime-ctime;
/**H0: ctime = ttime**/
/**H0: diff = 0**/
datalines;
90 95
87 92
100 104
80 89
95 101
90 105
;

proc ttest data=paired;
var diff;
run;

proc ttest data=paired;
paired ttime*ctime;
run;

proc means data=paired n mean stderr t prt;
title 'paired t-test example';
var diff;
run;

/**check the normality**/
proc univariate data = paired normal;
var diff;
run;
