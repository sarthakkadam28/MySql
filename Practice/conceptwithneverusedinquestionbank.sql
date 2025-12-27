SELECT c.id, c.title
FROM concepts c
LEFT JOIN questionbank qb
       ON qb.conceptid = c.id
WHERE qb.id IS NULL;
