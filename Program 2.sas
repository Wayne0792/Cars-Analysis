proc import out=new_data
    datafile='/home/u62791211/testing1/Cars Data1.csv'
    dbms=csv
    replace;
    getnames=YES;
run;

/*Adds a unique ID to the table*/
data new_data;
set new_data;
id = _N_;
run;
