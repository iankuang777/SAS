*weekly time-series (1958 through 1963, 276 weeks) interaction happened after 135 terms;
data crest;
infile 'C:\Users\ianku\Desktop\Time Seriese Practice\Financial Modeling and Econometrics\Regression Model\TPASTE.TXT';
input time crestms colgms crestpr colgpr;
*use index 1 or 0 to represend if there is any interaction;
if time>=135 then ind=1;
else ind=0;
inter=crestpr*ind;
proc reg;
*ind is also an independent variable;
model crestms=crestpr ind inter;
run;