set echo on
set heading on

spool createTables.txt

DROP TABLE Registration;
DROP TABLE Plate;
DROP TABLE Vehicle;
DROP TABLE Model;
DROP TABLE Make;

CREATE TABLE Make(
    make_name char(30), 
    make_origin char(30), 
    PRIMARY KEY (make_name));

CREATE TABLE Model(
    model_name char(30), 
    model_year char(4), 
    make_name char(30), 
    CONSTRAINT fk_make_name FOREIGN KEY (make_name) REFERENCES Make(make_name), 
    PRIMARY KEY(model_name, model_year));

CREATE TABLE Vehicle(
    vin char(50), 
    color char(3), 
    model_name char(30), 
    model_year char(4), 
    mileage number(10), 
    CONSTRAINT fk_model_name_year FOREIGN KEY (model_name, model_year) REFERENCES Model(model_name, model_year), 
    PRIMARY KEY(vin));

CREATE TABLE Plate(
    state char(2), 
    plate char(7), 
    vin char(50), 
    CONSTRAINT fk_vin FOREIGN KEY (vin) REFERENCES Vehicle(vin), 
    PRIMARY KEY(plate));

CREATE TABLE Registration(
    from_date date, 
    to_date date, 
    owner char(50), 
    vin char(50), 
    CONSTRAINT fk_vin2 FOREIGN KEY (vin) REFERENCES Vehicle(vin), 
    plate char(7), 
    CONSTRAINT fk_plate2 FOREIGN KEY (plate) REFERENCES Plate(plate), 
    PRIMARY KEY(from_date, to_date, vin, plate));

spool off