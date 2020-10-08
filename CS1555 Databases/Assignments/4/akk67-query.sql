----------------------------------------
----- Queries  for Assignment #4   -----
----------------------------------------

----------------------------------------
-- Name: Adam Karl
-- PittID: akk67
----------------------------------------

-- a
SELECT fname || ' ' || lname AS UserNames
FROM USERS
WHERE office_phone = '412-624-8443'
ORDER BY UserNames ASC;