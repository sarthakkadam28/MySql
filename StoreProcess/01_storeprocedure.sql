DELIMITER //
create procedure GetTestEmployeeDetailsByCandidate(IN candidate INT)
BEGIN
    SELECT 
        ts.id,
        ts.candidateid,
        t.name AS testname,
        t.passinglevel,
        t.duration,
        ts.scheduledstart,
        ts.scheduledend,
        ts.status
    FROM 
        testschedules ts
    JOIN 
        tests t ON ts.testid = t.id
    WHERE 
        ts.candidateid = candidate;
END;

DELIMITER //

CALL GetTestEmployeeDetailsByCandidate(2);