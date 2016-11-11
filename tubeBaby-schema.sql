
DROP TABLE Hospital;
CREATE TABLE Hospital (
	hospital_no        varchar(12) not null,
	hospital_name      varchar(12) not null,
	hospital_address   varchar(20) not null,
	hospital_telephone varchar(12) not null,
	primary key (hospital_no)
);

DROP TABLE Doctor;
CREATE TABLE Doctor (
	dr_name           varchar(15) not null,
	dr_lname          varchar(15) not null,
	dr_no             varchar(12) not null,
	hospital_no       varchar(12) not null,
	dr_cell_telephone varchar(12),
	primary key (dr_no),
	foreign key (hospital_no) references Hospital(hospital_no)
);

DROP TABLE Patient;
CREATE TABLE Patient (
	patient_name     varchar(15) not null,
	patient_lname    varchar(15) not null,
	patient_tc_no    varchar(12) not null,
	patient_bdate    date,
	patient_cell_tel varchar(12),
	patient_sex      varchar,
	dr_no            varchar(12) not null,
	primary key (patient_tc_no),
	foreign key (dr_no) references Doctor(dr_no)
);

DROP TABLE PatientPartner;
CREATE TABLE PatientPartner (
	pp_name         varchar(15) not null,
	pp_lname        varchar(15) not null,
	pp_tc_no        varchar(12) not null,
	pp_bdate        date,
	pp_cell_tel     varchar(12),
	pp_sex          char,
	patient_tc_no   varchar(15) not null,
	primary key (pp_tc_no),
	foreign key (patient_tc_no) references Patient(patient_tc_no)
);

DROP TABLE Aile;
CREATE TABLE Aile (
	--aile_no				    smallint,	-- aile no kavramina gerek yok?	
																-- istersek foreign keyleri birlestirebiliriz.					
	a_evlilik_tarihi	date,
	a_hasta_tc				varchar(12) not null,
	a_es_tc						varchar(12) not null, 		
	aile_adress				varchar(30),
	a_haveAchild			boolean default false,
	primary key (a_hasta_tc, a_es_tc),
	foreign key (a_hasta_tc) references Hasta(hasta_tc_no),
	foreign key (a_es_tc) references HastaEsi(es_tc_no)
);

DROP TABLE Odalar;
CREATE TABLE Odalar (
	hastane_no				varchar(12) not null,
	dr_no			        varchar(12), -- illa odanin dolu olmasi gerekmiyor.
	oda_no				    varchar(12) not null,
	kat								char not null,
	primary key (oda_no),
	foreign key (hastane_no) references Hastane(hastane_no),
	foreign key (dr_no)  references Doktor(dr_no)
);

DROP TABLE Telefon_info;
CREATE TABLE Telefon_info (
	hastane_no		varchar(12) not null,
	dr_no					varchar(12), -- illa odanin dolu olmasi gerekmiyor.
	oda_no				varchar(12) not null,
	tel_no				varchar(12) not null,
	primary key (tel_no),
	foreign key (hastane_no) references Hastane(hastane_no),
	foreign key (dr_no) 	 references Doktor(dr_no),
	foreign key (oda_no) 	 references Odalar(oda_no)
);

DROP TABLE Ilac;
CREATE TABLE Ilac (
	ilac_no					varchar(12) not null,
	ilac_ismi				varchar(12) not null,
	ilac_turu				varchar(30),
	primary key (ilac_no)
);

DROP TABLE Ilac_Hasta;
CREATE TABLE Ilac_Hasta (
	hasta_tc_no			varchar(12),
	ilac_no					varchar(12),
	primary key (hasta_tc_no, ilac_no),
	foreign key (hasta_tc_no) references Hasta(hasta_tc_no),
	foreign key (ilac_no) references Ilac(ilac_no)
);

