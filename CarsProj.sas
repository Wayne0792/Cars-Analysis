
proc import out=new_data
    datafile='/home/u62791211/cars_clean - Cars Data1.csv'
    dbms=csv
    replace;
    getnames=YES;
    guessingrows=432;
run;

/*proc sort data=new_data;
by Make Origin Weight;
run;*/

/*Adds a unique ID*/
data new_data;
 set new_data;
 id = _N_;
run;


proc sort data=new_data;
by Make;
run;


data data2;
  set new_data;
  Str_MSRP = compress(MSRP, , 'kd');
  Numeric_MSRP = input(Str_MSRP,best12.);
  
  Str_Invoice = compress(Invoice, , 'kd');
  Numeric_Invoice = input(Str_Invoice,best12.);
  
  MSRP_Invoice = Numeric_MSRP-Numeric_Invoice;
run;

proc sort data = data2 nodupkey;
by id;
run;

proc print data=data2 (obs=20);
run;

proc contents data=new_data;
run;

proc means data=new_data;
run;

%macro inserting(make,model,type,origin,drivetrain,msrp,invoice,enginesize,cylinders,horsepower,mpg_city,mpg_highway,weight,wheelbase,length,id);
	data new ;
	id = &id;
	make = "&make";
	model = "&model";
	type = "&type";
	origin = "&origin";
	drivetrain = "&drivetrain";
	msrp = "&msrp";
	invoice = "&invoice";
	enginesize = &enginesize;
	cylinders = &cylinders;
	horsepower = &horsepower;
	mpg_city = &mpg_city;
	mpg_highway = &mpg_highway;
	weight = &weight;
	wheelbase = &wheelbase;
	length = &length;
	format msrp best12.;
	format invoice best12.;
	run;
	
	
	DATA new_data;
		SET new_data new;
	
	proc sort data=new_data nodupkey;
		by id;
	run;
	
	PROC PRINT DATA=new_data;
	RUN;

%mend inserting;

%inserting(Audi,A3,SUV,Europe,All,$40000,$42000,4.5,5,150,18,22,4420,115,144,429);


%macro modify(id);
	data new_data;
	modify new_data;
	make = "Audi";
	Type = "SUV";
	where id = &id;
	proc print data=new_data (obs=10);
	
run; 
%mend modify;
%modify(6);
	

/*%macro deleting(id);
	data new_data;
	set new_data;
	%if id = &id %then delete;
	run;
	
	proc sort data=new_data;
		by id;
	run;
%mend deleting;

%deleting(429);*/

proc print data=new_data (obs=10);
Var Weight Length;
run;

ods graphics / reset width=6.4in height=4.8in imagemap;

proc sgplot data=WORK.DATA2;
	title height=14pt "Car Makes vs Profit";
	vbar Make / response=MSRP_Invoice group=Type groupdisplay=stack;
	yaxis grid;
run;

proc sort data = data2 nodupkey;
by make;
where msrp_invoice = max(msrp_invoice);
run;

proc print data = data2;
var Make Type MSRP_Invoice;

run;

ods graphics / reset;
title;

ods graphics / reset width=6.4in height=4.8in imagemap;
proc sgplot data=new_data;
	title height=14pt "Weight vs Length";
	scatter x=Weight y=Length /;
	xaxis grid;
	yaxis grid;
run;

ods graphics / reset;
title;
ods graphics / reset width=6.4in height=4.8in imagemap;

proc sgplot data=WORK.NEW_DATA;
	title height=14pt "EngineSize vs Type";
	hbar Type / response=EngineSize group=Origin groupdisplay=cluster;
	xaxis grid;
run;

ods graphics / reset;
title;

ods graphics / reset width=6.4in height=4.8in imagemap;

proc sgplot data=WORK.DATA2;
	title height=14pt "Horsepower vs MPG";
	scatter x=Horsepower y=MPG_City /;
	xaxis grid;
	yaxis grid;
run;

ods graphics / reset;
title;

proc template;
	define statgraph SASStudio.Pie;
		begingraph;
		entrytitle "Camparability of DriveTrain To Car Types" / textattrs=(size=14);
		layout region;
		piechart category=Type / group=DriveTrain groupgap=2% stat=pct 
			datalabellocation=inside;
		endlayout;
		endgraph;
	end;
run;

ods graphics / reset width=6.4in height=4.8in imagemap;

proc sgrender template=SASStudio.Pie data=WORK.DATA2;
run;

ods graphics / reset;

ods graphics / reset width=6.4in height=4.8in imagemap;

proc sgplot data=WORK.DATA2;
	title height=14pt "No. of Cylinders vs Count";
	histogram Cylinders / scale=count;
	yaxis grid;
run;

ods graphics / reset;
title;