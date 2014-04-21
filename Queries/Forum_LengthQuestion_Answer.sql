-- Questions Where Length<10
SELECT  Question.id QueID,dbo.udf_StripHTML(Question.askquestion) QueContent,Answer.id AnsID
FROM askiiti_askiitians.tbl_forums_subcat Question
INNER JOIN askiiti_askiitians.tbl_forums_expertviews Answer
ON Question.id =Answer.subcatid
WHERE (DATALENGTH(dbo.udf_StripHTML(askquestion))<20)
-- Questions Where Length<10
SELECT TOP 100 * FROM askiiti_askiitians.tbl_forums_subcat WHERE (DATALENGTH(dbo.udf_StripHTML(askquestion))<20)


-- Answer Where Length<10
SELECT  Question.id QueID,Question.askquestion QueContent,Answer.id AnsID,dbo.udf_StripHTML(expertview) AS Ans
FROM askiiti_askiitians.tbl_forums_subcat Question
INNER JOIN askiiti_askiitians.tbl_forums_expertviews Answer
ON Question.id =Answer.subcatid
WHERE (DATALENGTH(dbo.udf_StripHTML(expertview))<20)
-- Answer Where Length<10
SELECT TOP 100 * FROM askiiti_askiitians.tbl_forums_expertviews WHERE (DATALENGTH(dbo.udf_StripHTML(expertview))<20)


-- Questions+HTML Where Length<50
SELECT TOP 100 Question.id QueID,Question.askquestion QueContent,Answer.id AnsID
FROM askiiti_askiitians.tbl_forums_subcat Question
INNER JOIN askiiti_askiitians.tbl_forums_expertviews Answer
ON Question.id =Answer.subcatid
WHERE (DATALENGTH(askquestion)<100)
-- Questions+HTML Where Length<50
SELECT TOP 100 * FROM askiiti_askiitians.tbl_forums_subcat WHERE (DATALENGTH(askquestion)<100)


 