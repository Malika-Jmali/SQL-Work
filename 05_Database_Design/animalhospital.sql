CREATE TABLE pet 
id serial,
name varchar(255) NOT NULL,
type varchar(255),
age integer,
CONSTRAINT pk_pet_id PRIMARY KEY (id);

CREATE TABLE pet_owner
pet_ID integer NOT NULL,
owner_ID integer NOT NULL,
CONSTRAINT pk_pet_owner_id PRIMARY KEY (pet_ID, owner_ID); 

CREATE TABLE owner 
id serial,
first_name varchar(255),
last_name varchar(255),
CONSTRAINT pk_owner_id PRIMARY KEY (id);

CREATE TABLE owner_address
address_ID integer NOT NULL,
owner_ID integer NOT NULL,
CONSTRAINT pk_owner_address_id PRIMARY KEY (address_ID, owner_ID); 
CONSTRAINT fk_address_id FOREIGN KEY (address_ID),
CONSTRAINT fk_owner_id FOREIGN KEY (owner_ID),

CREATE TABLE address 
id serial,
street_address varchar(255) NOT NULL,
city varchar(255),
state varchar(255),
country varchar(255),
zip_code varchar(255),
CONSTRAINT pk_address_id PRIMARY KEY (id);

CREATE TABLE visit
id serial NOT NULL,
visit_time timestamp NOT NULL,
pet_ID integer NOT NULL,
owner_ID integer NOT NULL,
procedure_ID integer NOT NULL,
CONSTRAINT pk_visit_id PRIMARY KEY (id),
CONSTRAINT fk_pet_id FOREIGN KEY (pet_ID),
CONSTRAINT fk_owner_id FOREIGN KEY (owner_ID),
CONSTRAINT fk_procedure_id FOREIGN KEY (procedure_ID);

CREATE TABLE visit_procedure
visit_ID integer NOT NULL,
procedure_ID integer NOT NULL,
CONSTRAINT pk_visit_procedure_id PRIMARY KEY (visit_ID, procedure_ID),
CONSTRAINT fk_visit_id FOREIGN KEY (visit_ID),
CONSTRAINT fk_procedure_id FOREIGN KEY (procedure_ID);

CREATE TABLE procedure
id serial NOT NULL,
description varchar(255),
CONSTRAINT pk_procedure_id PRIMARY KEY (id);

