create database if not exists cfe;
use cfe;
create table datos1 (
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    date_time datetime,
    plant_id int,
    source_key varchar(15),
    dc_power double,
    ac_power double,
    daily_yield double,
    total_yield double
);
create table sensores1 (
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    date_time datetime,
    plant_id int,
    source_key varchar(15),
    ambient_temperature double,
    module_temperature double,
    irradiation double
);
create table datos2 (
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    date_time datetime,
    plant_id int,
    source_key varchar(15),
    dc_power double,
    ac_power double,
    daily_yield double,
    total_yield double
);
create table sensores2 (
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    date_time datetime,
    plant_id int,
    source_key varchar(15),
    ambient_temperature double,
    module_temperature double,
    irradiation double
);
desc datos1;
desc datos2;
desc sensores1;
desc sensores2;

drop table datos1;
drop table datos2;
drop table sensores1;
drop table sensores2;

select * from datos1;
select * from datos2;
select * from sensores1;
select * from sensores2;
drop table datos2;

#Las temperaturas de los módulos solares deben coincidir con la temperatura ambiente
	# Ver la tabla sensores
    #propuesta  sensores 1
    # diferencias entre temperatura de ambiente y modulo
    select plant_id, source_key, abs(ambient_temperature - module_temperature) as diferences from sensores1 order by diferences asc;
    # sumatoria y promedio de las diferencias de temperaturas
    select plant_id, sum(diferences) as sum_diferences, avg(diferences) as avg_diferences  from (select plant_id, source_key, abs(ambient_temperature - module_temperature) as diferences from sensores1 order by diferences asc) 
    as x group by plant_id;
    # sumar las diferencias
    select sum(diferences) as sum_diferences, avg(diferences) as avg_diferences  from (select plant_id, source_key, abs(ambient_temperature - module_temperature) as diferences from sensores1 order by diferences asc) as x ;
    
    #propuesta sensores 2
    # diferencias entre temperatura de ambiente y modulo
    select plant_id, source_key, abs(ambient_temperature - module_temperature) as diferences from sensores2 order by diferences asc;
    # sumatoria y promedio de las diferencias de temperaturas
    select plant_id, sum(diferences) as sum_diferences, avg(diferences) as avg_diferences  from (select plant_id, source_key, abs(ambient_temperature - module_temperature) as diferences from sensores2 order by diferences asc) 
    as x group by plant_id;
	# sumar las diferencias
    select sum(diferences) as sum_diferences, avg(diferences) as avg_diferences  from (select plant_id, source_key, abs(ambient_temperature - module_temperature) as diferences from sensores2 order by diferences asc) as x ;
#Los inversores con mejor desempeño tomando en cuenta su rendimiento total
	select plant_id, sum(total_yield) as total_yield, avg(total_yield) as promedio_yield,sum(daily_yield) as total_daily_yield, avg(daily_yield) as promedio_daily_yield, avg(dc_power) as avg_dc_power, avg(ac_power) as avg_ad_power from datos1 group by plant_id;
	
	select plant_id, max(dc_power) max_dc_power from datos1 group by plant_id order by max_dc_power desc;
     
    select plant_id, sum(total_yield) as total_yield, avg(total_yield) as promedio_yield,sum(daily_yield) as total_daily_yield, avg(daily_yield) as promedio_daily_yield, avg(dc_power) as avg_dc_power, avg(ac_power) as avg_ad_power from datos2 group by plant_id;
    
    select plant_id, max(dc_power) max_dc_power from datos2 group by plant_id order by max_dc_power desc;

#Los paneles con mejor desempeño tomando en cuenta la cantidad de energía solar que pueden recibir (irradiación)
