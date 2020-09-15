/*
  Adam Karl
  akk67
  CS1555
  Assignment #2
 */


/* 1.
 TECH_PERSONNEL
 arity: 6
 cardinality: 0

 USERS
 arity: 5
 cardinality: 0

 CATEGORIES
 arity: 3
 cardinality: 0

 INVENTORY
 arity: 5
 cardinality: 0

 LOCATIONS
 arity: 4
 cardinality: 0

 TICKETS
 arity: 9
 cardinality: 0

 ASSIGNMENTS
 arity: 4
 cardinality: 0
 */

/* 2. */
DROP TABLE IF EXISTS ASSIGNMENTS;
DROP TABLE IF EXISTS TICKETS;
DROP TABLE IF EXISTS INVENTORY;
DROP TABLE IF EXISTS LOCATIONS;
DROP TABLE IF EXISTS CATEGORIES;
DROP TABLE IF EXISTS USERS;
DROP TABLE IF EXISTS TECH_PERSONNEL;

/* assume first and last name are 20 chars or fewer */
CREATE TABLE TECH_PERSONNEL (
    pplSoft int NOT NULL,
    fname   varchar(20) NOT NULL,
    lname   varchar(20) NOT NULL,
    pittID  varchar(10),
    expertise   varchar(20),
    office_phone    char(12),
    CONSTRAINT TECH_PERSONNEL_pk PRIMARY KEY (pplSoft)
);

/* assume first and last name are 20 chars or fewer */
CREATE TABLE USERS (
    pplSoft int NOT NULL,
    fname   varchar(20) NOT NULL,
    lname   varchar(20) NOT NULL,
    pittID  varchar(10),
    office_phone    char(12),
    CONSTRAINT USERS_pk PRIMARY KEY (pplSoft)
);

/* assume category names are 30 chars or fewer */
CREATE TABLE CATEGORIES (
    category_id int NOT NULL,
    category    varchar(30),
    description varchar(280),
    CONSTRAINT CATEGORIES_pk PRIMARY KEY (category_id)
);

/* assume location names are 20 chars or fewer */
/* assume building names are 10 chars or fewer */
CREATE TABLE LOCATIONS (
    location_id int NOT NULL,
    location    varchar(20),
    building    varchar(10),
    notes   varchar(280),
    CONSTRAINT LOCATIONS_pk PRIMARY KEY (location_id)
);

/* assume machine names are 30 chars or fewer */
/* assume network port names are 10 chars or fewer */
CREATE TABLE INVENTORY (
    machine_name    varchar(30),
    ip_address  varchar(20),
    network_port    varchar(10),
    mac_address varchar(20) NOT NULL,
    location_id int,
    CONSTRAINT INVENTORY_pk PRIMARY KEY (mac_address),
    CONSTRAINT INVENTORY_loc_fk FOREIGN KEY (location_id) REFERENCES LOCATIONS
                       ON UPDATE CASCADE
);

/* assume machine names are 30 chars or fewer */
CREATE TABLE TICKETS (
    ticket_number   int NOT NULL,
    owner_pplSoft   int NOT NULL,
    date_submitted  date,
    date_closed date,
    days_worked_on  int,
    category_id int NOT NULL,
    machine_name    varchar(30),
    location    int, /* =================== */
    description varchar(280),
    CONSTRAINT TICKETS_pk PRIMARY KEY (ticket_number),
    CONSTRAINT TICKETS_loc_fk FOREIGN KEY (location) REFERENCES LOCATIONS (location_id)
                      ON UPDATE CASCADE,
    CONSTRAINT TICKETS_category_fk FOREIGN KEY (category_id) REFERENCES CATEGORIES (category_id)
                      ON UPDATE CASCADE,
    CONSTRAINT TICKETS_owner_fk FOREIGN KEY (owner_pplSoft) REFERENCES USERS (pplSoft)
                      ON UPDATE CASCADE
);

CREATE TABLE ASSIGNMENTS (
    ticket_number   int,
    tech_pplSoft    int,
    date_assigned   date,
    status  varchar(20),
    CONSTRAINT ASSIGNMENTS_pk PRIMARY KEY (ticket_number),
    CONSTRAINT ASSIGNMENTS_ticket_fk FOREIGN KEY (ticket_number) REFERENCES TICKETS
                          ON UPDATE CASCADE,
    CONSTRAINT ASSIGNMENTS_tech_pplsoft_fk FOREIGN KEY (tech_pplSoft) REFERENCES TECH_PERSONNEL (pplSoft)
                          ON UPDATE CASCADE
);

/* 3 */
/* a */
ALTER TABLE TICKETS
DROP COLUMN location;

/* b */
ALTER TABLE ASSIGNMENTS
ADD COLUMN outcome  varchar(280);

/* c */
ALTER TABLE TECH_PERSONNEL
ADD COLUMN years_of_experience int DEFAULT 0;

/* d */
ALTER TABLE TECH_PERSONNEL
ADD COLUMN supervisor int DEFAULT 1110001;

/* e */
ALTER TABLE TICKETS
ALTER COLUMN days_worked_on SET DEFAULT 0;
