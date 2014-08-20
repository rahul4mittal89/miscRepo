SELECT  pm.PageID, pm.VirtualURL, pm.PageTitle, cm.IsActive,DATALENGTH(pm.PageContent)/2 AS PageTextLength
FROM askiiti_askiitians.CMS_PageMaster pm INNER JOIN askiiti_askiitians.CMS_CategoryMaster cm ON pm.CategoryID = cm.CategoryID
 WHERE (DATALENGTH(pm.PageContent)/2)<200
 ORDER BY pm.PageID
 
 SELECT TOP 100 *
 FROM askiiti_askiitians.tbl_forums_expertviews
 
 
 SELECT  id,postdate,(SELECT COUNT(id) FROM askiiti_askiitians.tbl_forums_expertviews Y WHERE X.id=Y.subcatid) AS AnsCount
 FROM askiiti_askiitians.tbl_forums_subcat X
 WHERE (DATEADD(mm,-6,GETDATE()))> postdate
ORDER BY id,X.postdate


