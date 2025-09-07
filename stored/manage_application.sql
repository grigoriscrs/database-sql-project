DELIMITER $

CREATE PROCEDURE ManageApplication(
    IN employee_username VARCHAR(30),
    IN jobid INT,
    IN action_type CHAR(1)
)
BEGIN

DECLARE eval1 VARCHAR(30);
DECLARE eval2 VARCHAR(30);
DECLARE app_status VARCHAR(20);
DECLARE app_exists INT;

-- Action 'i': Insert/Create Application
IF action_type = 'i' THEN
	SELECT COUNT(*) INTO app_exists FROM applications 
	WHERE employee_username = cand_username AND  jobid = job_id;
	IF app_exists = 0 THEN
	-- epilogh evaluators
		SELECT username INTO eval1 FROM evaluator ORDER BY RAND() LIMIT 1;
		SELECT username INTO eval2 FROM evaluator 
        WHERE  username <> eval1 ORDER BY RAND() LIMIT 1;
        
		INSERT INTO applications (app_id,eval_username1,eval_username2,cand_username,job_id,status,submission_date)
		VALUES (null,eval1,eval2,employee_username,jobid,'active',CURRENT_DATE);
		SELECT 'Application created successfully';
	ELSE
		 SELECT 'Application exists';
	END IF;
END IF;
-- Action 'a': Activate Application
IF action_type = 'a' THEN

	SELECT COUNT(*) INTO app_exists FROM apps_history
	WHERE employee_username = cand_username AND job_id = jobid AND status = 'cancelled';
	IF app_exists > 0 THEN
		INSERT INTO applications (eval_username1,eval_username2,cand_username,job_id,status,submission_date)
		SELECT eval1,eval2,employee_username,jobid,'active',CURRENT_DATE
		FROM applications
		WHERE employee_username = cand_username AND job_id = jobid AND status = 'cancelled';
		
		DELETE FROM applications
		WHERE employee_username = cand_username AND job_id = jobid AND status = 'cancelled';

		SELECT 'Application activated';
	ELSE
		SELECT 'No cancelled application found';
	END IF;
END IF;
   -- Action 'c': Cancel Application
IF action_type = 'c' THEN
	SELECT COUNT(*) INTO app_exists FROM applications
	WHERE job_id = jobid AND employee_username = cand_username;

	IF app_exists > 0 THEN
		INSERT INTO apps_history (cand_username, eval_username1, eval_username2, job_id, status )
		SELECT cand_username, eval_username1, eval_username2, job_id, 'cancelled'
		FROM applications
		WHERE employee_username = cand_username AND job_id = jobid;
		DELETE FROM applications
		WHERE employee_username = cand_username AND job_id = jobid;
		SELECT 'Application cancelled';
	ELSE
		SELECT 'No active application found';
	END IF;
END IF;
END;
$
DELIMITER ;
