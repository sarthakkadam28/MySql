SELECT 
    u.id AS user_id,
    u.firstname,
    u.lastname,
    u.email,
    r.id AS role_id,
    r.name AS role_name,
    r.lob AS role_lob
FROM users u
JOIN userroles ur ON u.id = ur.userid
JOIN roles r ON ur.roleid = r.id;
