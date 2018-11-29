DATA DOW;
INFILE "D:\SAS\Data_Sets\DOWJONES.TXT";
INPUT DOWJONES;

PROC ARIMA DATA=DOW;
IDENTIFY VAR=DOWJONES(1) NLAG=20;
ESTIMATE;
FORECAST LEAD=3;

RUN;
