

--insert Make values
INSERT INTO Make VALUES('Toyota', 'Japan');
INSERT INTO Make VALUES('Tesla', 'USA');
INSERT INTO Make VALUES('BMW', 'Germany');
INSERT INTO Make VALUES('Chevy', 'USA');
INSERT INTO Make VALUES('Ford', 'USA');

--insert Model values
INSERT INTO Model VALUES('Camry', '2016', 'Toyota');
INSERT INTO Model VALUES('Camry', '2015', 'Toyota');
INSERT INTO Model VALUES('Corola', '2015', 'Toyota');
INSERT INTO Model VALUES('i3', '2016', 'BMW');
INSERT INTO Model VALUES('i8', '2016', 'BMW');
INSERT INTO Model VALUES('F-150', '2016', 'Ford');
INSERT INTO Model VALUES('Tahoe', '2015', 'Chevy');


--insert vehicle values
INSERT INTO Vehicle VALUES('7812LJSKLDJF982789JF', 'RED', 'Camry', '2016', 100000);

--insert plate values
INSERT INTO Plate VALUES('CA', '7DJW931', '7812LJSKLDJF982789JF');


--insert registration values
INSERT INTO Registration VALUES('20-JUN-2016', '20-JUN-2016', 'Chris Johnson', '7812LJSKLDJF982789JF', '7DJW931');