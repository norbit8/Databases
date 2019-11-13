CREATE TABLE Customer
(
    c_id int,
    name varchar(50) NOT NULL,
    phone varchar(50) NOT NULL,
    PRIMARY KEY(c_id)
);

CREATE TABLE Aeroplane
(
    a_id int PRIMARY KEY,
    model varchar(50) NOT NULL,
    year int NOT NULL
);

CREATE TABLE Vip
(
    c_id int,
    points int NOT NULL CHECK(points > 0),
    FOREIGN KEY (c_id) REFERENCES Customer(c_id)
);

CREATE TABLE Regular
(
    c_id int,
    FOREIGN KEY (c_id) REFERENCES Customer(c_id)
);

CREATE TABLE Flight
(
    f_num int,
    date DATE NOT NULL,
    time TIME NOT NULL,
    a_id int NOT NULL,
    PRIMARY KEY (f_num),
    FOREIGN KEY (a_id) REFERENCES Aeroplane (a_id)
);

CREATE TABLE Flight_ticket
(
    row_num int check(row_num >= 1 AND row_num <= 20),
    seat_char varchar(1) check(ASCII(seat_char) >= 65 AND ASCII(seat_char) <= 74),
    f_num int,
    price int NOT NULL CHECK(price > 0),
    PRIMARY KEY (row_num, seat_char, f_num)
);

CREATE TABLE Regular_ticket
(
    row_num int,
    seat_char varchar(1),
    f_num int,
    PRIMARY KEY (row_num, seat_char, f_num),
    FOREIGN KEY (row_num, seat_char, f_num) REFERENCES Flight_ticket (row_num, seat_char, f_num)
);


CREATE TABLE Vip_ticket
(
    row_num int,
    seat_char varchar(1),
    f_num int,
    PRIMARY KEY (row_num, seat_char, f_num),
    FOREIGN KEY (row_num, seat_char, f_num) REFERENCES Flight_ticket (row_num, seat_char, f_num)
);

CREATE TABLE Pilot
(
    p_id int PRIMARY KEY,
    name varchar(50) NOT NULL
);

CREATE TABLE Flying
(
    p_id int,
    f_num int,
    PRIMARY KEY(p_id, f_num),
    FOREIGN KEY (p_id) REFERENCES Pilot (p_id),
    FOREIGN KEY (f_num) REFERENCES Flight (f_num)
);

CREATE TABLE Vip_reservations
(
    row_num int,
    seat_char varchar(1),
    f_num int,
    PRIMARY KEY (row_num, seat_char, f_num),
    FOREIGN KEY (row_num, f_num, seat_char) REFERENCES Vip_ticket (row_num, f_num, seat_char)
);

CREATE TABLE Regular_reservations
(
    row_num int,
    seat_char varchar(1),
    f_num int,
    c_id int,
    PRIMARY KEY (row_num, seat_char, f_num),
    FOREIGN KEY (row_num, f_num, seat_char) REFERENCES Regular_ticket (row_num, f_num, seat_char),
    FOREIGN KEY (c_id) REFERENCES Customer(c_id)
);