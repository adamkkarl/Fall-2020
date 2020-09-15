/*
  Adam Karl
  akk67
  CS1555
  Assignment #2
 */

/* 5 */

/* test pplSoft cannot be NULL */
INSERT INTO TECH_PERSONNEL
VALUES (NULL, 'Dan', 'Hoffman', 'bh1', 'Unix systems', '412-624-8404', 15);

/* test category_id cannot be NULL */
INSERT INTO CATEGORIES
VALUES (NULL, 'Printing Problem', 'problems have to do with printers and printing');

/* test location_id cannot be NULL */
INSERT INTO LOCATIONS
VALUES (NULL, '6th floor', 'SENSQ', 'db research lab');

/* test mac_address cannot be NULL */
INSERT INTO INVENTORY
VALUES ('acta.cs.pitt.edu', '102.168.222.226', 'sq6-52', NULL, 1);
/* test invalid foreign key location_id */
INSERT INTO INVENTORY
VALUES ('acta.cs.pitt.edu', '102.168.222.226', 'sq6-52', '01:23:99:67:89:ab', 94981982);

/* test ticket_number cannot be NULL */
INSERT INTO TICKETS
VALUES (NULL, 5550001,
        TO_DATE('12-20-2019', 'MM-DD-YYYY'), TO_DATE('12-28-2019', 'MM-DD-YYYY'),
        9, 5, 'acta.cs.pitt.edu', 'The fan is noisy.');
/* test invalid foreign key category_id */
INSERT INTO TICKETS
VALUES (000000569941, 5550001,
        TO_DATE('12-20-2019', 'MM-DD-YYYY'), TO_DATE('12-28-2019', 'MM-DD-YYYY'),
        9, 12345, 'acta.cs.pitt.edu', 'The fan is noisy.');
/* test invalid foreign key owner_pplSoft */
INSERT INTO TICKETS
VALUES (000000569841, 1230001,
        TO_DATE('12-20-2019', 'MM-DD-YYYY'), TO_DATE('12-28-2019', 'MM-DD-YYYY'),
        9, 5, 'acta.cs.pitt.edu', 'The fan is noisy.');

/* test ticket_number cannot be NULL */
INSERT INTO ASSIGNMENTS
VALUES (NULL, 1110001, TO_DATE('12-20-2019', 'MM-DD-YYYY'),
        'delegated');
/* test status cannot be NULL */
INSERT INTO ASSIGNMENTS
VALUES (000000567841, 1110001, TO_DATE('12-20-2019', 'MM-DD-YYYY'),
        NULL);
/* test invalid foreign key ticket_number */
INSERT INTO ASSIGNMENTS
VALUES (01234123, 1110001, TO_DATE('12-20-2019', 'MM-DD-YYYY'),
        'delegated');
/* test invalid foreign key tech_pplSoft */
INSERT INTO ASSIGNMENTS
VALUES (000000567841, 9876543, TO_DATE('12-20-2019', 'MM-DD-YYYY'),
        'assigned');







