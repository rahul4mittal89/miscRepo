

SELECT pm.PageID,cm.CategoryID, cm.CategoryName, cm.IsActive,  pm.VirtualURL, mtm.MetaTagName, pmt.MetaTagValue
FROM askiiti_askiitians.CMS_CategoryMaster cm LEFT JOIN askiiti_askiitians.CMS_PageMaster pm ON cm.CategoryID = pm.CategoryID
LEFT JOIN askiiti_askiitians.CMS_PageMetaTags pmt ON pm.PageID = pmt.PageID
LEFT JOIN askiiti_askiitians.CMS_MetaTagMaster mtm ON pmt.MetaTagID = mtm.MetaTagID
 


