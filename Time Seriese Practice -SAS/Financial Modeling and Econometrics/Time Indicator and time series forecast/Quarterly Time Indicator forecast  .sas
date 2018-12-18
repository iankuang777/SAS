
data sales;
infile 'C:\Users\ianku\Desktop\Time Seriese Practice\Financial Modeling and Econometrics\Time Indicator\FIELDS.TXT';
input sales;

*array four quarters;
array seasind{4} q1 q2 q3 q4;

do i=1 to 4;
if mod(_N_,4)=i then seasind{i}=1;
ELSE seasind{i}=0;
if MOD(_N_,4)=0 then seasind{4}=1;
else seasind{4}=0;
end;
time=_n_;
if time>60 then sales=.;

*calculate the log price;
lsales=log(sales);

*use log transform to Make forecast;
proc reg data= sales; 
model lsales=q1 q2 q3 time/cli;
output out=results p=lpred;

*since our result is after log calculation, we need to use a power function to retrive the forecast data;
data new;
set results;
pred=exp(lpred);

*draw two lines of original sales data and forecast sales data to compare, and we output onr more forecast from period 61 to 64;
proc gplot;
plot(sales pred)*time/overlay;
symbol i=join;
run;
