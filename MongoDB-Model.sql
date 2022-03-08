--  Design DB model for Guvi Zen class

use zen;
-- codekata
	CREATE TABLE codekata(userid INTEGER, number_of_problems_solved INTEGER, 
    FOREIGN KEY (userid) REFERENCES users(userid));

    INSERT INTO codekata(userid,number_of_problems_solved) VALUES(1,50),(2,80),(3,20),(4,40),(5,75);


-- USERS

CREATE TABLE users(userid INTEGER AUTO_INCREMENT PRIMARY KEY,username VARCHAR(100),useremail VARCHAR(100),batchid INTEGER);

INSERT INTO users(username,useremail,batchid) VALUES("John","john@gmail.com"),
                                                   ("Michael","michael@gmail.com"),
                                                   ("Shawn","shawn@gmail.com"),
                                                    
    
--  company drives
 CREATE TABLE company_drives(driveid INTEGER AUTO_INCREMENT PRIMARY KEY,userid INTEGER,
 drive_date DATE,company VARCHAR(100), FOREIGN KEY (userid) REFERENCES users(userid));

INSERT INTO  company_drives(userid,drive_date,company) VALUES (3,"2020-10-8","Google"),
                                                              (1,"2020-10-17","Microsoft"),
                                                              (2,"2020-10-28","Intel"),
                                                          

--  mentors
 CREATE TABLE mentors(mentorid INTEGER AUTO_INCREMENT PRIMARY KEY,mentorname VARCHAR(100),
 mentoremail VARCHAR(100));

 INSERT INTO mentors(mentorname,mentoremail) VALUES ("John","john@gmail.com"),
                                                   ("Michael","michael@gmail.com"),
                                                   ("Shawn","shawn@gmail.com"),
                                                 
 
--  topic
 CREATE TABLE topics(topicid INTEGER AUTO_INCREMENT PRIMARY KEY,topic VARCHAR(200),
 topic_date DATE,mentorid INTEGER,batchid INTEGER,
 FOREIGN KEY (mentorid) REFERENCES mentors(mentorid));

 INSERT INTO  topics(topic,topic_date,mentorid,batchid) VALUES("HTML Basics","2020-09-10",1,26),
                                                               ("CSS Basics","2020-09-21",2,27),
                                                               ("Bootstrap-Grid","2020-10-30",3,27),
															
 
--  tasks
CREATE TABLE tasks(taskid INTEGER AUTO_INCREMENT PRIMARY KEY, topicid INTEGER,task VARCHAR(1000),
batchid INTEGER,
FOREIGN KEY (topicid) REFERENCES topics(topicid)
);

INSERT INTO tasks(topicid,task,batchid) VALUES (1,"HTML Task",26),
                                         (2,"CSS Task",27),
                                         (3,"Bootstrap Task",26),
                                       

-- attendance
CREATE TABLE attendance(attendanceid INTEGER AUTO_INCREMENT PRIMARY KEY, userid INTEGER,
courseid INTEGER ,topicsid INTEGER, attended BOOLEAN,
FOREIGN KEY (userid) REFERENCES users(userid),
FOREIGN KEY (topicsid) REFERENCES topics(topicsid),
FOREIGN KEY (courseid) REFERENCES courses(courseid)
);
INSERT INTO attendance(userid,courseid,topicsid,attended) VALUES(2,5,5,true),
                                                                (5,1,1,true)
                                                                (1,3,3,false)
                                                           



-- /*query*/
CREATE TABLE queries(queryid INTEGER AUTO_INCREMENT PRIMARY KEY , userid INTEGER, 
querybody VARCHAR(1000),mentorid INTEGER,
FOREIGN KEY (userid) REFERENCES users(userid),FOREIGN KEY (mentorid) REFERENCES mentors(mentorid)
)

INSERT INTO   queries(userid,querybody,mentorid) VALUES(1,"query about HTML",1),
                                                       (3,"query about CSS",5),
                                                       (2,"query about Bootstrap",4),
                                                    