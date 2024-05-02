SELECT * FROM data_collection -- all
SELECT * FROM data_collection ORDER BY total_penalty_yards_by_position DESC, penalty_yards DESC


SELECT * FROM data_collection ORDER BY pos


SELECT * FROM pen_by_pos -- each position
SELECT MIN(count_by_pos), MAX(count_by_pos) FROM pen_by_pos



SELECT * FROM pen_by_pos_2 -- each players type of penalty & yards