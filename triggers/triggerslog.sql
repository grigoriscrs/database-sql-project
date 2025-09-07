DELIMITER $

CREATE TRIGGER log_job_action
AFTER INSERT ON job
FOR EACH ROW
BEGIN
    INSERT INTO log (action_type, table_name, record_id, username, action_datetime)
    VALUES ('INSERT', 'job', NEW.id, USER(), NOW());
END;
$

CREATE TRIGGER log_job_update
AFTER UPDATE ON job
FOR EACH ROW
BEGIN
    INSERT INTO log (action_type, table_name, record_id, username, action_datetime)
    VALUES ('UPDATE', 'job', OLD.id, USER(), NOW());
END;
$

CREATE TRIGGER log_job_delete
AFTER DELETE ON job
FOR EACH ROW
BEGIN
    INSERT INTO log (action_type, table_name, record_id, username, action_datetime)
    VALUES ('DELETE', 'job', OLD.id, USER(), NOW());
END;
$


CREATE TRIGGER log_user_action
AFTER INSERT ON user
FOR EACH ROW
BEGIN
    INSERT INTO log (action_type, table_name,record_name, username, action_datetime)
    VALUES ('INSERT', 'user', NEW.username, USER(), NOW());
END;
$

CREATE TRIGGER log_user_update
AFTER UPDATE ON user
FOR EACH ROW
BEGIN
    INSERT INTO log (action_type, table_name, record_name, username, action_datetime)
    VALUES ('UPDATE', 'user', OLD.username, USER(), NOW());
END;
$

CREATE TRIGGER log_user_delete
AFTER DELETE ON user
FOR EACH ROW
BEGIN
    INSERT INTO log (action_type, table_name,record_name, username, action_datetime)
    VALUES ('DELETE', 'user', OLD.username, USER(), NOW());
END;
$

CREATE TRIGGER log_degree_action
AFTER INSERT ON degree
FOR EACH ROW
BEGIN
    INSERT INTO log (action_type, table_name, record_name, username, action_datetime)
    VALUES ('INSERT', 'degree', NEW.idryma, USER(), NOW());
END;
$

CREATE TRIGGER log_degree_update
AFTER UPDATE ON degree
FOR EACH ROW
BEGIN
    INSERT INTO log (action_type, table_name, record_name, username, action_datetime)
    VALUES ('UPDATE', 'degree', OLD.idryma, USER(), NOW());
END;
$

CREATE TRIGGER log_degree_delete
AFTER DELETE ON degree
FOR EACH ROW
BEGIN
    INSERT INTO log (action_type, table_name, record_name, username, action_datetime)
    VALUES ('DELETE', 'degree', OLD.idryma, USER(), NOW());
END;
$

DELIMITER ;

