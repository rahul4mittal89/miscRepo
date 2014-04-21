DECLARE @intFlag INT,@newURL NVARCHAR(500)
	SET @intFlag = 1
     DECLARE  @Temp Table
		(
			UrlMapperID INT,
			OldUrl NVARCHAR(500),
			NewUrl NVARCHAR(500),
			Date DATETIME,
			IsActive BIT,
			RedirectType INT,
			IsGroupRedirection INT,
			SeqNo INT,
			RN int
		)
		DECLARE  @Temp2 Table
		(
			UrlMapperID INT,
			OldUrl NVARCHAR(500),
			NewUrl NVARCHAR(500),
			Date DATETIME,
			IsActive BIT,
			RedirectType INT,
			IsGroupRedirection INT,
			SeqNo INT,
			RN int
		)
     ;WITH cte as 
     (
		  SELECT *, row_number() over (order by t.oldurl) as seqnum
		  FROM  CMS_UrlMapper t
     )
     ,cte2 AS(
		SELECT t1.*,
		RN=ROW_NUMBER()OVER(ORDER BY t1.urlmapperid)
		FROM cte t1 
		INNER JOIN cte t2
		ON t1.newurl = t2.oldurl
		--WHERE t1.UrlMapperID IN (820,1013,2240,2348)
		)
		--SELECT * FROM cte2
		
	INSERT INTO @Temp
	        ( 
				UrlMapperID ,
				OldUrl ,
				NewUrl ,
				Date ,
				IsActive ,
				RedirectType ,
				IsGroupRedirection ,
				SeqNo ,
				RN)
	SELECT * FROM Cte2
	
	--SELECT * FROM @Temp        
   
	WHILE (@intFlag <=(SELECT COUNT(*) FROM @temp))
	BEGIN
		SELECT @newurl =NewUrl FROM @Temp WHERE RN=@intFlag
		--INSERT INTO @Temp2  SELECT * FROM @Temp WHERE NewUrl=OldUrl
		INSERT INTO @Temp2  SELECT * FROM @Temp WHERE OldUrl=@newURL
		
	PRINT @newurl
	SET @intFlag = @intFlag + 1
	END
	
            
     SELECT * FROM @temp2
		
		
	
		 --SELECT * FROM askiiti_askiitians.CMS_UrlMapper WHERE OldUrl= 'http://www.askiitians.com/aakash-iit-jee-2012-solutions.html'