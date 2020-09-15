/*
  Adam Karl
  akk67
  CS1555
  Assignment #2
 */

/* 6 */
/* a */

SELECT ticket_number, description
FROM TICKETS
WHERE date_closed IS NOT NULL;

/* b */
SELECT ticket_number, description
FROM TICKETS
WHERE machine_name='kaso.cs.pitt.edu'
