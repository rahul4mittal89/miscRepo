-- List of Active URL's
SELECT  pm.PageID, pm.VirtualURL, pm.PageTitle, cm.IsActive,pm.CategoryID,cm.CategoryName 
FROM askiiti_askiitians.CMS_PageMaster pm INNER JOIN askiiti_askiitians.CMS_CategoryMaster cm ON pm.CategoryID = cm.CategoryID
WHERE cm.IsActive=1
-- List of InActive URL's
SELECT  pm.PageID, pm.VirtualURL, pm.PageTitle, cm.IsActive,pm.CategoryID,cm.CategoryName 
FROM askiiti_askiitians.CMS_PageMaster pm INNER JOIN askiiti_askiitians.CMS_CategoryMaster cm ON pm.CategoryID = cm.CategoryID
WHERE cm.IsActive=0

--SELECT pm.PageID, pm.VirtualURL, pm.PageTitle, pm.PageContent,pm.CategoryID 
-- FROM askiiti_askiitians.CMS_PageMaster pm
-- WHERE 

--SELECT * FROM askiiti_askiitians.CMS_CategoryMaster cm


--SELECT DATALENGTH(pm.PageContent)/2 FROM askiiti_askiitians.CMS_PageMaster pm WHERE PageID='914BB023-AC2C-4207-B52F-88EE8B88D3CF'
