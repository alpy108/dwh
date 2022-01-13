
drop table Fact_Flights;

create table Fact_Flights ( --совершенные перелеты
	fact_id serial primary key,
	flight_id integer not null,
	passenger_id text null, --Пассажир
	actual_departure timestamptz null, --Дата и время вылета (факт)
	actual_arrival timestamptz null, --Дата и время прилета (факт)
	delay_departure integer, --Задержка вылета (разница между фактической и запланированной датой в секундах)
	delay_arrival integer, --Задержка прилета (разница между фактической и запланированной датой в секундах)
	aircraft_code bpchar(3) null, --Самолет
	departure_airport bpchar(3) null, --Аэропорт вылета
	arrival_airport bpchar(3) null, --Аэропорт прилета
	fare_conditions varchar(10) null, --Класс обслуживания
	total_amount numeric(10,2) null --Стоимость
	);

	
drop table if exists Dim_Calendar;

--create table Dim_Calendar ( )-- справочник дат
	
	

drop table if exists Dim_Passengers; 

create table Dim_Passengers ( --справочник пассажиров
	pass_id serial primary key,
	passenger_id varchar(20) not null,
	passenger_name text NOT null,
	contact_data text NULL
	);

drop table if exists dim_aircrafts; 

create table dim_aircrafts ( -- справочник самолетов
	aircraft_code bpchar(3) not null,
	model text NOT NULL
	);
	
drop table if exists Dim_Airports; 

create table Dim_Airports ( -- справочник аэропортов 
	airport_code bpchar(3) not null,
	airport_name text NOT NULL,
	city text NOT NULL,
	timezone text NOT NULL
	);
	
drop table if exists Dim_Tariff; 

create table Dim_Tariff ( -- справочник тарифов (Эконом/бизнес и тд)
	tarif_id serial primary key,
	fare_conditions varchar(10) null
	);