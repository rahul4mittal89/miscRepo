-- Page Title Length ---
SELECT  pm.PageID, pm.VirtualURL, pm.PageTitle, cm.IsActive,LEN(pm.PageTitle) AS TitleTextLength
FROM askiiti_askiitians.CMS_PageMaster pm INNER JOIN askiiti_askiitians.CMS_CategoryMaster cm ON pm.CategoryID = cm.CategoryID
ORDER BY PageID