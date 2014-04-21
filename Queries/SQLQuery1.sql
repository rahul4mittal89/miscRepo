SELECT TOP 100
        *
FROM    askiiti_askiitians.CMS_UrlMapper
WHERE   UrlMapperID IN ( 820, 1013, 2240, 2348 )

WITH    CTE
          AS ( SELECT TOP 100
                        t.*,
                        RN = ROW_NUMBER() OVER ( PARTITION BY OldUrl, newurl ORDER BY OldUrl, newurl )
               FROM     askiiti_askiitians.CMS_UrlMapper t
               WHERE    UrlMapperID IN ( 820, 1013, 2240, 2348 )
             )
    SELECT  *
    FROM    CTE

SELECT TOP 100
        t1.*,
        COUNT(0) AS rows
FROM    askiiti_askiitians.CMS_UrlMapper t1
        JOIN askiiti_askiitians.CMS_UrlMapper t2 ON t2.NewUrl = t1.OldUrl
GROUP BY t1.OldUrl

SELECT TOP 100
        OldUrl,
        NewUrl,
        COUNT(0) AS rows
FROM    askiiti_askiitians.CMS_UrlMapper t1
WHERE   NOT EXISTS ( SELECT t2.OldUrl,
                            NewUrl
                     FROM   askiiti_askiitians.CMS_UrlMapper t2
                     WHERE  t1.OldUrl = t2.NewUrl )
GROUP BY OldUrl,
        t1.NewUrl
ORDER BY COUNT(0) DESC
                  
SELECT  *
FROM    askiiti_askiitians.CMS_UrlMapper
WHERE   OldUrl = 'http://www.askiitians.com/maths/maths-123/maths-2.aspx'
                  
                  
                  
WITH    cte
          AS ( SELECT   *,
                        row_number() OVER ( ORDER BY t.oldurl ) AS seqnum
               FROM     CMS_UrlMapper t
             )
    SELECT  t1.*
    FROM    cte t1
            INNER JOIN cte t2 ON t1.newurl = t2.oldurl
		--WHERE t1.UrlMapperID IN (820,1013,2240,2348)
    ORDER BY t1.UrlMapperID
		
		
		
		
		
SELECT  *
FROM    askiiti_askiitians.CMS_UrlMapper
WHERE   OldUrl = 'http://www.askiitians.com/iit-jee-algebra/set-relations-functions/periodic-functions-page2.aspx'
		 