CREATE TABLE Doctor (
  did SERIAL primary key,
  dname VARCHAR(30) NOT NULL,
  specialty VARCHAR(20) NOT NULL,
  clinic INTEGER NOT NULL
);

CREATE TABLE Patient (
  pid SERIAL primary key,
  pname VARCHAR(30) NOT NULL,
  bmi INTEGER NOT NULL,
  gender VARCHAR(1) NOT NULL CHECK (gender='M' OR gender = 'F')
);
CREATE TABLE Visit (
  pid INTEGER NOT NULL,
  did INTEGER NOT NULL,
  vdate DATE NOT NULL,
  fee INTEGER DEFAULT 0 NOT NULL,
  Primary Key (pid,did,vdate),
  FOREIGN KEY (pid) REFERENCES Patient(pid)
  ON DELETE CASCADE,
  FOREIGN KEY (did) REFERENCES Doctor(did)
  ON DELETE CASCADE
);

