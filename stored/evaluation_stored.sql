DELIMITER $
CREATE PROCEDURE GetEvaluationGrade(
    IN evaluator_username VARCHAR(30),
    IN employee_username VARCHAR(30),
    IN job_id INT(11),
    OUT evaluation_grade FLOAT
)
BEGIN
    -- elegxos gia yparxouses eggrafes ston pinaka evaluations   
SELECT score INTO evaluation_grade
FROM evaluations
WHERE (eval_username1 = evaluator_username OR eval_username2 = evaluator_username)
	AND cand_username = employee_username
	AND job_id = job_id;
IF evaluation_grade IS NULL THEN
	SET evaluation_grade = 0;
END IF;
-- default evaluation grade is set to 1
IF evaluation_grade = 1 THEN 
	SET evaluation_grade = calculatescore(employee_username);
END IF;    
SELECT evaluation_grade;

END;
$

DELIMITER ;