proc import out=new_data
    datafile='/home/u62791211/testing1/Cars Data1.csv'
    dbms=csv
    replace;
    getnames=YES;
run;
