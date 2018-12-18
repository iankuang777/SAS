*Data Provided by Professor Soyer;
Data DJ;
Infile 'C:\Users\ianku\Desktop\Time Seriese Practice\FINANCIAL MODELING AND ECONOMETRICS\Autocorrelation of Time-Series\DOWJONES.TXT';
input dowjones;
proc arima data=DJ;
identify var=dowjones nlag=24;
run;
