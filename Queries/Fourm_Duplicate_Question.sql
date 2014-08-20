SELECT 1
--- Declare a Temp Table
DECLARE @temp TABLE
    (
      ID INT ,
      Cat NVARCHAR(max),
      CatID NVARCHAR(max),
       PostDate DATETIME,
      ask NVARCHAR(MAX) ,
      askquestion NVARCHAR(MAX) ,
     
      RN INT
    ) ;

--- Get RowNumber From CTE
WITH    X AS ( SELECT id ,cat,catid,postdate,
                        CAST(ask AS NVARCHAR(MAX)) AS ask ,
                        CAST(askquestion AS NVARCHAR(MAX)) AS askquestion ,
                        RN = ROW_NUMBER() OVER ( PARTITION BY CAST(askquestion AS NVARCHAR(MAX)),
                                                 CAST(ask AS NVARCHAR(MAX)) ORDER BY id )
               FROM     askiiti_askiitians.tbl_forums_subcat
             )
--- Insert Data in to Temp Table   
   INSERT   INTO @temp
            ( id ,cat,catid,PostDate, ask, askquestion, RN )
            SELECT  *
            FROM    X
            
         
--- Select the Orignal (Unique Data)             
SELECT  * ,
		-- Get All Duplicate ID's
        IDs = ( SELECT  SUBSTRING((SELECT  'Æ' + CAST(s.id AS NVARCHAR) + ' Þ '+CAST(s.PostDate AS NVARCHAR) + ' Þ ' + 'http://www.askiitians.com/forums/' + REPLACE(CASE WHEN s.id <= 65504 THEN CAST(s.cat as varchar(50)) + '/' + CAST(s.catid as varchar(50)) + '/' + CAST(s.id as varchar(50))+ '/' + CAST(s.ask as varchar(50))ELSE CAST(s.cat as varchar(50)) + '/' + CAST(s.ask as varchar(50)) + '_' + CAST(s.id AS VARCHAR(20)) END, ' ', '-') + '.htm'
                                      FROM    ( SELECT   TOP 100 id,cat,catid,PostDate,ask
                                              FROM      @temp Y
                                              WHERE     CAST(X.ask AS NVARCHAR(MAX)) = CAST(Y.ask AS NVARCHAR(MAX))
                                                        AND CAST(X.askquestion AS NVARCHAR(MAX)) = CAST(Y.askquestion AS NVARCHAR(MAX))
                                                        AND RN > 1
                                            ) s
                                    ORDER BY s.id
                                  FOR
                                    XML PATH('')
                                  ), 2, 200000) AS CSV
              )
FROM    @temp X
WHERE   X.RN = 1 AND ( SELECT  SUBSTRING(( SELECT  'Æ' + CAST(s.id AS NVARCHAR) + ' Þ '+ CAST(s.PostDate AS NVARCHAR) + ' Þ ' + 'http://www.askiitians.com/forums/' + REPLACE(CASE WHEN s.id <= 65504 THEN CAST(s.cat as varchar(50)) + '/' + CAST(s.catid as varchar(50)) + '/' + CAST(s.id as varchar(50))+ '/' + CAST(s.ask as varchar(50))ELSE CAST(s.cat as varchar(50)) + '/' + CAST(s.ask as varchar(50)) + '_' + CAST(s.id AS VARCHAR(20)) END, ' ', '-') + '.htm'
                                  FROM    ( SELECT   TOP 100 id,cat,catid,PostDate,ask
                                              FROM      @temp Y
                                              WHERE     CAST(X.ask AS NVARCHAR(MAX)) = CAST(Y.ask AS NVARCHAR(MAX))
                                                        AND CAST(X.askquestion AS NVARCHAR(MAX)) = CAST(Y.askquestion AS NVARCHAR(MAX))
                                                        AND RN > 1
                                            ) s
                                    ORDER BY s.id
                                  FOR
                                    XML PATH('')
                                  ), 2, 200000) AS CSV
              ) IS NOT NULL
