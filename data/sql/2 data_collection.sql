SELECT * FROM games
SELECT * FROM penalties
SELECT * FROM players
SELECT * FROM team
SELECT * FROM log

SELECT * FROM penalties

-----------

SELECT pl.name, pl.team, pl.pos, pen.name AS penalty_name, pen.yards AS penalty_yards
FROM penalties AS pen
JOIN players AS pl USING(id)
JOIN games AS g USING(id)
GROUP BY pl.name, pl.team, pl.pos, pen.name, pen.yards
ORDER BY pl.pos, pl.name, pl.team

--------------
--CREATE TABLE data_collection AS
SELECT pl.name,
       pl.team,
       pl.pos,
       pen.name AS penalty_name,
       pen.yards AS penalty_yards,
	   SUM(pen.yards) OVER(PARTITION BY pl.pos) AS total_penalty_yards_by_position,
       SUM(pen.yards) OVER(PARTITION BY pl.name) AS total_penalty_yards_by_player,
	   SUM(pen.yards) OVER(PARTITION BY pl.team) AS total_penalty_yards_by_team
FROM penalties AS pen
JOIN players AS pl USING(id)
JOIN games AS g USING(id)
GROUP BY pl.name, pl.team, pl.pos, pen.name, pen.yards
ORDER BY pl.pos, pl.name, pl.team

----------------

SELECT * FROM data_collection
ORDER BY total_penalty_yards_by_position DESC