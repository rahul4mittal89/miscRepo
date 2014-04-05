--- Declare a Temp Table
DECLARE @temp TABLE
    (
      ID INT ,
      ask NVARCHAR(MAX) ,
      askquestion NVARCHAR(MAX) ,
      RN INT
    ) ;

--- Get RowNumber From CTE
WITH    X AS ( SELECT TOP 1000  id ,
                        CAST(ask AS NVARCHAR(MAX)) AS ask ,
                        CAST(askquestion AS NVARCHAR(MAX)) AS askquestion ,
                        RN = ROW_NUMBER() OVER ( PARTITION BY CAST(askquestion AS NVARCHAR(MAX)),
                                                 CAST(ask AS NVARCHAR(MAX)) ORDER BY id )
               FROM     askiiti_askiitians.tbl_forums_subcat
             )
--- Insert Data in to Temp Table   
   INSERT   INTO @temp
            ( ID, ask, askquestion, RN )
            SELECT  *
            FROM    X
            
         
--- Select the Orignal (Unique Data)             
SELECT  * ,
		-- Get All Duplicate ID's
        IDs = ( SELECT  SUBSTRING(( SELECT  ',' + CAST(s.id AS NVARCHAR)
                                    FROM    ( SELECT    id
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
WHERE   X.RN = 1 AND ( SELECT  SUBSTRING(( SELECT  ',' + CAST(s.id AS NVARCHAR)
                                    FROM    ( SELECT    id
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
