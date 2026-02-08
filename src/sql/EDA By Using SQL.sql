USE apeamcet2022;
/* Data Cleaning / DML Statements
Note : SET SQL_SAFE_UPDATES = 0  # If Workbench is in Safe Mode Disable by using this command 

# 1
# COED mistakenly stored as GGIRLS Instead of GIRLS 
UPDATE apeamcet2022.ranks_cutoff_transformed 
SET COED = 'GIRLS' 
WHERE COED = 'GGIRLS'

# 2
# All District Names are in ATP,KNL,KDP, etc in short forms so just write on simple update for all Districts to their full names
# For Full Names pls refer Details sheet in Datasheet
# sample update
UPDATE apeamcet2022.ranks_cutoff_transformed 
SET District = 'ANANTAPURAMU' 
WHERE District = 'ATP'


# 3
# You Can update Branch Names also 
# Sample update
UPDATE apeamcet2022.ranks_cutoff_transformed 
SET Branch = 'Agricultural Engineering' 
WHERE Branch = 'AGR'

*/

/* Desciptive Stats 
# How Many Colleges
SELECT count(distinct College_Code) as College_Count FROM apeamcet2022.ranks_cutoff_transformed;

# Total Branches 
SELECT count(distinct Branch) As Branch_Count FROM  apeamcet2022.ranks_cutoff_transformed
SELECT distinct Branch FROM  apeamcet2022.ranks_cutoff_transformed

# How Many Colleges Types College wise
SELECT distinct College_Type,count(distinct College_Code) as College_Count FROM apeamcet2022.ranks_cutoff_transformed
GROUP BY College_Type ORDER BY College_Count desc;


# How Many Colleges Region wise 
SELECT distinct Region,count(distinct College_Code) as College_Count FROM apeamcet2022.ranks_cutoff_transformed
GROUP BY Region ORDER BY College_Count desc;

# How Many College_Types Region Wise
SELECT distinct Region,College_Type,count(distinct College_Code) as College_Count FROM apeamcet2022.ranks_cutoff_transformed
GROUP BY Region,College_Type ORDER BY College_Count desc;

# How Many Colleges District wise 
SELECT distinct District,count(distinct College_Code) as College_Count FROM apeamcet2022.ranks_cutoff_transformed
GROUP BY District ORDER BY College_Count desc ; #LIMIT 5

# How Many Affliate Universities College wise
SELECT distinct Affliate_Univ,count(distinct College_Code) as College_Count FROM apeamcet2022.ranks_cutoff_transformed
GROUP BY Affliate_Univ ORDER BY College_Count desc ; #LIMIT 5;

# Places which having most colleges
SELECT distinct Place,count(distinct College_Code) as College_Count FROM apeamcet2022.ranks_cutoff_transformed
GROUP BY Place ORDER BY College_Count desc  LIMIT 5;

# COED Colleges Count
SELECT distinct COED ,count(distinct College_Code) as College_Count FROM apeamcet2022.ranks_cutoff_transformed
GROUP BY COED ORDER BY College_Count desc 
*/

/* Comparsions 
# COED Colleges Ratio # Need to do Ratio Count Completed 
SELECT distinct COED ,count(distinct College_Code) as College_Count FROM apeamcet2022.ranks_cutoff_transformed
GROUP BY COED ORDER BY College_Count desc ;

# Colleges ESTD 
SELECT  ESTD, College_Name,College_Type, round(AVG(Fee),2) as College_Fee FROM apeamcet2022.ranks_cutoff_transformed
GROUP BY ESTD,College_Name,College_Type ORDER BY College_Type,College_Fee desc

 */

/* Ranking Analysis Branch wise
WITH Avg_Rank_By_Branches AS
(SELECT 
	distinct Branch,round(AVG(`Rank`)) as Avg_Rank,
    row_number() over(order by round(AVG(`Rank`)) ) as Branch_Rank
FROM apeamcet2022.ranks_cutoff_transformed
GROUP BY Branch
ORDER BY Branch ) 
SELECT * FROM Avg_Rank_By_Branches #WHERE Branch_Rank < 11


# Top_Ranks_By_Branch
WITH Top_Ranks_By_Branch AS
(SELECT 
	distinct Branch,round(MIN(`Rank`)) as Top_Rank,
    row_number() over(order by round(MIN(`Rank`)) ) as Branch_Rank
FROM apeamcet2022.ranks_cutoff_transformed
GROUP BY Branch
ORDER BY Branch ) 
SELECT * FROM Top_Ranks_By_Branch WHERE Branch_Rank < 11

# Last_Ranks_By_Branch
WITH Last_Ranks_By_Branch AS
(SELECT 
	distinct Branch,round(MAX(`Rank`)) as Last_Rank,
    row_number() over(order by round(MAX(`Rank`)) ) as Branch_Rank
FROM apeamcet2022.ranks_cutoff_transformed
GROUP BY Branch
ORDER BY Branch,Last_Rank desc) 
SELECT * FROM Last_Ranks_By_Branch  WHERE Branch_Rank < 11
;
*/

/* Ranking Analysis Branch_Gender wise
# Avg_Rank_By_Gender_Branch
WITH Avg_Rank_Branch_Gender_wise1 AS
	(SELECT 
		distinct Branch,round(AVG(`Rank`)) as Boys_Avg_Rank,row_number() over(order by round(AVG(`Rank`)) ) as Branch_rank
	FROM  apeamcet2022.ranks_cutoff_transformed
	WHERE Gender = 'BOYS'
	GROUP BY Branch
    ORDER BY Boys_Avg_Rank
	),
Avg_Rank_Branch_Gender_wise2 AS
	(SELECT 
		distinct Branch,round(AVG(`Rank`)) as Girls_Avg_Rank,row_number() over(order by round(AVG(`Rank`)) ) as Branch_rank
	FROM  apeamcet2022.ranks_cutoff_transformed
	WHERE Gender = 'GIRLS'
	GROUP BY Branch 
    ORDER BY Girls_Avg_Rank) 
SELECT * FROM Avg_Rank_Branch_Gender_wise1 JOIN Avg_Rank_Branch_Gender_wise2 USING (Branch);


# Top_Rank_By_Gender_Branch
WITH Top_Rank_Branch_Gender_wise1 AS
	(SELECT 
		distinct Branch,round(MIN(`Rank`)) as Boys_Top_Rank,row_number() over(order by round(MIN(`Rank`)) ) as Branch_rank
	FROM  apeamcet2022.ranks_cutoff_transformed
	WHERE Gender = 'BOYS'
	GROUP BY Branch
    ORDER BY Boys_Top_Rank
	),
Top_Rank_Branch_Gender_wise2 AS
	(SELECT 
		distinct Branch,round(MIN(`Rank`)) as Girls_Top_Rank,row_number() over(order by round(MIN(`Rank`)) ) as Branch_rank
	FROM  apeamcet2022.ranks_cutoff_transformed
	WHERE Gender = 'GIRLS'
	GROUP BY Branch
    ORDER BY Girls_Top_Rank) 
SELECT * FROM Top_Rank_Branch_Gender_wise1 JOIN Top_Rank_Branch_Gender_wise2 USING (Branch);

# Last_Rank_By_Gender_Branch
WITH Last_Rank_By_Gender_Branch_wise1 AS
	(SELECT 
		distinct Branch,round(MAX(`Rank`)) as Boys_Last_Rank,row_number() over(order by round(MAX(`Rank`)) ) as Branch_rank
	FROM  apeamcet2022.ranks_cutoff_transformed
	WHERE Gender = 'BOYS'
	GROUP BY Branch
    ORDER BY Boys_Last_Rank desc),
Last_Rank_By_Gender_Branch_wise2 AS
	(SELECT 
		distinct Branch,round(MAX(`Rank`)) as Girls_Last_Rank,row_number() over(order by round(MAX(`Rank`)) ) as Branch_rank
	FROM  apeamcet2022.ranks_cutoff_transformed
	WHERE Gender = 'GIRLS'
	GROUP BY Branch
    ORDER BY Girls_Last_Rank desc ) 
SELECT * FROM Last_Rank_By_Gender_Branch_wise1 JOIN Last_Rank_By_Gender_Branch_wise2 USING (Branch)
*/

/* Category Branch Wise

WITH Avg_Rank_Category_Branch_Wise AS 
(SELECT 
	distinct Branch,Category ,round(AVG(`Rank`)) as Avg_Rank
FROM apeamcet2022.ranks_cutoff_transformed 
GROUP BY Branch,Category
ORDER BY Branch,Avg_Rank)
SELECT * FROM Avg_Rank_Category_Branch_Wise;

# For Checking
WITH Avg_Rank_Category_Branch_Wise_Check AS 
(SELECT 
	distinct Branch,Category ,round(AVG(`Rank`)) as Avg_Rank,College_Name,College_Code
FROM apeamcet2022.ranks_cutoff_transformed 
GROUP BY Branch,Category,College_Name,College_Code
ORDER BY Branch,Avg_Rank)
# Parameters
SELECT * FROM Avg_Rank_Category_Branch_Wise_Check  WHERE College_Code = 'RGIT' AND Category = 'SC';


WITH Top_Rank_Category_Branch_Wise AS 
(SELECT 
	distinct Branch,Category ,round(MIN(`Rank`)) as Top_Rank
FROM apeamcet2022.ranks_cutoff_transformed 
GROUP BY Branch,Category
ORDER BY Branch,Top_Rank)
SELECT * FROM Top_Rank_Category_Branch_Wise;

# For Checking
WITH Top_Rank_Category_Branch_Wise_Check AS 
(SELECT 
	distinct Branch,Category ,round(MIN(`Rank`)) as Top_Rank,College_Name,College_Code
FROM apeamcet2022.ranks_cutoff_transformed 
GROUP BY Branch,Category,College_Name,College_Code
ORDER BY Branch,Top_Rank)
# Parameters
SELECT * FROM Top_Rank_Category_Branch_Wise_Check WHERE College_Code = 'RGIT' AND Category = 'SC';


WITH Last_Rank_Category_Branch_Wise AS 
(SELECT 
	distinct Branch,Category ,round(MAX(`Rank`)) as Last_Rank
FROM apeamcet2022.ranks_cutoff_transformed 
GROUP BY Branch,Category
ORDER BY Branch,Last_Rank desc)
SELECT * FROM Last_Rank_Category_Branch_Wise;

# For Checking
WITH Last_Rank_Category_Branch_Wise_Check AS 
(SELECT 
	distinct Branch,Category ,round(MAX(`Rank`)) as Last_Rank,College_Name,College_Code
FROM apeamcet2022.ranks_cutoff_transformed 
GROUP BY Branch,Category,College_Name,College_Code
ORDER BY Branch,Last_Rank desc)
# Parameters
SELECT * FROM Last_Rank_Category_Branch_Wise_Check WHERE College_Code = 'RGIT' AND Category = 'SC';

*/

