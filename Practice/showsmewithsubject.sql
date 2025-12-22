SELECT 
    e.id AS employee_id,
    CONCAT(e.firstname, ' ', e.lastname) AS sme_name,
    s.title AS subject,
    sme.certificationdate
FROM subjectmatterexperts sme
JOIN employees e ON sme.employeeid = e.id
JOIN subjects s ON sme.subjectid = s.id
ORDER BY s.title ;