WITH CTE AS (
    --creating an ID that groups all consecutive rows with people >= 100
    SELECT  *,id-ROW_NUMBER() OVER(ORDER BY visit_date) GroupID
    FROM Stadium
    WHERE people >= 100
)
--displaying all required columns where the groups have at least 3 rows
SELECT A.id,A.visit_date,A.people 
FROM CTE A
JOIN
(    
SELECT GroupID,COUNT(*) As CountRows
FROM CTE
GROUP BY GroupID
HAVING COUNT(*) >=3
) B
ON A.GroupID = B.GroupID
ORDER BY id
