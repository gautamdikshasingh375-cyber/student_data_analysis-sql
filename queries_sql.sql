use student_data_analysis;
show tables;

select s.class, round(avg(m.marks),1) as avg_marks
from students s join marks m on s.student_id=m.student_id
group by s.class;

select s.city,round(avg(m.marks),1) as avg_marks
from students s join marks m on s.student_id= m.student_id
group by s.city
order by avg_marks desc;

SELECT s.gender, ROUND(AVG(m.marks),1) AS avg_marks
FROM students s JOIN marks m ON s.student_id = m.student_id
GROUP BY s.gender;

-- 4. Grade classification
SELECT s.name, ROUND(AVG(m.marks),1) AS avg_marks,
  CASE
    WHEN AVG(m.marks) >= 90 THEN 'A+'
    WHEN AVG(m.marks) >= 80 THEN 'A'
    WHEN AVG(m.marks) >= 70 THEN 'B'
    WHEN AVG(m.marks) >= 60 THEN 'C'
    ELSE 'D'
  END AS grade
FROM students s JOIN marks m ON s.student_id = m.student_id
GROUP BY s.name;

-- 5. Har subject ka topper
SELECT subject, name, marks FROM (
  SELECT m.subject, s.name, m.marks,
         RANK() OVER (PARTITION BY m.subject ORDER BY m.marks DESC) AS rnk
  FROM marks m JOIN students s ON s.student_id = m.student_id
) t
WHERE rnk = 1;

-- 6. Overall rank
SELECT s.name, SUM(m.marks) AS total,
       RANK() OVER (ORDER BY SUM(m.marks) DESC) AS student_rank
FROM students s JOIN marks m ON s.student_id = m.student_id
GROUP BY s.name;

-- 7. Jo students average se upar hain
SELECT s.name, ROUND(AVG(m.marks),1) AS avg_marks
FROM students s JOIN marks m ON s.student_id = m.student_id
GROUP BY s.name
HAVING AVG(m.marks) > (SELECT AVG(marks) FROM marks);

-- 8. Weak subject: 65 se kam marks
SELECT s.name, m.subject, m.marks
FROM students s JOIN marks m ON s.student_id = m.student_id
WHERE m.marks < 65;
