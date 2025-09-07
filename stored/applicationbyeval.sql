DELIMITER $
CREATE PROCEDURE applicationByEvaluation(
    IN eval_username VARCHAR(30)
)
BEGIN
    SELECT cand_username, job_id
    FROM apps_history 
    WHERE eval_username1 = eval_username OR eval_username2 = eval_username;
END;
$
DELIMITER ;