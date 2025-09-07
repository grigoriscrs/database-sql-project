DELIMITER $

CREATE TRIGGER before_insert_application
BEFORE INSERT ON applications
FOR EACH ROW
BEGIN
    DECLARE submission_deadline_date DATE;
    DECLARE job_start_date DATE;

    SELECT start_date INTO job_start_date FROM job WHERE id = NEW.job_id;
    -- Έλεγχος για νέες αιτήσεις που καταχωρούνται έως και 15 μέρες πριν την start_date
    SET submission_deadline_date = DATE_SUB(job_start_date, INTERVAL 15 DAY);
    IF NEW.submission_date > submission_deadline_date THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Η υποβολή αίτησης πρέπει να γίνει τουλάχιστον 15 μέρες πριν την start_date';
    END IF;

    -- Έλεγχος για περιορισμό αιτήσεων ανά εργαζόμενο
    IF (SELECT COUNT(*) FROM applications WHERE cand_username = NEW.cand_username AND status = 'active') >= 3 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Ο εργαζόμενος έχει ήδη τρεις ενεργές αιτήσεις';
    END IF;
END;
$

CREATE TRIGGER before_update_application
BEFORE UPDATE ON applications
FOR EACH ROW
BEGIN

	DECLARE job_start_date DATE;
	SELECT start_date INTO job_start_date FROM job WHERE id = NEW.job_id;
	-- Έλεγχος για ακύρωση αίτησης μέχρι 10 μέρες πριν την start_date
	IF NEW.status = 'cancelled' AND DATEDIFF(job_start_date, CURDATE()) <= 10 THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Δεν επιτρέπεται η ακύρωση αίτησης λιγότερο από 10 μέρες πριν την start_date';
	END IF;
END;
$

DELIMITER ;
