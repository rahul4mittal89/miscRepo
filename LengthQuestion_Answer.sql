
-- Questions Where Length<10
SELECT TOP 100 * FROM askiiti_askiitians.tbl_forums_subcat WHERE (DATALENGTH(dbo.udf_StripHTML(askquestion))<20)

-- Answer Where Length<10
SELECT TOP 100 * FROM askiiti_askiitians.tbl_forums_expertviews WHERE (DATALENGTH(dbo.udf_StripHTML(expertview))<20)

-- Questions+HTML Where Length<50
SELECT TOP 100 * FROM askiiti_askiitians.tbl_forums_subcat WHERE (DATALENGTH(askquestion)<100)





