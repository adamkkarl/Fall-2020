/*
  Adam Karl
  akk67
  CS1555
  Assignment #2
 */

/* 5 */

/* test pk pplSoft cannot be NULL in table TECH_PERSONNEL */
INSERT INTO TECH_PERSONNEL
VALUES (NULL, 'Dan', 'Hoffman', 'bh1', 'Unix systems', '412-624-8404', 15);

/* test pk category_id cannot be NULL in table CATEGORIES */
INSERT INTO CATEGORIES
VALUES (NULL, 'Printing Problem', 'problems have to do with printers and printing');

/* test pk location_id cannot be NULL in table LOCATIONS */
INSERT INTO LOCATIONS
VALUES (NULL, '6th floor', 'SENSQ', 'db research lab');

/* test pk mac_address cannot be NULL in table INVENTORY */
INSERT INTO INVENTORY
VALUES ('acta.cs.pitt.edu', '102.168.222.226', 'sq6-52', NULL, 1);
/* test validity of fk location_id in table INVENTORY */
INSERT INTO INVENTORY
VALUES ('acta.cs.pitt.edu', '102.168.222.226', 'sq6-52', '01:23:99:67:89:ab', 94981982);

/* test pk ticket_number cannot be NULL in table TICKETS */
INSERT INTO TICKETS
VALUES (NULL, 5550001,
        TO_DATE('12-20-2019', 'MM-DD-YYYY'), TO_DATE('12-28-2019', 'MM-DD-YYYY'),
        9, 5, 'acta.cs.pitt.edu', 'The fan is noisy.');
/* test validity of fk category_id in table TICKETS */
INSERT INTO TICKETS
VALUES (000000569941, 5550001,
        TO_DATE('12-20-2019', 'MM-DD-YYYY'), TO_DATE('12-28-2019', 'MM-DD-YYYY'),
        9, 12345, 'acta.cs.pitt.edu', 'The fan is noisy.');
/* test validity of fk owner_pplSoft in table TICKETS */
INSERT INTO TICKETS
VALUES (000000569841, 1230001,
        TO_DATE('12-20-2019', 'MM-DD-YYYY'), TO_DATE('12-28-2019', 'MM-DD-YYYY'),
        9, 5, 'acta.cs.pitt.edu', 'The fan is noisy.');

/* test pk ticket_number cannot be NULL in table ASSIGNMENTS */
INSERT INTO ASSIGNMENTS
VALUES (NULL, 1110001, TO_DATE('12-20-2019', 'MM-DD-YYYY'),
        'delegated');
/* test pk status cannot be NULL in table ASSIGNMENTS */
INSERT INTO ASSIGNMENTS
VALUES (000000567841, 1110001, TO_DATE('12-20-2019', 'MM-DD-YYYY'),
        NULL);
/* test validity of fk ticket_number in table ASSIGNMENTS */
INSERT INTO ASSIGNMENTS
VALUES (01234123, 1110001, TO_DATE('12-20-2019', 'MM-DD-YYYY'),
        'delegated');
/* test validity of fk tech_pplSoft in table ASSIGNMENTS */
INSERT INTO ASSIGNMENTS
VALUES (000000567841, 9876543, TO_DATE('12-20-2019', 'MM-DD-YYYY'),
        'assigned');







