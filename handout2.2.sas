/** 1.Row data **/
data uspresidents;
input Presidents $ Party $ Number;
datalines;
Adams F 2
Lincoln R 16
Grrant R 18
Kennedy D 35
;
run;

proc print data = uspresidents; run;

/** Row data separated by spaces**/
DATA toads;
INPUT ToadName $ Weight Jump1 Jump2 Jump3; DATALINES;
Lucky 2.3 1.9 . 3.0
Spot 4.6 2.5 3.1 .5
Tubs 7.1 . . 3.8
Hop 4.5 3.2 1.9 2.6
Noisy 3.8 1.3 1.8 1.5
Winner 5.7 . . .
;
PROC PRINT DATA = toads; TITLE 'SAS Data Set Toads'; RUN;

/**proc export data = toads
outfile= "/home/u58575113/toadjump.dat"
dbms=csv
replace;
run; **/

/** 2.column arranged data**/
DATA sales;
INPUT VisitingTeam $ 1-20 ConcessionSales 21-24 BleacherSales 25-28 OurHits 29-31 TheirHits 32-34 OurRuns 35-37 TheirRuns 38-
40; DATALINES;
Columbia Peaches    35  67  1  10 2  1
Plains Peanuts      210     2  5  0  2
Gilroy Garlics      15  103512 11 7  6
Sacramento Tomatoes 124 85  15 4  9  1
;
PROC PRINT DATA = sales; 
TITLE 'SAS Data Set Sales'; 
RUN;