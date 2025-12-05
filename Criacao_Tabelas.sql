-- ===========================================================
-- DATABASE CREATION
-- ===========================================================
CREATE DATABASE IF NOT EXISTS company;
USE company;

-- ===========================================================
-- TABLE: DEPARTMENT
-- ===========================================================
CREATE TABLE department (
    Dname          VARCHAR(20) NOT NULL,
    Dnumber        INT NOT NULL PRIMARY KEY,
    Mgr_ssn        CHAR(9),
    Mgr_start_date DATE,
    UNIQUE (Dname)
);

-- ===========================================================
-- TABLE: EMPLOYEE
-- ===========================================================
CREATE TABLE employee (
    Fname     VARCHAR(15) NOT NULL,
    Minit     CHAR(1),
    Lname     VARCHAR(15) NOT NULL,
    Ssn       CHAR(9) NOT NULL PRIMARY KEY,
    Bdate     DATE,
    Address   VARCHAR(30),
    Sex       CHAR(1),
    Salary    DECIMAL(10,2),
    Super_ssn CHAR(9),
    Dno       INT NOT NULL,
    FOREIGN KEY (Super_ssn) REFERENCES employee(Ssn),
    FOREIGN KEY (Dno) REFERENCES department(Dnumber)
);

-- ===========================================================
-- TABLE: DEPT_LOCATIONS
-- ===========================================================
CREATE TABLE dept_locations (
    Dnumber    INT NOT NULL,
    Dlocation  VARCHAR(20) NOT NULL,
    PRIMARY KEY (Dnumber, Dlocation),
    FOREIGN KEY (Dnumber) REFERENCES department(Dnumber)
);

-- ===========================================================
-- TABLE: PROJECT
-- ===========================================================
CREATE TABLE project (
    Pname      VARCHAR(20) NOT NULL,
    Pnumber    INT NOT NULL PRIMARY KEY,
    Plocation  VARCHAR(20),
    Dnum       INT NOT NULL,
    UNIQUE (Pname),
    FOREIGN KEY (Dnum) REFERENCES department(Dnumber)
);

-- ===========================================================
-- TABLE: WORKS_ON
-- ===========================================================
CREATE TABLE works_on (
    Essn   CHAR(9) NOT NULL,
    Pno    INT NOT NULL,
    Hours  DECIMAL(3,1),
    PRIMARY KEY (Essn, Pno),
    FOREIGN KEY (Essn) REFERENCES employee(Ssn),
    FOREIGN KEY (Pno)  REFERENCES project(Pnumber)
);

-- ===========================================================
-- TABLE: DEPENDENT
-- ===========================================================
CREATE TABLE dependent (
    Essn             CHAR(9) NOT NULL,
    Dependent_name   VARCHAR(15) NOT NULL,
    Sex              CHAR(1),
    Bdate            DATE,
    Relationship     VARCHAR(15),
    PRIMARY KEY (Essn, Dependent_name),
    FOREIGN KEY (Essn) REFERENCES employee(Ssn)
);
