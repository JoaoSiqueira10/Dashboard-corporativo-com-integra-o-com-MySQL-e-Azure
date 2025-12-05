SELECT 
    CONCAT(e.Fname, ' ', e.Lname) AS EmployeeName,
    e.Ssn AS EmployeeSSN,
    p.Pname AS ProjectName,
    w.Hours
FROM works_on w
JOIN employee e ON w.Essn = e.Ssn
JOIN project p ON w.Pno = p.Pnumber
ORDER BY p.Pname, EmployeeName;

SELECT 
    CONCAT(e.Fname, ' ', e.Lname) AS EmployeeName,
    CONCAT(s.Fname, ' ', s.Lname) AS SupervisorName
FROM employee e
LEFT JOIN employee s
    ON e.Super_ssn = s.Ssn
ORDER BY EmployeeName;


SELECT 
    CONCAT(e.Fname, ' ', e.Lname) AS EmployeeName,
    COALESCE(SUM(w.Hours), 0) AS TotalHours
FROM employee e
LEFT JOIN works_on w ON e.Ssn = w.Essn
GROUP BY e.Ssn, e.Fname, e.Lname
ORDER BY TotalHours DESC;

SELECT 
    CONCAT(Fname, ' ', Lname) AS EmployeeName,
    Ssn
FROM employee
WHERE Super_ssn IS NULL;



