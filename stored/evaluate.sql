DELIMITER $

CREATE PROCEDURE evaluate(
IN app_id INT,
IN eval_score1 INT,
IN eval_score2 INT
)
BEGIN 
	DECLARE job_id INT;
    DECLARE cand_username VARCHAR(30);
    DECLARE eval1 VARCHAR(30);
    DECLARE eval2 VARCHAR(30);
    DECLARE avg_score FLOAT;

    -- Get job ID, employee username, and evaluator usernames for the given application ID
    SELECT job_id, cand_username, eval_username1, eval_username2
    INTO job_id, cand_username, eval1, eval2
    FROM applications
    WHERE app_id = app_id;

    IF app_id IS NOT NULL THEN
        -- elegxos gia yparxon score
        IF eval_score1 IS NULL THEN
            SET eval_score1 = calculateScore(cand_username);
        END IF;
        IF eval_score2 IS NULL THEN
            SET eval_score2 = calculateScore(cand_username);
        END IF;

        -- elegxos bathmon
        IF eval_score1 < 1 OR eval_score1 > 20 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'score out of range';
        END IF;
        IF eval_score2 < 1 OR eval_score2> 20 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'score out of range';
        END IF;

        -- ypologismos mesou orou
        SET eval_score1 = COALESCE(eval_score1, 0); --  gia na mhn bgazei error me null times 
        SET eval_score2 = COALESCE(eval_score2, 0); 
        SET avg_score = (eval_score1 + eval_score2) / 2;

        -- Insert ston pinaka evaluations
        INSERT INTO evaluations (job_id, cand_username, eval_username1, eval_username2, score, eval_date)
        VALUES (job_id, cand_username, eval1, eval2, avg_score, NOW()); 
		
        
		UPDATE applications
		SET status = 'completed'
		WHERE app_id = app_id;
        
        SELECT 'Evaluation created successfully';
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Application not found';
    END IF;
    
END;
$
DELIMITER ; 