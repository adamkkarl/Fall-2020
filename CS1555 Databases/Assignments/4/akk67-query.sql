----------------------------------------
----- Queries  for Assignment #4   -----
----------------------------------------

----------------------------------------
-- Name: Adam Karl
-- PittID: akk67
----------------------------------------

-- 1
-- a
SELECT fname || ' ' || lname AS UserNames
FROM USERS
WHERE office_phone = '412-624-8443'
ORDER BY UserNames ASC;

-- b
SELECT DISTINCT USERs.fname, USERS.lname
FROM USERS
INNER JOIN TICKETS ON TICKETS.owner_pplsoft = USERS.pplsoft
INNER JOIN ASSIGNMENT ON ASSIGNMENT.ticket_number = TICKETS.ticket_number
WHERE ASSIGNMENT.date_assigned >= TO_DATE('2020/01/01', 'yyyy/mm/dd')
AND ASSIGNMENT.status = 'in_progress';

-- c
SELECT A.fname || ' ' || A.lname AS Staff, B.fname || ' ' || B.lname AS Supervisor
FROM TECH_PERSONNEL A
LEFT JOIN TECH_PERSONNEL B ON A.supervisor = b.pplsoft;

-- d
SELECT owner_pplsoft
FROM TICKETS
WHERE date_submitted >= TO_DATE('2020/01/01', 'yyyy/mm/dd')
GROUP BY owner_pplsoft
ORDER BY 5;

SELECT owner_pplsoft FROM
(
    SELECT owner_pplsoft, COUNT(owner_pplsoft) AS num_tickets
    FROM TICKETS
    WHERE date_submitted >= TO_DATE('2020/01/01', 'yyyy/mm/dd')
    GROUP BY owner_pplsoft
) tmp
WHERE num_tickets > 5;


