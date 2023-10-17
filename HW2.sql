-- @author Tyon Davis 
-- 
-- 3. Find the total number of shooting death by female and male of each data set
-- 
-- data-police-shootings-master.zip 
SELECT  count(case when WP.gender = 'M' then 1 end )  as WPMaleCount,
					count(case when WP.gender = 'F' then 1 end )  as WPFemaleCount
from WP ;

-- output
-- Male 2547	Female 114


-- 
-- thecounted-data.zip 
SELECT  	count(case when TG2015.gender = 'Male' then 1 end )  as TG15MaleCount,
					count(case when TG2015.gender = 'Female' then 1 end )  as TG15FemaleCount		
from TG2015;
-- output
-- Male 1093	Female 52

-- 
-- thecounted-data.zip 
SELECT  count(case when TG2016.gender = 'Male' then 1 end )  as TG16MaleCount,
					count(case when TG2016.gender = 'Female' then 1 end )  as TG16FemaleCount			
from TG2016;
-- output
-- Male 1031	Female 62






-- 4. Which State has the the most total number of death in 2015 and 2016 separately? (any different of each data set?)
-- 
-- data-police-shootings-master.zip  2015
SELECT state, count(*) as wpKillingsCount_2015
from WP
where strftime('%Y',date) = '2015'
GROUP by state
ORDER by wpKillingsCount_2015 DESC
LIMIT 1;

-- output
-- CA	190
-- 




-- data-police-shootings-master.zip  2016

SELECT state, count(*) as wpKillingsCount_2016
from WP
where strftime('%Y',date) = '2016'
GROUP by state
ORDER by wpKillingsCount_2016 DESC
LIMIT 1;

-- output
-- CA	138


-- There is a differnce of these dataset


-- thecounted-data.zip  2015
SELECT state, count(*) as TG15KillingsCount
from TG2015
GROUP by state
ORDER by TG15killingsCount DESC
LIMIT 1;

-- output
-- CA	211



-- 
-- thecounted-data.zip  2016
SELECT state, count(*) as TG16KillingsCount
from TG2016
GROUP by state
ORDER by TG16killingsCount DESC
LIMIT 1;

-- output
-- 
-- CA	161


-- There is a differnce of these dataset in 2015 and 2016 for data-police-shootings-master.zip shows less # then thecounted-data.zip.


-- 5. List the top ten States that has the most shooting death in 2015 and 2016, compare your results (any different of each data set?)

-- 
-- data-police-shootings-master.zip  2016 and 2015 grouped 

SELECT state, count(*) as wpKillingsCount
from WP
where strftime('%Y',date) = '2016' or strftime('%Y',date) = '2015'
GROUP by state
ORDER by wpKillingsCount DESC
LIMIT 10;

-- output
-- CA	328
-- TX	182
-- FL	121
-- AZ	92
-- CO	60
-- OK	58
-- NC	56
-- OH	55
-- GA	55
-- IL	47

-- 
-- thecounted-data.zip  2015 and 2016

SELECT state, count(*) as TGKillingsCount
from TGcomb
GROUP by state
ORDER by TGkillingsCount DESC
LIMIT 10;

-- output 
-- CA	372
-- TX	205
-- FL	144
-- AZ	94
-- OK	69
-- GA	69
-- OH	64
-- CO	64
-- NC	62
-- NY	52

--The resualts are different thecounted-data.zip is showing larger numbers. The order for some states are showing different for the statss starting at the 5th state.