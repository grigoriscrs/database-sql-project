INSERT ignore INTO user (username, password, name, lastname, reg_date, email) 
	      VALUES ('emplMark1', 'user18Pass', 'Mark', 'Cuban', '2019-08-01', 'mark1@gmail.com'),
                 ('emplKostas2', 'user19Pass', 'Kostas', 'Afas', '2018-11-05', 'kostas@yahoo.com'),
				 ('emplTakis3', 'user20Pass', 'Takis', 'Tontos', '2020-03-10', 'takis20@yahoo.gr'),
                 ('emplBill4', 'user18Pass', 'Bill', 'Eipstein', '2021-01-12', 'bill18@gmail.com'),
                 ('emplOlga5', 'user19Pass', 'Olga', 'Petridi', '2023-02-09', 'olga19@hotmail.com'),
				 ('emplTasia6', 'user20Pass', 'Tasia', 'Blachou', '2024-08-10', 'tasia20@hotmail.com'),
                 ('emplKonna7', 'user912pass', 'Konna', 'Thanou', '2019-11-11','konna123@gmail.com'),
                 ('evalMpampis1', 'user18Pass', 'Alexis', 'Texas', '2019-08-06', 'alexis1@gmail.com'),
                 ('evalAnna2', 'user19Pass', 'Emi', 'Martinez', '2018-11-09', 'kostas@yahoo.com'),
				 ('evalMairi3', 'user20Pass', 'Lionel', 'Messi', '2020-03-01', 'leo20@yahoo.gr'),
                 ('evalAggeliki4', 'user18Pass', 'Erling', 'Haaland', '2021-01-08', 'erling18@gmail.com'),
                 ('evalGiorgos5', 'user19Pass', 'Elpida', 'Tufli', '2020-02-09', 'elp13@hotmail.com'),
				 ('evalStefanos6', 'user20Pass', 'Mairi', 'Manou', '2023-01-11', 'mairi0@hotmail.com'),
                 ('managerGreg13', 'user19Pass', 'Greg', 'Chris', '2020-02-09', 'greg13@hotmail.com');
                 
INSERT ignore INTO employee ( username, bio, sistatikes, certificates)
     VALUES ('emplMark1', 'Experienced frontend developer with a focus on user experience.', 'None', 'Frontend Development Certificate'),
			('emplKostas2', 'IT support specialist with knowledge in circuits troubleshooting.', 'Tessereis', 'Circuit Master Certificate'),
            ('emplTakis3', 'Experienced organic chemistry with a proven track record in teaching.', 'Mia', 'Molecules Specialist'),
            ('emplBill4', 'Experienced backend developer with a focus on web3 applications.', 'Dyo', 'Backend Development Certificate'),
			('emplOlga5', 'SEO digital marketing specialist with a focus on blogs.', 'Tria', 'SEO Specialist'),
            ('emplTasia6', 'Chemical engineer with a proven track record on alternate power sources.', 'None', 'Chemical Engineer'),
            ('emplKonna7', 'Electrical engineer specialising in AI architectures', 'Treis', 'Electrical Engineer');
            
INSERT ignore INTO degree (title, idryma, bathmida)
	 VALUES ('Master in Computer Science', 'Sxoli Mixanikwn H/Y', 'PhD'),   
			('Master in Electrical Engineering' , 'Sxoli Ilektrologwn Mixanikwn', 'MSc'),
            ('Master in Chemistry' , 'Sxoli Ximikwn Mixanikon', 'PhD'),
            ('Master in Computer Engineering', 'CEID Panepistimio Patron', 'PhD'),   
			('Master in Biology' , 'Sxoli Biologias', 'MSc'),
            ('Master in Marketing' , 'Sxoli Dioikisis Epeixiriseon', 'MSc');
            
INSERT ignore INTO has_degree(degr_title, degr_idryma, cand_username, etos, grade)
     VALUES ('Master in Computer Science', 'Sxoli Mixanikwn H/Y','emplMark1','2016','6'),   
			('Master in Electrical Engineering' , 'Sxoli Ilektrologwn Mixanikwn','emplKostas2','2010','7.1'),
            ('Master in Chemistry' , 'Sxoli Ximikwn Mixanikon','emplTasia6','2020','8.4'),
            ('Master in Computer Engineering', 'CEID Panepistimio Patron','emplBill4','2018','6.7'),   
			('Master in Biology' , 'Sxoli Biologias','emplTakis3','2021','8'),
            ('Master in Marketing' , 'Sxoli Dioikisis Epeixiriseon','emplOlga5','2023','9.1');
            
INSERT ignore INTO etaireia(AFM, DOY, name, tel, street, num, city, country)
     VALUES ('123456789', 'A DOY PATRWN', 'CMP DESIGNS', '+2610811', 'Maizwnos', '92', 'Patra', 'Greece'),
			('987654321', 'B DOY ATHINWN', 'WIFI SOLUTIONS', '+2108222', 'Patisiwn', '150', 'Athina', 'Greece'),
            ('564879123', 'A DOY THESSALONIKIS', 'REPAIR INC', '+2310333', 'Tsimitski', '46', 'Thessaloniki', 'Greece');
            
INSERT ignore INTO evaluator(username, exp_years, firm)
     VALUES ('evalMpampis1', '1', '123456789'),
            ('evalAnna2', '2', '987654321'),
            ('evalMairi3', '2', '564879123'),
            ('evalAggeliki4', '4', '123456789'),
            ('evalGiorgos5', '5', '987654321'),
            ('evalStefanos6', '7', '564879123');
            
INSERT ignore INTO job (id, start_date, salary, position, edra, evaluator, announce_date, submission_date) 
     VALUES (NULL, '2023-01-10', 10000, 'UI/UX Designer', 'Patra', 'evalMpampis1', '2021-01-01', '2023-01-08'),
			(NULL, '2021-01-12', 7000, 'Project Coordinator', 'Thessaloniki', 'evalAnna2', '2019-01-03', '2022-11-04'),
			(NULL, '2019-02-14', 8700, 'Sales Representative', 'Athina', 'evalMairi3', '2018-02-05', '2020-12-06'),
            (NULL, '2018-01-10', 9000, 'Graphics Designer', 'Patra', 'evalAggeliki4', '2021-01-01', '2023-11-12'),
			(NULL, '2023-09-12', 7500, 'WEB3 Developper', 'Thessaloniki', 'evalGiorgos5', '2020-01-03', '2023-01-04'),
			(NULL, '2023-12-14', 8000, 'Backend Database Engineer', 'Athina', 'evalStefanos7', '2016-02-05', '2023-02-09'),
            (NULL, '2023-11-10', 9000, 'Big Data Analyst', 'Patra', 'evalAggeliki4', '2021-01-01', '2023-11-12'),
			(NULL, '2023-09-12', 7500, 'Meth Cook', 'Thessaloniki', 'evalGiorgos5', '2017-01-08', '2021-01-11');
            
INSERT ignore INTO applies(cand_username, job_id)
	  VALUES ('emplMark1',1),
			 ('emplKostas2',4),
             ('emplTakis3',8),
			 ('emplBill4',6),
             ('emplOlga5',3),
			 ('emplTasia6',2);
             
INSERT ignore INTO requires (job_id, subject_title) 
     VALUES (1, 'Application Interface Development'),
			(2, 'Organizational Behavior'),
			(3, 'Digital Marketing 101'),
            (4, 'FrontEnd with JS'),
			(5, 'Intro to WEB3 and IoT'),
			(6, 'Database Creation'),
            (7, 'Big Data Analysis 101'),
			(8, 'Chemical Substances');
            
INSERT ignore INTO subject (title, descr, belongs_to) 
             VALUES ('Application Interface Development', 'Design and programming of mobile games.', 'Application Interface Development'),
                    ('Organizational Behavior', 'Developing and implementing strategic marketing plans.', 'Organizational Behavior'),
                    ('Digital Marketing 101', 'Study of individual and group behavior within organizations.', 'Digital Marketing 101'),
                    ('FrontEnd with JS', 'Using JS to create interfaces', 'FrontEnd with JS'),
                    ('Intro to WEB3 and IoT', 'Introduction to Web3 and Internet of Things', 'Intro to WEB3 and IoT'),
                    ('Database Creation', 'MongoDB and nonSQL databases', 'Database Creation'),
                    ('Big Data Analysis 101', 'Introduction to the concept of Big Data', 'Big Data Analysis 101'),
                    ('Chemical Substances', 'Introduction to forming crystal substances from scratch', 'Chemical Substances');

INSERT ignore INTO languages (candid, lang) 
     VALUES	('emplMark1', 'EN'),
			('emplKostas2', 'GR'),
			('emplTakis3', 'GR'),
            ('emplBill4', 'FR');
            
INSERT ignore INTO project (candid, num, descr, url) 
     VALUES	('emplMark1', NULL, 'E-commerce Mobile App', 'https://example.com/project1'),
			('emplKostas2', NULL, 'Integrated circuits for ARM processors', 'https://example.com/project2'),
			('emplTakis3', NULL, 'Bionic extento-arm prototypes', 'https://example.com/project3'),
            ('emplBill4', NULL, 'Database extraction analyst', 'https://example.com/project4'),
			('emplOlga5', NULL, 'Content Marketing Strategy', 'https://example.com/project5'),
			('emplTasia6', NULL, 'Mobile Application digital marketing', 'https://example.com/project6'),
            ('emplKonna7', NULL, 'Chess AI focused on Fisher Random', 'https://example.com/project7');


INSERT ignore INTO job (id, start_date, salary, position, edra, evaluator, announce_date, submission_date) 
     VALUES (NULL, '2023-01-11', 10030, 'UI/UX Designer', 'Patra', 'evalMpampis1', '2021-01-01', '2023-01-08');
     
INSERT ignore INTO user (username, password, name, lastname, reg_date, email) 
	      VALUES
('managerGreg13', 'user19Pass', 'Greg', 'Chris', '2020-02-09', 'greg13@hotmail.com');

INSERT IGNORE INTO evaluations(eval_id,job_id, cand_username,eval_username1,eval_username2, eval_date) 
VALUES (null, 1, 'emplMark1','evalMpampis1','evalAnna2', CURRENT_DATE);

INSERT IGNORE INTO applications()
VALUES (null,'evalMpampis1','evalAnna2','emplMark1',1,'active',current_date());
