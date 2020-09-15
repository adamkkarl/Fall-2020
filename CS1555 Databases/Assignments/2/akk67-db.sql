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


/* 4 */
INSERT INTO TECH_PERSONNEL
VALUES (1110001, 'Bob', 'Hoffman', 'bh1', 'Unix systems', '412-624-8404', 15);
INSERT INTO TECH_PERSONNEL
VALUES (1110002, 'Terry', 'Wood', 'tw1', 'Hardware', '412-624-8831', 14);
INSERT INTO TECH_PERSONNEL
VALUES (1110003, 'Russ', 'Howard', 'rh1', 'Windows Systems', '412-624-8834', 9);
INSERT INTO TECH_PERSONNEL
VALUES (1110004, 'Christian', 'Mason', 'cm1', 'Web Technology', '412-624-9181', 5);

INSERT INTO USERS
VALUES (5550001, 'Shenoda', 'Guirguis', 'shg18', '412-624-8443');
INSERT INTO USERS
VALUES (5550002, 'Lory', 'Almoakar', 'la1', '412-624-8443');
INSERT INTO USERS
VALUES (5550003, 'Thao', 'Pham', 'tp1', '412-624-8850');
INSERT INTO USERS
VALUES (5550004, 'Michel', 'Hanna', 'mh1', '412-624-8402');

INSERT INTO CATEGORIES
VALUES (1, 'Printing Problem', 'problems have to do with printers and printing')
INSERT INTO CATEGORIES
VALUES (2, 'Network Problem', 'problems have to do with the network and/or internet');
INSERT INTO CATEGORIES
VALUES (3, 'Windows OS problem', 'problems have to do with Windows OS maintenance');
INSERT INTO CATEGORIES
VALUES (4, 'Unix/Linux OS problem', 'problems have to do with Unix/Linux OS maintenance');
INSERT INTO CATEGORIES
VALUES (5, 'Hardware Problem', 'HW maintenance issues');
INSERT INTO CATEGORIES
VALUES (6, 'Software Problem', 'SW maintenance issues');
INSERT INTO CATEGORIES
VALUES (7, 'Server Problem', 'Any problem has to do with the dept. servers');
INSERT INTO CATEGORIES
VALUES (8, 'Software install', 'Requests to install additional SW');
INSERT INTO CATEGORIES
VALUES (9, 'Web Problem', 'Any problem has to do with the dept. web sites');
INSERT INTO CATEGORIES
VALUES (10, 'Windows Help', 'Questions about Windows (hotline support)');
INSERT INTO CATEGORIES
VALUES (11, 'Unix/Linux Help', 'Questions about Unix/Linux (hotline support)');
INSERT INTO CATEGORIES
VALUES (12, 'SW Help', 'Questions about installed SW (hotline support)');
INSERT INTO CATEGORIES
VALUES (13, 'AFS problem', 'Problems related to the AFS system.');

INSERT INTO LOCATIONS
VALUES (1, '6th floor', 'SENSQ', 'db research lab');
INSERT INTO LOCATIONS
VALUES (2, '6th floor', 'SENSQ', 'os research lab');
INSERT INTO LOCATIONS
VALUES (3, '5th floor', 'SENSQ', 'arch research lab');
INSERT INTO LOCATIONS
VALUES (4, '6th floor', 'SENSQ', 'java lab');
INSERT INTO LOCATIONS
VALUES (5, '5th floor', 'SENSQ', 'reading room');

INSERT INTO INVENTORY
VALUES ('acta.cs.pitt.edu', '102.168.222.226', 'sq6-52', '01:23:45:67:89:ab', 1);
INSERT INTO INVENTORY
VALUES ('kaly.cs.pitt.edu', '102.168.222.227', 'sq5-14', '01:23:45:67:89:ac', 3);
INSERT INTO INVENTORY
VALUES ('elements.cs.pitt.edu', '102.168.222.228', 'sq6-23', '01:23:45:67:89:ad', 5);
INSERT INTO INVENTORY
VALUES ('kaso.cs.pitt.edu', '102.168.222.229', 'sq6-22', '01:23:45:67:89:ae', 2);
INSERT INTO INVENTORY
VALUES ('oxgyn.cs.pitt.edu', '102.168.212.216', 'sq5-17', '01:23:45:67:89:af', 3);
INSERT INTO INVENTORY
VALUES ('rodi.cs.pitt.edu', '102.168.212.217', 'sq6-51', '01:23:45:67:89:ba', 1);
INSERT INTO INVENTORY
VALUES ('java lab machine', '102.168.212.220', 'sq6-41', '01:23:45:67:89:bb', 4);

INSERT INTO TICKETS
VALUES (000000567841, 5550001,
        TO_DATE('12-20-2019', 'MM-DD-YYYY'), TO_DATE('12-28-2019', 'MM-DD-YYYY'),
        9, 5, 'acta.cs.pitt.edu', 'The fan is noisy.');
INSERT INTO TICKETS
VALUES (000000567842, 5550002,
        TO_DATE('12-20-2019', 'MM-DD-YYYY'), TO_DATE('12-22-2019', 'MM-DD-YYYY'),
        3, 1, 'kaly.cs.pitt.edu', 'Can not print any PDF file!');
INSERT INTO TICKETS
VALUES (000000567843, 5550002,
        TO_DATE('12-23-2019', 'MM-DD-YYYY'), NULL,
        NULL, 6, 'elements.cs.pitt.edu', 'Seems that the server is down?!');
INSERT INTO TICKETS
VALUES (000000567844, 5550001,
        TO_DATE('12-28-2019', 'MM-DD-YYYY'), TO_DATE('12-31-2019', 'MM-DD-YYYY'),
        4, 6, 'acta.cs.pitt.edu', 'The AFS client crashes all the time!');
INSERT INTO TICKETS
VALUES (000000567845, 5550003,
        TO_DATE('1-1-2020', 'MM-DD-YYYY'), TO_DATE('1-5-2020', 'MM-DD-YYYY'),
        5, 4, 'kaso.cs.pitt.edu', 'The mouse responds in a weird way.');
INSERT INTO TICKETS
VALUES (000000567846, 5550002,
        TO_DATE('1-2-2020', 'MM-DD-YYYY'), TO_DATE('1-2-2020', 'MM-DD-YYYY'),
        1, 2, 'oxgyn.cs.pitt.edu', 'can not connect to the oxgyn server!');
INSERT INTO TICKETS
VALUES (000000567847, 5550001,
        TO_DATE('1-5-2020', 'MM-DD-YYYY'), TO_DATE('1-6-2020', 'MM-DD-YYYY'),
        2, 8, 'acta.cs.pitt.edu', 'I failed to login to the evaluation site.');
INSERT INTO TICKETS
VALUES (000000567848, 5550003,
        TO_DATE('1-5-2020', 'MM-DD-YYYY'), TO_DATE('1-12-2020', 'MM-DD-YYYY'),
        1, 2, 'kaso.cs.pitt.edu', 'May I have SigmaPlot installed on my machine?');
INSERT INTO TICKETS
VALUES (000000567849, 5550003,
        TO_DATE('1-13-2020', 'MM-DD-YYYY'), NULL,
        NULL, 5, 'kaso.cs.pitt.edu', 'Some keys on the keyboard does not function.');
INSERT INTO TICKETS
VALUES (000000567850, 5550004,
        TO_DATE('1-14-2020', 'MM-DD-YYYY'), NULL,
        NULL, 10, 'rodi.cs.pitt.edu', 'The sound card is unrecognized.');
INSERT INTO TICKETS
VALUES (000000567851, 5550001,
        TO_DATE('1-14-2020', 'MM-DD-YYYY'), TO_DATE('1-23-2020', 'MM-DD-YYYY'),
        10, 5, 'acta.cs.pitt.edu', 'The harddrive got bad sector.');
INSERT INTO TICKETS
VALUES (000000567852, 5550003,
        TO_DATE('1-14-2020', 'MM-DD-YYYY'), TO_DATE('1-17-2020', 'MM-DD-YYYY'),
        4, 3, 'kaso.cs.pitt.edu', 'Windows crashed!');
INSERT INTO TICKETS
VALUES (000000567853, 5550003,
        TO_DATE('1-15-2020', 'MM-DD-YYYY'), TO_DATE('1-21-2020', 'MM-DD-YYYY'),
        7, 12, 'kaso.cs.pitt.edu', 'can not reach AFS-home directory from home.');
INSERT INTO TICKETS
VALUES (000000567854, 5550001,
        TO_DATE('1-16-2020', 'MM-DD-YYYY'), TO_DATE('1-17-2020', 'MM-DD-YYYY'),
        2, 6, 'acta.cs.pitt.edu ', 'I have trouble configuring Outlook.');
INSERT INTO TICKETS
VALUES (000000567855, 5550003,
        TO_DATE('1-20-2020', 'MM-DD-YYYY'), NULL,
        NULL, 3, 'kaso.cs.pitt.edu', 'Windows crashed!');
INSERT INTO TICKETS
VALUES (000000567856, 5550004,
        TO_DATE('1-25-2020', 'MM-DD-YYYY'), NULL,
        NULL, 8, 'java lab machine', 'Can not submit my h/w using the submission site.');





