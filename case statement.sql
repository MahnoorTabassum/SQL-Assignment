CREATE DATABASE marksheet;
USE marksheet;

CREATE TABLE grade (
    studentid INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    studentName NVARCHAR(50),
     eng INT,
     math INT,
     phy INT,
     Isl INT,
	 comp INT
);

select*from grade

INSERT INTO grade (studentName, eng, math, phy, Isl, comp)
VALUES ('Amna', 70, 85, 89, 73, 83);

SELECT 
    studentid, studentName, eng, math, phy, Isl, comp, 500 AS TotalMarks,
	 (eng + math + phy + Isl +comp) AS ObtainedMarks,
   
    CASE 
        WHEN (eng + math + phy + Isl + comp ) >= 450 THEN 'A+'
        WHEN (eng + math + phy + Isl + comp ) >= 400 THEN 'A'
        WHEN (eng + math + phy + Isl + comp ) >= 300 THEN 'B'
     
        ELSE 'C'
    END

FROM grade;