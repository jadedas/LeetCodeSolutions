WITH CTE AS (
    SELECT  *,id-ROW_NUMBER() OVER(ORDER BY visit_date) GroupID
    FROM Stadium
    WHERE people >= 100
)
SELECT A.id,A.visit_date,A.people FROM
CTE A
JOIN
(
SELECT GroupID,COUNT(*) As CountRows FROM CTE
GROUP BY GroupID
HAVING COUNT(*) >=3
) B
ON A.GroupID = B.GroupID
ORDER BY id
