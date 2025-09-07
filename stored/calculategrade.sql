DELIMITER $
CREATE FUNCTION CalculateScore(cand_username VARCHAR(30)) 
RETURNS FLOAT READS SQL DATA
BEGIN
    DECLARE total_score FLOAT DEFAULT 0;
    DECLARE degree_score FLOAT DEFAULT 0;
	DECLARE lang_score FLOAT DEFAULT 0;
	DECLARE project_score FLOAT DEFAULT 0;
    
	SELECT
        CASE
            WHEN bathmida = 'BSc' THEN 1
            WHEN bathmida = 'MSc' THEN 2
            WHEN bathmida = 'PhD' THEN 3
            ELSE 0
        END INTO degree_score
    FROM degree 
    INNER JOIN has_degree ON degree.title = has_degree.degr_title AND degree.idryma = has_degree.degr_idryma
    WHERE has_degree.cand_username = cand_username;
    
    -- Check for foreign languages
    SELECT COUNT(*) INTO lang_score
    FROM languages
    WHERE candid = cand_username;

    -- Check for projects
    SELECT COUNT(*) INTO project_score
    FROM project
    WHERE candid = cand_username;
	
    -- Return the total score
    SET total_score = degree_score + lang_score + project_score;
    
    RETURN total_score;
END;
$

DELIMITER ;