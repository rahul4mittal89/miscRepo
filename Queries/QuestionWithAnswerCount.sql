--For length of question(Without HTML)< 10.and answer=0 

SELECT  id AS QueID,ask AS QueTitle,dbo.udf_StripHTML(askquestion) AS QueDesc,(SELECT COUNT(*)
FROM askiiti_askiitians.tbl_forums_expertviews Y WHERE Y.subcatid=X.id) AS AnsCount
FROM askiiti_askiitians.tbl_forums_subcat X
WHERE (DATALENGTH(dbo.udf_StripHTML(askquestion))<20) AND x.isactive=1

--For length of question(With HTML)< 10.and answer=0 

SELECT  id AS QueID,ask AS QueTitle,askquestion AS QueDesc,(SELECT COUNT(*)
FROM askiiti_askiitians.tbl_forums_expertviews Y WHERE Y.subcatid=X.id) AS AnsCount
FROM askiiti_askiitians.tbl_forums_subcat X
WHERE (DATALENGTH(askquestion)<20) AND x.isactive=1
