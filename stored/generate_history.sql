DELIMITER $
CREATE PROCEDURE GenerateHistory()
BEGIN

    DECLARE counter INT DEFAULT 0;
    DECLARE eval1 VARCHAR(30);
    DECLARE eval2 VARCHAR(30);
    DECLARE cand_username VARCHAR(30);

    WHILE counter < 60000 DO
        -- Randomly select two different evaluators
        SELECT username INTO eval1 FROM evaluator ORDER BY RAND() LIMIT 1;
        SELECT username INTO eval2 FROM evaluator WHERE username <> eval1 ORDER BY RAND() LIMIT 1;

        -- Randomly select an employee
        SELECT username INTO cand_username FROM employee ORDER BY RAND() LIMIT 1;

        INSERT INTO apps_history (cand_username, eval_username1, eval_username2, job_id, status, score)VALUES 
			(eval1, eval2, cand_username, (counter % 3) + 1, 'completed', FLOOR(RAND() * 20) + 1);
        SET counter = counter + 1;
    END WHILE;
END $

DELIMITER ;