
-- ---------------------------
-- SELECT all about comanies
-- ---------------------------

SELECT * FROM `construction_management`.`companies`;

-- ----------------------------------------
-- SELECT all project of this company 
-- ----------------------------------------
SELECT `projects`.`projectName`, `projects`.`startDate`, `projects`.`endDate`  
	FROM `construction_management`.`projects` 
    WHERE `projects`.`companies_companyId` = 1;

-- ----------------------------------------------
-- SELECT complete project of this company 
-- ----------------------------------------------
SELECT `projects`.`projectName`, `projects`.`startDate`, `projects`.`endDate`
	FROM `construction_management`.`projects` 
	WHERE `projects`.`endDate` IS NOT NULL AND `projects`.`companies_companyId` = 1;
    
-- ----------------------------------------------
-- SELECT running project of this company 
-- ----------------------------------------------
SELECT `projects`.`projectName`, `projects`.`startDate`
	FROM `construction_management`.`projects` 
	WHERE `projects`.`endDate` IS NULL AND `projects`.`companies_companyId` = 1;
    
-- --------------------------------------------------
-- SELECT  work day of every project of this company 
-- --------------------------------------------------
SELECT `projects`.`projectName`, DATEDIFF(end_date_handel(`projects`.`endDate`), `projects`.`startDate`) as 'work_day' 
	FROM `construction_management`.`projects` 
    WHERE `projects`.`companies_companyId` = 1;

-- -----------------------------------------------
-- SELECT all employees of this company 
-- -----------------------------------------------
SELECT * FROM `construction_management`.`employees`
WHERE `employees`.`companies_companyId` = 1;


-- ------------------------------------------------
-- SELECT task of running project
-- ------------------------------------------------
SELECT * FROM `construction_management`.`tasks`
WHERE `tasks`.`projects_projectId` = 9;


-- ------------------------------------------------
-- SELECT all parts_materials
-- ------------------------------------------------
SELECT `parts_materials`.`name`, `parts_materials`.`unit`, `projects`.`projectName`, `suppliers`.`suppliersName`
	FROM `construction_management`.`parts_materials`
	INNER JOIN `construction_management`.`suppliers` 
    ON `parts_materials`.`suppliers_suppliersId` = `suppliers`.`suppliersId`
    INNER JOIN `construction_management`.`projects` 
    ON `projects`.`projectId` = `parts_materials`.`projects_projectId`
    WHERE `parts_materials`.`projects_projectId` = 9;





