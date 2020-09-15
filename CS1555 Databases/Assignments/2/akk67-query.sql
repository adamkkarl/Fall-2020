/*
  Adam Karl
  akk67
  CS1555
  Assignment #2
 */

/* 6 */
/* a */

SELECT ticket_number, status
FROM ASSIGNMENTS
WHERE status='closed_successful';

/* b */
SELECT ticket_number, description
FROM TICKETS
WHERE machine_name='kaso.cs.pitt.edu'
