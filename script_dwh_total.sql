
drop table Fact_Flights;

create table Fact_Flights ( --����������� ��������
	fact_id serial primary key,
	flight_id integer not null,
	passenger_id text null, --��������
	actual_departure timestamptz null, --���� � ����� ������ (����)
	actual_arrival timestamptz null, --���� � ����� ������� (����)
	delay_departure integer, --�������� ������ (������� ����� ����������� � ��������������� ����� � ��������)
	delay_arrival integer, --�������� ������� (������� ����� ����������� � ��������������� ����� � ��������)
	aircraft_code bpchar(3) null, --�������
	departure_airport bpchar(3) null, --�������� ������
	arrival_airport bpchar(3) null, --�������� �������
	fare_conditions varchar(10) null, --����� ������������
	total_amount numeric(10,2) null --���������
	);

	
drop table if exists Dim_Calendar;

--create table Dim_Calendar ( )-- ���������� ���
	
	

drop table if exists Dim_Passengers; 

create table Dim_Passengers ( --���������� ����������
	pass_id serial primary key,
	passenger_id varchar(20) not null,
	passenger_name text NOT null,
	contact_data text NULL
	);

drop table if exists dim_aircrafts; 

create table dim_aircrafts ( -- ���������� ���������
	aircraft_code bpchar(3) not null,
	model text NOT NULL
	);
	
drop table if exists Dim_Airports; 

create table Dim_Airports ( -- ���������� ���������� 
	airport_code bpchar(3) not null,
	airport_name text NOT NULL,
	city text NOT NULL,
	timezone text NOT NULL
	);
	
drop table if exists Dim_Tariff; 

create table Dim_Tariff ( -- ���������� ������� (������/������ � ��)
	tarif_id serial primary key,
	fare_conditions varchar(10) null
	);