create database projectdb;
use projectdb;

CREATE TABLE etaireia(
	AFM char(9) PRIMARY KEY NOT NULL,
    DOY VARCHAR(30) NOT NULL,
    name VARCHAR(35) NOT NULL,
    tel VARCHAR(10) NOT NULL,
    street VARCHAR(15) NOT NULL,
    num INT(11) NOT NULL,
    city VARCHAR(45) NOT NULL,
    country VARCHAR(15) NOT NULL
);

CREATE TABLE user(
	username VARCHAR(30) PRIMARY KEY NOT NULL,
    password VARCHAR(20) NOT NULL,
    name VARCHAR(25) NOT NULL,
    lastname VARCHAR(35) NOT NULL,
    reg_date DATETIME NOT NULL,
    email VARCHAR(30) NOT NULL,
    INDEX ind_date (reg_date)
);

CREATE TABLE evaluator(
	username VARCHAR(30) PRIMARY KEY NOT NULL,
    exp_years TINYINT(4) NOT NULL,
	firm CHAR(9) NOT NULL,
    CONSTRAINT eval_fk_etaireia FOREIGN KEY (firm) 
    REFERENCES etaireia(AFM)
    ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT eval_fk_user FOREIGN KEY (username) 
    REFERENCES user(username) 
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE job(
	id INT(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    start_date DATE NOT NULL,
    salary FLOAT NOT NULL,
    position VARCHAR(60) NOT NULL,
    edra VARCHAR(60) NOT NULL,
    evaluator VARCHAR(30) NOT NULL,
    announce_date DATETIME NOT NULL,
    submission_date DATE NOT NULL,
    CONSTRAINT job_fk_eval FOREIGN KEY (evaluator) 
    REFERENCES evaluator(username) 
    ON DELETE CASCADE ON UPDATE CASCADE,
    INDEX ind_start_date (start_date)
);

CREATE TABLE employee(
	username VARCHAR(30) PRIMARY KEY NOT NULL,
    bio TEXT,
    sistatikes VARCHAR(35),
    certificates VARCHAR(35),
    CONSTRAINT empl_fk_user FOREIGN KEY (username)
    REFERENCES user(username) 
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE languages(
	candid VARCHAR(30) NOT NULL,
    lang SET('EN','FR','SP','GE','CH','GR') NOT NULL,
    PRIMARY KEY(candid, lang),
    CONSTRAINT lang_fk_employee FOREIGN KEY (candid)
    REFERENCES employee(username)
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE project(
	num TINYINT(4) auto_increment NOT NULL,
    candid VARCHAR(30) NOT NULL,
    descr TEXT NOT NULL,
    url VARCHAR(60) NOT NULL,
    PRIMARY KEY(num, candid),
    CONSTRAINT proj_fk_employee FOREIGN KEY (candid) 
    REFERENCES employee(username)
    ON UPDATE CASCADE ON DELETE CASCADE,
    UNIQUE INDEX ind_candid (candid)
);

CREATE TABLE applies(
	cand_username VARCHAR(30) NOT NULL,
    job_id INT(11) NOT NULL,
    PRIMARY KEY(cand_username,job_id),
    CONSTRAINT applies_fk_employee FOREIGN KEY (cand_username) 
    REFERENCES employee(username) 
    ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT applies_fk_job FOREIGN KEY (job_id) 
    REFERENCES job(id) 
    ON DELETE CASCADE ON UPDATE CASCADE,
    UNIQUE INDEX ind_job_id (job_id)
);

CREATE TABLE degree(
	title VARCHAR(150) NOT NULL,
    idryma VARCHAR(140) NOT NULL,
    bathmida ENUM('BSc','MSc','PhD') NOT NULL,
    PRIMARY KEY(idryma, title),
    UNIQUE INDEX ind_title (title)
); 

CREATE TABLE has_degree(
	degr_title VARCHAR(150) NOT NULL,
    degr_idryma VARCHAR(140) NOT NULL,
    cand_username VARCHAR(30) NOT NULL,
    etos YEAR(4) NOT NULL,
    grade FLOAT NOT NULL,
    PRIMARY KEY(degr_title,degr_idryma,cand_username),
    CONSTRAINT has_deg_fk_deg_title FOREIGN KEY (degr_title)
    REFERENCES degree(title) 
    ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT has_deg_fk_deg_idryma FOREIGN KEY (degr_idryma)
    REFERENCES degree(idryma) 
    ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT had_deg_fk_employee FOREIGN KEY(cand_username)
    REFERENCES employee(username)
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE subject(
	title VARCHAR(36) PRIMARY KEY NOT NULL,
    descr TINYTEXT NOT NULL,
    belongs_to VARCHAR(36) NOT NULL,
    FOREIGN KEY (belongs_to) REFERENCES subject(title)
    ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE requires(
	job_id INT(11),
    subject_title VARCHAR(36),
    PRIMARY KEY(job_id,subject_title),
    CONSTRAINT requires_fk_job FOREIGN KEY (job_id) 
    REFERENCES job(id)
    ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT requires_fk_subject FOREIGN KEY(subject_title)
    REFERENCES subject(title)
    ON DELETE CASCADE ON UPDATE CASCADE,
    UNIQUE INDEX ind_sub_title (subject_title)
);

CREATE TABLE applications(
	app_id INT(11) AUTO_INCREMENT NOT NULL,
    eval_username1 VARCHAR(30) DEFAULT NULL,
    eval_username2 VARCHAR(30) 	DEFAULT NULL,
    cand_username VARCHAR(30) NOT NULL,
    job_id INT(11) NOT NULL,
    status ENUM('active','completed','declined') NOT NULL,
    submission_date DATE NOT NULL,
    PRIMARY KEY(app_id),
    CONSTRAINT app_cand_employee FOREIGN KEY(cand_username) 
    REFERENCES employee(username)
	ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT app_fk_eval1 FOREIGN KEY(eval_username1) 
    REFERENCES evaluator(username)
	ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT app_fk_eval2 FOREIGN KEY(eval_username2) 
    REFERENCES evaluator(username)
	ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT app_job_id_job FOREIGN KEY(job_id)
    REFERENCES job(id)
	ON DELETE CASCADE ON UPDATE CASCADE,
    INDEX jobind (job_id)
);

CREATE TABLE apps_history(
	cand_username VARCHAR(30) NOT NULL,
	eval_username1 VARCHAR(30) NOT NULL,
    eval_username2 VARCHAR(30) NOT NULL,
    job_id INT(11) NOT NULL,
    status SET('completed','cancelled','active') DEFAULT 'completed',
    score INT(5) NOT NULL
);

CREATE TABLE database_managers(
	username VARCHAR(30) PRIMARY KEY NOT NULL,
    start_date DATETIME NOT NULL,
    end_date DATE DEFAULT (NULL),
    CONSTRAINT manager_fk_date_user FOREIGN KEY(start_date) 
    REFERENCES user(reg_date)
    ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT managers_fk_user FOREIGN KEY(username) 
    REFERENCES user(username)
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    action_type ENUM('INSERT', 'UPDATE', 'DELETE') NOT NULL,
    record_id INT(11) DEFAULT NULL,
    record_name VARCHAR(30) DEFAULT NULL,
    table_name VARCHAR(50) NOT NULL,
    username VARCHAR(30) NOT NULL,
    action_datetime DATETIME NOT NULL,
    INDEX (action_datetime)
);

CREATE TABLE evaluations(
	eval_id INT(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    job_id INT(11) NOT NULL,
    cand_username VARCHAR(30) NOT NULL,
    eval_username1 VARCHAR(30) NOT NULL,
    eval_username2 VARCHAR(30) NOT NULL,
    score FLOAT DEFAULT 1,
    eval_date DATE NOT NULL,
    CONSTRAINT fk_evals_eval1 FOREIGN KEY (eval_username1)
    REFERENCES evaluator(username)
    ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_job_evals FOREIGN KEY (job_id)
    REFERENCES applications(job_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_evals_eval2 FOREIGN KEY (eval_username2)
    REFERENCES evaluator(username)
    ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_evals_user FOREIGN KEY (cand_username)
    REFERENCES employee(username)
    ON DELETE CASCADE ON UPDATE CASCADE,
    INDEX jobbid (job_id)
);









