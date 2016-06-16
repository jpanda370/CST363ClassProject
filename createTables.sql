set echo on
set heading on

spool createTables.txt

drop table Registration;
drop table Plate;
drop table Vehicle;
drop table Model;
drop table Make;

create table Make(make_name char(30), make_origin char(30), PRIMARY KEY (make_name));
create table Model(model_name char(30), model_year char(4), make_name char(30), CONSTRAINT fk_make_name FOREIGN KEY (make_name) REFERENCES Make(make_name), PRIMARY KEY(model_name, model_year));
create table Vehicle(vin char(50), color char(3), model_name char(30), model_year char(4), CONSTRAINT fk_model_name_year FOREIGN KEY (model_name, model_year) REFERENCES Model(model_name, model_year), PRIMARY KEY(vin));
create table Plate(state char(2), plate char(7), vin char(50), CONSTRAINT fk_vin FOREIGN KEY (vin) REFERENCES Vehicle(vin), PRIMARY KEY(plate));
create table Registration(from_date date, to_date date, owner char(50), vin char(50), CONSTRAINT fk_vin2 FOREIGN KEY (vin) REFERENCES Vehicle(vin), plate char(7), CONSTRAINT fk_plate2 FOREIGN KEY (plate) REFERENCES Plate(plate), PRIMARY KEY(from_date, to_date, vin, plate));

insert into Make values('Toyota', 'Japan');
insert into Make values('Tesla', 'USA');
insert into Make values('BMW', 'Germany');
insert into Make values('Chevy', 'USA');
insert into Make values('Ford', 'USA');

insert into Model values('Camry', '2016', 'Toyota');
insert into Model values('Camry', '2015', 'Toyota');
insert into Model values('Corola', '2015', 'Toyota');
insert into Model values('i3', '2016', 'BMW');
insert into Model values('i8', '2016', 'BMW');
insert into Model values('F-150', '2016', 'Ford');
insert into Model values('Tahoe', '2015', 'Chevy');

insert into Vehicle values('7812LJSKLDJF982789JF', 'RED', 'Camry', '2016');
insert into Plate values('CA', '7DJW931', '7812LJSKLDJF982789JF');
insert into Registration values('20-JUN-2016', '20-JUN-2016', 'Chris Johnson', '7812LJSKLDJF982789JF', '7DJW931');


spool off