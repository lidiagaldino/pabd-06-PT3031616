CREATE SCHEMA avaliacaocontinua;

CREATE TABLE avaliacaocontinua.company (
    company_name VARCHAR(255) NOT NULL,
    city VARCHAR(255),
    PRIMARY KEY (company_name)
);

CREATE TABLE avaliacaocontinua.employee (
    person_name VARCHAR(255) NOT NULL,
    street VARCHAR(255),
    city VARCHAR(255),
    PRIMARY KEY (person_name)
);

CREATE TABLE avaliacaocontinua.manages (
    person_name VARCHAR(255) NOT NULL,
    manager_name VARCHAR(255),
    PRIMARY KEY (person_name)
);

CREATE TABLE avaliacaocontinua.works (
    person_name VARCHAR(255) NOT NULL,
    company_name VARCHAR(255) NOT NULL,
    salary DECIMAL(10,2),
    PRIMARY KEY (person_name)
);

ALTER TABLE avaliacaocontinua.works
ADD CONSTRAINT fk_works_employee
FOREIGN KEY (person_name) 
REFERENCES avaliacaocontinua.employee(person_name)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE avaliacaocontinua.works
ADD CONSTRAINT fk_works_company
FOREIGN KEY (company_name) 
REFERENCES avaliacaocontinua.company(company_name)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE avaliacaocontinua.manages
ADD CONSTRAINT fk_manages_employee
FOREIGN KEY (person_name) 
REFERENCES avaliacaocontinua.employee(person_name)
ON UPDATE CASCADE
ON DELETE CASCADE;