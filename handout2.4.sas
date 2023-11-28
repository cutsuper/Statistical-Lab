/**7. read limited files**/
data highlow;
infile "/home/u58575113/highlow.dat"
dlm=","
firstobs=2
;
input city $ state $ normalhigh normallow recordhigh recordlow;

run;

proc print data = highlow;
title "read highlow";
run;

/**8. proc import**/
PROC IMPORT DATAFILE="/home/u58575113/wine.csv"
	DBMS=CSV
	OUT=WORK.IMPORT;
	GETNAMES=YES;
RUN;
PROC PRINT data = IMPORT;
RUN;

