-- Lesson-6: Practice
--1. 

SELECT DISTINCT 
    CASE WHEN col1 < col2 THEN col1 ELSE col2 END AS col1,
    CASE WHEN col1 < col2 THEN col2 ELSE col1 END AS col2
FROM InputTbl;

SELECT MIN(col1) AS col1, MAX(col2) AS col2
FROM InputTbl
GROUP BY 
    CASE 
        WHEN col1 < col2 THEN col1 + '-' + col2 
        ELSE col2 + '-' + col1 
    END;

--2. 
SELECT *
FROM TestMultipleZero
WHERE NOT (A = 0 AND B = 0 AND C = 0 AND D = 0);

SELECT *
FROM TestMultipleZero
WHERE A + B + C + D <> 0;

--3. 
SELECT *
FROM section1
WHERE id % 2 = 1;

--4. 
SELECT TOP 1 *
FROM section1
ORDER BY id ASC;

--5. 
SELECT TOP 1 *
FROM section1
ORDER BY id DESC;

--6. 
SELECT *
FROM section1
WHERE name LIKE 'b%';

--7.
SELECT *
FROM ProductCodes
WHERE Code LIKE '%\_%' ESCAPE '\';
