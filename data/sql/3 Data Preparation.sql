--CREATE TABLE pen_by_pos AS
SELECT pos, COUNT(*) AS count_by_pos, total_penalty_yards_by_position
FROM data_collection
GROUP BY pos, total_penalty_yards_by_position
ORDER BY total_penalty_yards_by_position DESC

------------

SELECT * FROM pen_by_pos -- ***********************************************

------------------------

--CREATE TABLE pen_by_pos_2 AS
SELECT pl.name,
       pl.team,
       pl.pos AS player_position,
       pen.name AS penalty_name,
       pen.yards AS penalty_yards
FROM penalties AS pen
JOIN players AS pl USING(id)
JOIN games AS g USING(id)
ORDER BY pl.pos, pl.name, pl.team;

-------------------------------

SELECT * FROM data_collection