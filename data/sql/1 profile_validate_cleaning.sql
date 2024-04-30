---------------------------
-- Identify Schema of and its tables
	SELECT *
	FROM information_schema.tables
	WHERE table_schema = 'public'
---------------------------

-- Identify data type and null values

	SELECT column_name, data_type, is_nullable
	FROM information_schema.columns
	WHERE table_name = 'games'
	
	SELECT column_name, data_type, is_nullable
	FROM information_schema.columns
	WHERE table_name = 'log'
	
	SELECT column_name, data_type, is_nullable
	FROM information_schema.columns
	WHERE table_name = 'penalties'
	
	SELECT column_name, data_type, is_nullable
	FROM information_schema.columns
	WHERE table_name = 'players'
	
	SELECT column_name, data_type, is_nullable
	FROM information_schema.columns
	WHERE table_name = 'team'

------------------------------

-- games
	
	SELECT * FROM games
	SELECT Away_Team FROM games WHERE Away_Team IS NOT NULL -- 3082
	SELECT Away_Team FROM games WHERE Away_Team IS NULL -- 00
	SELECT Away_Team FROM games WHERE Away_Team ~ '[^a-zA-Z]'
	SELECT Away_Team FROM games WHERE Away_Team !~ '[^a-zA-Z]'
	SELECT Away_Team FROM games WHERE Away_Team NOT SIMILAR TO '%[^a-zA-Z]%'  -- does not match pattern 2442
	SELECT DISTINCT(Away_Team) FROM games -- 35 Distinct
	SELECT Away_Team, COUNT(*) AS occurrences FROM games GROUP BY Away_Team ORDER BY Away_Team, occurrences DESC
	SELECT Away_Team, COUNT(*) FROM games GROUP BY Away_Team HAVING COUNT(*) > 1
	
	----------
	
	SELECT Home_Team FROM games WHERE Home_Team IS NOT NULL -- 3582
	SELECT Home_Team FROM games WHERE Home_Team IS NULL -- 00
	SELECT Home_Team FROM games WHERE Home_Team ~ '[^a-zA-Z]'
	SELECT Home_Team FROM games WHERE Home_Team NOT SIMILAR TO '%[^a-zA-Z]%'  -- does not match pattern 2436
	SELECT DISTINCT(Home_Team) FROM games -- 35 Distinct
	SELECT Home_Team, COUNT(*) AS occurrences FROM games GROUP BY Home_Team ORDER BY home_team, occurrences DESC
	SELECT Home_Team, COUNT(*) FROM games GROUP BY Home_Team HAVING COUNT(*) > 1
	
	----------
	
	-- Date Datatype is CHAR VARYING format
		-- could not import as DATE
		-- re-occurring issue with other DATE columns in other tables
	SELECT Date FROM games WHERE Date IS NULL
	SELECT Date FROM games WHERE Date IS NOT NULL
	SELECT MIN(Date), MAX(Date) FROM games -- 2012-01-01 to 2017-12-31
	SELECT Date FROM games WHERE Date !~ '^\d{2}/\d{2}/\d{4}$'
	
	-- CANNOT CHANGE FROM CHARACTER VARYING TO DATE
	show datestyle
	
	--------------
	
	SELECT Ref_Crew FROM games WHERE Ref_Crew IS NOT NULL -- 3582
	SELECT Ref_Crew FROM games WHERE Ref_Crew IS NULL -- 00
	SELECT Ref_Crew FROM games WHERE Ref_Crew ~ '[^a-zA-Z]'
	SELECT Ref_Crew FROM games WHERE Ref_Crew NOT SIMILAR TO '%[^a-zA-Z]%'  -- does not match pattern 0
	SELECT DISTINCT(Ref_Crew) FROM games -- 35 Distinct
	SELECT Ref_Crew, COUNT(*) AS occurrences FROM games GROUP BY Ref_Crew ORDER BY Ref_Crew, occurrences DESC
	SELECT Ref_Crew, COUNT(*) FROM games GROUP BY Ref_Crew HAVING COUNT(*) > 1

	----------------
	
	SELECT Accepted_Count FROM games
	SELECT Accepted_Count FROM games WHERE Accepted_Count IS NULL
	SELECT Accepted_Count FROM games WHERE Accepted_Count < 0
	
	----------------
	
	SELECT Yards FROM games
	SELECT Yards FROM games WHERE Yards < 0
	
	-----------------
	
	SELECT Away_Count FROM games WHERE Away_Count IS NULL
	SELECT Away_Count FROM games WHERE Away_Count < 0
	
	-----------------
	
	SELECT Away_Yards FROM games WHERE Away_Yards IS NULL
	SELECT Away_Yards FROM games WHERE Away_Yards < 0
	
	SELECT Home_Count FROM games IS NULL
	SELECT Home_Count FROM games WHERE Home_Count < 0
	
	------------------
	
	SELECT Home_Yards FROM games WHERE Home_Yards IS NULL
	
	SELECT Total_Flags FROM games WHERE Total_Flags IS NULL
	
	SELECT Week FROM games WHERE Week IS NULL
	
	SELECT Year FROM games WHERE Year IS NULL
	-- coult not import as DATE datatype
	-- considering this column can be extraced from DATE column instead of using this for any queries needed
	-- re-occuring with other YEAR columns in other tables
	
-------------------------------

-- log
	-- SELECT * FROM log
	
	SELECT Penalty FROM log WHERE Penalty IS NULL
	SELECT Date FROM log WHERE Date IS NULL
	SELECT Against FROM log WHERE Against IS NULL
	SELECT Beneficiary FROM log WHERE Beneficiary IS NULL
	
	SELECT Player FROM log WHERE Player IS NULL -- 2 NULL values
	SELECT * FROM log
	SELECT Player, beneficiary, against, pos FROM log WHERE Player IS NULL -- 2 NULL values for player and pos
	SELECT Player FROM log WHERE player = 'Unnamed'
	SELECT DISTINCT(player), COUNT(*) FROM log WHERE player ='Unnamed' GROUP BY player -- 2988 Unnamed
	
	SELECT Pos FROM log WHERE Pos IS NULL -- Null -- 2 NULL values for player and pos
	
	SELECT Ref_Crew FROM log WHERE Ref_Crew IS NULL
	
	SELECT Quarter FROM log WHERE Quarter IS NULL
	
	SELECT Time FROM log WHERE Time IS NULL -- 1 Null value
	SELECT Time, COUNT(*) FROM log WHERE Time IS NULL GROUP BY Time
	SELECT Time, date, year, week FROM log WHERE Time IS NULL
	SELECT time FROM log WHERE time = '00:00:00'
	SELECT penalty, time, COUNT(*) FROM log WHERE time = '00:00:00' GROUP BY time, penalty -- 18x '00:00:00' values (likely occured at time 0)
	
	SELECT Down FROM log WHERE Down IS NULL
	
	SELECT Distance FROM log WHERE Distance IS NULL
	
	SELECT Declined FROM log WHERE Declined IS NULL
	
	SELECT Offsetting FROM log WHERE Offsetting IS NULL
	
	SELECT Yards FROM log WHERE Yards IS NULL
	
	SELECT Home FROM log WHERE Home IS NULL
	
	SELECT Phase FROM log WHERE Phase IS NULL -- NULL
	SELECT Phase, COUNT(*) FROM log WHERE Phase IS NULL GROUP BY Phase
	
	SELECT Week FROM log WHERE Week IS NULL
	
	SELECT Year FROM log WHERE Year IS NULL
	
-------------------------------

-- penalties
	-- Name, Count, Yards, Declined, Offsetting, Home_Count, Away_Count, Off_Count, Def_Count, ST_Count, Week, Year
	
	SELECT Name FROM penalties WHERE Name IS NULL
	
	SELECT Count FROM penalties WHERE count IS NULL
	SELECT Count FROM penalties WHERE count::TEXT !~ '^\d+$'
	SELECT Count FROM penalties WHERE count < 0
	
	SELECT Yards FROM penalties WHERE Yards IS NULL
	SELECT Yards FROM penalties WHERE Yards::TEXT !~ '^\d+$'
	SELECT Yards FROM penalties WHERE Yards < 0
	
	SELECT Declined FROM penalties WHERE Declined IS NULL
	SELECT Declined FROM penalties WHERE Declined::TEXT !~ '^\d+$'
	SELECT Declined FROM penalties WHERE Declined < 0
	
	SELECT Offsetting FROM penalties WHERE Offsetting IS NULL
	SELECT Offsetting FROM penalties WHERE Offsetting::TEXT !~ '^\d+$'
	SELECT Offsetting FROM penalties WHERE Offsetting < 0
	
	SELECT Home_Count FROM penalties WHERE Home_Count IS NULL
	SELECT Home_Count FROM penalties WHERE Home_Count::TEXT !~ '^\d+$'
	SELECT Home_Count FROM penalties WHERE Home_Count < 0
	
	SELECT Away_Count FROM penalties WHERE Away_Count IS NULL
	SELECT Away_Count FROM penalties WHERE Away_Count::TEXT !~ '^\d+$'
	SELECT Away_Count FROM penalties WHERE Away_Count < 0
	
	SELECT Off_Count FROM penalties WHERE Off_Count IS NULL
	SELECT Off_Count FROM penalties WHERE Off_Count::TEXT !~ '^\d+$'
	SELECT Off_Count FROM penalties WHERE Off_Count < 0
	
	SELECT Def_Count FROM penalties WHERE Def_Count IS NULL
	SELECT Def_Count FROM penalties WHERE Def_Count::TEXT !~ '^\d+$'
	SELECT Def_Count FROM penalties WHERE Def_Count < 0
	
	SELECT ST_Count FROM penalties WHERE ST_Count IS NULL
	SELECT ST_Count FROM penalties WHERE ST_Count::TEXT !~ '^\d+$'
	SELECT ST_Count FROM penalties WHERE ST_Count < 0
	
	SELECT Week FROM penalties WHERE Week IS NULL
	SELECT Week FROM penalties WHERE Week::TEXT !~ '^\d+$'
	SELECT Week FROM penalties WHERE Week < 0
	
	SELECT Year FROM penalties WHERE Year IS NULL
	SELECT Year, COUNT(*) FROM penalties GROUP BY Year
	
-------------------------------

-- players
	
	SELECT Name FROM players
	SELECT Name FROM players WHERE Name IS NULL
	SELECT Name, COUNT(*) FROM players GROUP BY Name ORDER BY Name
	SELECT Name FROM players WHERE Name = 'Unnamed'
	
	SELECT Team FROM players
	SELECT Team FROM players WHERE Team IS NULL
	SELECT Team, COUNT(*) FROM players GROUP BY Team ORDER BY Team
	
	SELECT Pos FROM players
	SELECT Pos FROM players WHERE Pos IS NULL
	SELECT Pos, COUNT(*) FROM players GROUP BY Pos
	
	SELECT Count FROM players
	SELECT Count FROM players WHERE Count IS NULL
	SELECT Count, COUNT(*) FROM players GROUP BY Count
	
	SELECT Yards FROM players
	SELECT Yards FROM players WHERE Yards IS NULL
	SELECT Yards, COUNT(*) FROM players GROUP BY Yards ORDER BY yards
	SELECT Yards FROM players WHERE Yards::TEXT !~ '^\d+$'
	
	SELECT Declined FROM players
	SELECT Declined FROM players WHERE Declined IS NULL
	SELECT Declined, COUNT(*) FROM players GROUP BY Declined ORDER BY Declined
	SELECT Declined FROM players WHERE Declined::TEXT !~ '^\d+$'
	
	SELECT Offsetting FROM players
	SELECT Offsetting FROM players WHERE Offsetting IS NULL
	SELECT Offsetting, COUNT(*) FROM players GROUP BY Offsetting ORDER BY Offsetting
	SELECT Offsetting FROM players WHERE Offsetting::TEXT !~ '^\d+$'
	
	SELECT Pre_snap FROM players
	SELECT Pre_snap FROM players WHERE Pre_snap IS NULL
	SELECT Pre_snap, COUNT(*) FROM players GROUP BY Pre_snap ORDER BY Pre_snap
	SELECT Pre_snap FROM players WHERE Pre_snap::TEXT !~ '^\d+$'
	
	SELECT Penalties FROM players
	SELECT Penalties FROM players WHERE Penalties IS NULL
	
	SELECT Week FROM players
	SELECT Week FROM players WHERE Week IS NULL
	SELECT Week, COUNT(*) FROM players GROUP BY Week
	
	SELECT Year FROM players
	SELECT Year FROM players WHERE Year IS NULL
	SELECT Year, COUNT(*) FROM players GROUP BY Year

-------------------------------

-- team
	
	SELECT Against FROM team
	SELECT Against From team WHERE Against IS NULL
	SELECT Against, COUNT(*) FROM team GROUP BY Against
	
	SELECT Beneficiary FROM team
	SELECT Beneficiary FROM team WHERE Beneficiary IS NULL
	SELECT Beneficiary, COUNT(*) FROM team GROUP BY Beneficiary
	
	SELECT Date FROM team
	SELECT Date FROM team WHERE Date IS NULL
	SELECT MIN(Date), MAX(Date) FROM team
	
	SELECT Ref_Crew FROM team
	SELECT Ref_Crew FROM team WHERE Ref_Crew IS NULL
	SELECT Ref_Crew, COUNT(*) FROM team GROUP BY Ref_Crew
	
	SELECT Total_Count FROM team
	SELECT Total_Count FROM team WHERE Total_Count IS NULL
	SELECT MIN(Total_Count), MAX(Total_Count) FROM team
	SELECT Total_Count FROM team WHERE Total_Count::TEXT !~ '^\d+$'
	
	SELECT Total_Yards FROM team
	SELECT Total_Yards FROM team WHERE Total_Yards IS NULL
	SELECT MIN(Total_Yards), MAX(Total_Yards) FROM team
	SELECT Total_Yards FROM team WHERE Total_Yards::TEXT !~ '^\d+$'
	
	SELECT Off_Count FROM team
	SELECT Off_Count FROM team WHERE Off_Count IS NULL
	SELECT MIN(Off_Count), MAX(Off_Count) FROM team
	SELECT Off_Count FROM team WHERE Off_Count::TEXT !~ '^\d+$'
	
	SELECT Off_Yards FROM team
	SELECT Off_Yards FROM team WHERE Off_Yards IS NULL
	SELECT MIN(Off_Yards), MAX(Off_Yards) FROM team
	SELECT Off_Yards FROM team WHERE Off_Yards::TEXT !~ '^\d+$'
	
	SELECT Def_Count FROM team
	SELECT Def_Count FROM team WHERE Def_Count IS NULL
	SELECT MIN(Def_Count), MAX(Def_Count) FROM team
	SELECT Def_Count FROM team WHERE Def_Count::TEXT !~ '^\d+$'
	
	SELECT Def_Yards FROM team
	SELECT Def_Yards FROM team WHERE Def_Yards IS NULL
	SELECT MIN(Def_Yards), MAX(Def_Yards) FROM team
	SELECT Def_Yards FROM team WHERE Def_Yards::TEXT !~ '^\d+$'
	
	SELECT ST_Count FROM team
	SELECT ST_Count FROM team WHERE ST_Count IS NULL
	SELECT MIN(ST_Count), MAX(ST_Count) FROM team
	SELECT ST_Count FROM team WHERE ST_Count::TEXT !~ '^\d+$'
	
	SELECT ST_Yards FROM team
	SELECT ST_Yards FROM team WHERE ST_Yards IS NULL
	SELECT MIN(ST_Yards), MAX(ST_Yards) FROM team
	SELECT ST_Yards FROM team WHERE ST_Yards::TEXT !~ '^\d+$'
	
	SELECT Pre_Snap FROM team
	SELECT Pre_Snap FROM team WHERE Pre_Snap IS NULL
	SELECT MIN(Pre_Snap), MAX(Pre_Snap) FROM team
	SELECT Pre_Snap FROM team WHERE Pre_Snap::TEXT !~ '^\d+$'
	
	SELECT Off_Pre_Snap FROM team
	SELECT Off_Pre_Snap FROM team WHERE Off_Pre_Snap IS NULL
	SELECT MIN(Off_Pre_Snap), MAX(Off_Pre_Snap) FROM team
	SELECT Off_Pre_Snap FROM team WHERE Off_Pre_Snap::TEXT !~ '^\d+$'
	
	SELECT Def_Pre_Snap FROM team
	SELECT Def_Pre_Snap FROM team WHERE Def_Pre_Snap IS NULL
	SELECT MIN(Def_Pre_Snap), MAX(Def_Pre_Snap) FROM team
	SELECT Def_Pre_Snap FROM team WHERE Def_Pre_Snap::TEXT !~ '^\d+$'
	
	SELECT ST_Pre_Snap FROM team
	SELECT ST_Pre_Snap FROM team WHERE ST_Pre_Snap IS NULL
	SELECT MIN(ST_Pre_Snap), MAX(ST_Pre_Snap) FROM team
	SELECT ST_Pre_Snap FROM team WHERE ST_Pre_Snap::TEXT !~ '^\d+$'
	
	SELECT Declined FROM team
	SELECT Declined FROM team WHERE Declined IS NULL
	SELECT MIN(Declined), MAX(Declined) FROM team
	SELECT Declined FROM team WHERE Declined::TEXT !~ '^\d+$'
	
	SELECT Offsetting FROM team
	SELECT Offsetting FROM team WHERE Offsetting IS NULL
	SELECT MIN(Offsetting), MAX(Offsetting) FROM team
	SELECT Offsetting FROM team WHERE Offsetting::TEXT !~ '^\d+$'
	
	SELECT Week FROM team
	SELECT Week FROM team WHERE Week IS NULL
	SELECT MIN(Week), MAX(Week) FROM team
	SELECT Week FROM team WHERE Week::TEXT !~ '^\d+$'
	SELECT Week FROM team WHERE Week::TEXT ~ '^\d+$'
	
	SELECT Year FROM team
	SELECT Year FROM team WHERE Year IS NULL
	SELECT MIN(Year), MAX(Year) FROM team
	SELECT Year FROM team WHERE Year::TEXT !~ '^\d+$'
	
--------------------------------