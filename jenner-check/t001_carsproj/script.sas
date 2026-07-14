/* Self-contained: the original CarsProj.sas imported this CSV from a SAS OnDemand
   path via PROC IMPORT with GETNAMES=YES (a sample of the repo's
   cars_clean - Cars Data1.csv is inlined below, same columns and types). */
data new_data;
    length Make $10 Model $25 Type $6 Origin $6 DriveTrain $5 MSRP $8 Invoice $8;
    infile datalines dsd dlm='|' truncover;
    input Make $ Model $ Type $ Origin $ DriveTrain $ MSRP $ Invoice $
          EngineSize Cylinders Horsepower MPG_City MPG_Highway
          Weight Wheelbase Length;
datalines;
Acura|MDX|SUV|Asia|All|$36,945|$33,337|3.5|6|265|17|23|4451|106|189
Acura|RSX Type S 2dr|Sedan|Asia|Front|$23,820|$21,761|2|4|200|24|31|2778|101|172
Acura|TSX 4dr|Sedan|Asia|Front|$26,990|$24,647|2.4|4|200|22|29|3230|105|183
Acura|TL 4dr|Sedan|Asia|Front|$33,195|$30,299|3.2|6|270|20|28|3575|108|186
Acura|3.5 RL 4dr|Sedan|Asia|Front|$43,755|$39,014|3.5|6|225|18|24|3880|115|197
Acura|3.5 RL w/Navigation 4dr|Sedan|Asia|Front|$46,100|$41,100|3.5|6|225|18|24|3893|115|197
Acura|NSX coupe 2dr manual S|Sports|Asia|Rear|$89,765|$79,978|3.2|6|290|17|24|3153|100|174
Audi|A4 1.8T 4dr|Sedan|Europe|Front|$25,940|$23,508|1.8|4|170|22|31|3252|104|179
Audi|A41.8T convertible 2dr|Sedan|Europe|Front|$35,940|$32,506|1.8|4|170|23|30|3638|105|180
Audi|A4 3.0 4dr|Sedan|Europe|Front|$31,840|$28,846|3|6|220|20|28|3462|104|179
Audi|A4 3.0 Quattro 4dr manual|Sedan|Europe|All|$33,430|$30,366|3|6|220|17|26|3583|104|179
Audi|A4 3.0 Quattro 4dr auto|Sedan|Europe|All|$34,480|$31,388|3|6|220|18|25|3627|104|179
Audi|A6 3.0 4dr|Sedan|Europe|Front|$36,640|$33,129|3|6|220|20|27|3561|109|192
Audi|A6 3.0 Quattro 4dr|Sedan|Europe|All|$39,640|$35,992|3|6|220|18|25|3880|109|192
Audi|A4 3.0 convertible 2dr|Sedan|Europe|Front|$42,490|$38,325|3|6|220|20|27|3814|105|180
Ford|Excursion 6.8 XLT|SUV|USA|All|$41,475|$36,494|6.8|10|310|10|13|7190|137|227
Ford|Expedition 4.6 XLT|SUV|USA|Front|$34,560|$30,468|4.6|8|232|15|19|5000|119|206
Ford|Explorer XLT V6|SUV|USA|All|$29,670|$26,983|4|6|210|15|20|4463|114|190
Ford|Escape XLS|SUV|USA|All|$22,515|$20,907|3|6|201|18|23|3346|103|173
Ford|Focus ZX3 2dr hatch|Sedan|USA|Front|$13,270|$12,482|2|4|130|26|33|2612|103|168
Ford|Focus LX 4dr|Sedan|USA|Front|$13,730|$12,906|2|4|110|27|36|2606|103|168
Ford|Focus SE 4dr|Sedan|USA|Front|$15,460|$14,496|2|4|130|26|33|2606|103|168
Ford|Focus ZX5 5dr|Sedan|USA|Front|$15,580|$14,607|2|4|130|26|33|2691|103|168
Ford|Focus SVT 2dr|Sedan|USA|Front|$19,135|$17,878|2|4|170|21|28|2750|103|168
Ford|Taurus LX 4dr|Sedan|USA|Front|$20,320|$18,881|3|6|155|20|27|3306|109|198
Ford|Taurus SES Duratec 4dr|Sedan|USA|Front|$22,735|$20,857|3|6|201|19|26|3313|109|198
Mitsubishi|Lancer Sportback LS|Wagon|Asia|Front|$17,495|$16,295|2.4|4|160|25|31|3020|102|181
Nissan|Pathfinder Armada SE|SUV|Asia|Front|$33,840|$30,815|5.6|8|305|13|19|5013|123|207
Nissan|Pathfinder SE|SUV|Asia|Front|$27,339|$25,972|3.5|6|240|16|21|3871|106|183
Nissan|Xterra XE V6|SUV|Asia|Front|$20,939|$19,512|3.3|6|180|17|20|3760|104|178
Nissan|Sentra 1.8 4dr|Sedan|Asia|Front|$12,740|$12,205|1.8|4|126|28|35|2513|100|178
Nissan|Sentra 1.8 S 4dr|Sedan|Asia|Front|$14,740|$13,747|1.8|4|126|28|35|2581|100|178
Nissan|Altima S 4dr|Sedan|Asia|Front|$19,240|$18,030|2.5|4|175|21|26|3039|110|192
Nissan|Sentra SE-R 4dr|Sedan|Asia|Front|$17,640|$16,444|2.5|4|165|23|28|2761|100|178
Nissan|Altima SE 4dr|Sedan|Asia|Front|$23,290|$21,580|3.5|6|245|21|26|3197|110|192
Nissan|Maxima SE 4dr|Sedan|Asia|Front|$27,490|$25,182|3.5|6|265|20|28|3473|111|194
Nissan|Maxima SL 4dr|Sedan|Asia|Front|$29,440|$26,966|3.5|6|265|20|28|3476|111|194
;
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


ods graphics / reset width=6.4in height=4.8in imagemap;

proc sgplot data=WORK.DATA2;
	title height=14pt "No. of Cylinders vs Count";
	histogram Cylinders / scale=count;
	yaxis grid;
run;

ods graphics / reset;
title;