DELIMITER $
CREATE PROCEDURE applicationWinner(IN jobid INT)
BEGIN
    DECLARE winner_cand VARCHAR(30);
    DECLARE winning_score FLOAT;
    DECLARE eval1_username VARCHAR(30);
    DECLARE eval2_username VARCHAR(30);

    -- Eyresh nikhth
    SELECT applications.cand_username, AVG(evaluations.score) AS avg_score
    INTO winner_cand, winning_score
    FROM evaluations
    INNER JOIN applications ON evaluations.cand_username = applications.cand_username
    WHERE applications.job_id = jobid
    GROUP BY applications.cand_username, applications.app_id
    ORDER BY avg_score DESC, PromotionApplication.submission_date ASC
    LIMIT 1;
    
    SELECT CONCAT('Selected candidate: ', winner_cand, ' for the job position with id: ', jobid) AS message;
END $
DELIMITER ;