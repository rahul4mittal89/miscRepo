
-- Answer With HTML Where Length<10
SELECT    subcatid ,SUM((DATALENGTH(expertview)/2))  AS SumofAns,COUNT(id) AS AnsCount
FROM askiiti_askiitians.tbl_forums_expertviews WHERE isactive=1
GROUP BY subcatid
ORDER BY subcatid
 
 
 -- Answer Without HTML Where Length<10
SELECT    subcatid ,SUM((DATALENGTH(dbo.udf_StripHTML(expertview))/2))  AS SumofAns,COUNT(id) AS AnsCount
FROM askiiti_askiitians.tbl_forums_expertviews WHERE isactive=1
GROUP BY subcatid
ORDER BY subcatid
 