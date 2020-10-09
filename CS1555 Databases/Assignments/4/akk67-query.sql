----------------------------------------
----- Queries  for Assignment #4   -----
----------------------------------------

----------------------------------------
-- Name: Adam Karl
-- PittID: akk67
----------------------------------------

----- 1
-- a
SELECT fname || ' ' || lname AS UserNames
FROM USERS
WHERE office_phone = '412-624-8443'
ORDER BY UserNames ASC;

-- b
SELECT DISTINCT USERS.fname, USERS.lname
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
SELECT owner_pplsoft FROM
(
    SELECT owner_pplsoft, COUNT(owner_pplsoft) AS num_tickets
    FROM TICKETS
    WHERE date_submitted BETWEEN TO_DATE('2020/01/01', 'yyyy/mm/dd')
        AND TO_DATE('2020/01/31', 'yyyy/mm/dd')
    GROUP BY owner_pplsoft
) tmp
WHERE num_tickets > 5;

-- e
SELECT AVG(Coalesce(days_worked_on, 0)) AS AVERAGE_DAYS_WORKED_ON
FROM TICKETS
WHERE date_submitted BETWEEN TO_DATE('2020/01/01', 'yyyy/mm/dd')
    AND TO_DATE('2020/01/31', 'yyyy/mm/dd');

-- f
SELECT fname || ' ' || lname AS UserNames
FROM USERS
JOIN TICKETS ON USERS.pplsoft = TICKETS.owner_pplsoft
GROUP BY pplsoft
ORDER BY COUNT(pplsoft) ASC
LIMIT 1;

-- g
SELECT TICKETS.machine_name, COUNT(TICKETS.ticket_number) AS Problems
FROM TICKETS
LEFT JOIN INVENTORY ON INVENTORY.machine_name = TICKETS.machine_name
LEFT JOIN LOCATIONS ON INVENTORY.location_id = LOCATIONS.location_id
WHERE LOCATIONS.building = 'SENSQ'
  AND LOCATIONS.location = '5th floor'
GROUP BY TICKETS.machine_name
LIMIT 3;

-- h
SELECT date_submitted
FROM (
    SELECT date_submitted, RANK() OVER (
    ORDER BY COUNT(date_submitted) DESC
    ) AS RANK
    FROM TICKETS
    WHERE date_submitted BETWEEN TO_DATE('2019/12/01', 'yyyy/mm/dd')
    AND TO_DATE('2019/12/31', 'yyyy/mm/dd')
    GROUP BY date_submitted
) AS tmp
WHERE (RANK=3 OR RANK=5);

-- i
SELECT CATEGORIES.category, COUNT(TICKETS.ticket_number) AS num_tickets
FROM CATEGORIES
JOIN TICKETS ON CATEGORIES.category_id = TICKETS.category_id
WHERE TICKETS.date_submitted BETWEEN TO_DATE('2020/01/01', 'yyyy/mm/dd')
    AND TO_DATE('2020/01/31', 'yyyy/mm/dd')
GROUP BY CATEGORIES.category_id
ORDER BY COUNT(TICKETS.ticket_number) DESC
LIMIT 2;


----- 3
-- a
CREATE OR REPLACE VIEW TICKET_CATEGORIES
AS SELECT category_id, COUNT(ticket_number) AS num_tickets
FROM TICKETS
WHERE date_submitted BETWEEN TO_DATE('2020/01/01', 'yyyy/mm/dd')
    AND TO_DATE('2020/01/31', 'yyyy/mm/dd')
GROUP BY category_id;

SELECT CATEGORIES.category, TICKET_CATEGORIES.num_tickets
FROM TICKET_CATEGORIES
JOIN CATEGORIES ON CATEGORIES.category_id = TICKET_CATEGORIES.category_id
ORDER BY TICKET_CATEGORIES.num_tickets DESC
LIMIT 2;


-- b
CREATE OR REPLACE VIEW TECH_WORKTIME
AS SELECT ASSIGNMENT.tech_pplsoft, SUM(TICKETS.days_worked_on) AS Work_Time
FROM ASSIGNMENT
JOIN TICKETS ON ASSIGNMENT.ticket_number = TICKETS.ticket_number
GROUP BY tech_pplsoft;

SELECT fname || ' ' || lname AS TechNames, TECH_WORKTIME.Work_Time AS Work_Time
FROM TECH_PERSONNEL
LEFT JOIN TECH_WORKTIME ON TECH_PERSONNEL.pplsoft = TECH_WORKTIME.tech_pplSoft
ORDER BY TECH_WORKTIME.Work_Time ASC;


