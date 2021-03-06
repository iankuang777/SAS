* Monthly returns from 1978/2 to 1987/12 Data provided by Professor Soyer;
DATA WALMART;
INFILE "C:\Users\ianku\Desktop\Time Seriese Practice\Financial Modeling and Econometrics\Regression Model\walmart.txt";
INPUT SP500 WALMART;
TIME=_N_;
PROC GPLOT;
PLOT(WALMART SP500)*TIME/OVERLAY;
SYMBOL I=JOIN;
PROC REG;
MODEL WALMART=SP500;
*Using F test on our hypothesis;
MODEL WALMART=SP500/CLB;
TEST SP500=1;
*Make forecast and draw a graph combine the actual result and the predict result;
PROC REG;
MODEL WALMART=SP500/CLM CLI;
OUTPUT OUT=RESULT P=PREDICT;
PROC GPLOT DATA=RESULT;
PLOT(WALMART PREDICT)*TIME/OVERLAY;
SYMBOL I=JOIN;

*Residule Analysis for our model;
PROC REG;
MODEL WALMART=SP500/DW;
OUTPUT OUT=RESULT2 R=ERROR;
PROC GCHART DATA=RESULT2;
VBAR ERROR;
PROC UNIVARIATE DATA=RESULT2 NORMAL;
VAR ERROR;
PROBPLOT;
PROC ARIMA DATA=RESULT2;
IDENTIFY VAR=ERROR;
RUN;
