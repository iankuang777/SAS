*Set quarter 4 as an indicator;
data sales;
infile 'C:\Users\ianku\Desktop\Time Seriese Practice\Financial Modeling and Econometrics\Time Indicator\FIELDS.TXT';
input sales;

*group sales into four quarters;
do i=1 to 4;
if mod(_n_,4)=i then quarter=i;
if mod(_n_,4)=0 then quarter=4;
end;
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

*draw quarter sales and distribution box line;
proc sort;
by quarter;
proc boxplot;
plot sales*quarter;

*build regression model and take q4 as indicator variable, you may change indicator accordingly;
proc reg data=sales;
model SALES= q1 q2 q3 time/cli;
test q1=0,q2=0,q3=0;
run;
