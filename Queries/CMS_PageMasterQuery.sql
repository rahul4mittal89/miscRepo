SELECT  pm.PageID, pm.VirtualURL, pm.PageTitle, pm.PageContent, cm.IsActive, mtm.MetaTagName, pmt.MetaTagValue
FROM askiiti_askiitians.CMS_PageMaster pm INNER JOIN askiiti_askiitians.CMS_CategoryMaster cm ON pm.CategoryID = cm.CategoryID
INNER JOIN CMS_PageMetaTags pmt ON pm.PageID = pmt.PageID
INNER JOIN askiiti_askiitians.CMS_MetaTagMaster mtm ON mtm.MetaTagID = pmt.MetaTagID
WHERE cm.IsActive=1
ORDER BY pm.PageID



