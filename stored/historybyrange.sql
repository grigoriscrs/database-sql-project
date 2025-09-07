DELIMITER $
CREATE PROCEDURE getHistoryByRange(
    IN min INT,
    IN max INT
)
BEGIN
    SELECT cand_username AS Employee, job_id 
    FROM apps_history
    WHERE score BETWEEN min AND max;
END;
$
DELIMITER ;
