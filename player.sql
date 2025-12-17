create database game;
use game;
CREATE TABLE Team (teamid INT PRIMARY KEY,team_name VARCHAR(30),city VARCHAR(30),coach VARCHAR(30));
INSERT INTO Team VALUES(1,'Warriors','Bangalore','Coach A');
INSERT INTO Team VALUES(2,'Titans','Chennai','Coach B');
INSERT INTO Team VALUES(3,'Riders','Mumbai','Coach C');
INSERT INTO Team VALUES(4,'Kings','chennai','Coach D');
INSERT INTO Team VALUES(5,'Capitals','Delhi','Coach E');
select * from Team;

CREATE TABLE Player0 (pid INT PRIMARY KEY,pname VARCHAR(30),age INT,teamid INT,isCaptain VARCHAR(3),FOREIGN KEY (teamid) REFERENCES Team(teamid));
INSERT INTO Player0 VALUES(101,'Nithu',19,1,'Yes');
INSERT INTO Player0 VALUES(102,'Hindu',18,2,'No');
INSERT INTO Player0 VALUES(103,'Shree',22,3,'Yes');
INSERT INTO Player0 VALUES(104,'Leema',20,4,'No');
INSERT INTO Player0 VALUES(105,'Rose',21,5,'Yes');
select * from Player0;

CREATE TABLE Stadium0 (stadiumid INT PRIMARY KEY,stadium_name VARCHAR(30),city VARCHAR(30),area_name VARCHAR(30),pincode VARCHAR(10));
INSERT INTO Stadium0 VALUES(1,'National Stadium','Bangalore','Indiranagar','560001');
INSERT INTO Stadium0 VALUES(2,'City Stadium','Chennai','T Nagar','600002');
INSERT INTO Stadium0 VALUES(3,'Chinnaswamy Stadium','Banglore','Cubbon park','600003');
INSERT INTO Stadium0 VALUES(4,'HPCA Stadium','Himachal','Darmashala;','600004');
INSERT INTO Stadium0 VALUES(5,'Arun Stadium','Delhi','Kotla','600005');
select * from Stadium0;

CREATE TABLE MatchDetails (matchid INT PRIMARY KEY,team1 INT,team2 INT,stadiumid INT,match_date DATE,match_time TIME,winner_team INT,man_of_match INT,FOREIGN KEY (team1) REFERENCES Team(teamid),FOREIGN KEY (team2) REFERENCES Team(teamid),FOREIGN KEY (stadiumid) REFERENCES Stadium(stadiumid),FOREIGN KEY (winner_team) REFERENCES Team(teamid),FOREIGN KEY (man_of_match) REFERENCES Player(pid));
INSERT INTO MatchDetails VALUES(1,1,2,1,'2024-01-10','10:00:00',1,102);
INSERT INTO MatchDetails VALUE(2,1,3,1,'2024-01-12','14:00:00',1,102);
INSERT INTO MatchDetails VALUE(3,2,3,2,'2024-01-15','16:00:00',3,103);
INSERT INTO MatchDetails VALUES(4, 2, 1, 2, '2024-01-18', '11:00:00', 2, 104);
INSERT INTO MatchDetails VALUES(5, 3, 1, 1, '2024-01-20', '15:30:00', 1, 102);
select * from  MatchDetails;

SELECT p.pname, t.team_name, p.age FROM Player p, Team t WHERE p.teamid = t.teamid AND p.age = (SELECT MIN(age) FROM Player);

SELECT s.* FROM Stadium s, MatchDetails m WHERE s.stadiumid = m.stadiumid GROUP BY s.stadiumid HAVING COUNT(*) = (SELECT MAX(cnt)FROM (SELECT COUNT(*) cnt FROM MatchDetails GROUP BY stadiumid) x);

SELECT p.pid, p.pname FROM Player0 p, MatchDetails m WHERE p.pid = m.man_of_match AND isCaptain = 'No' GROUP BY p.pid, p.pname HAVING COUNT(*) >= 2;

SELECT t.* FROM Team t, MatchDetails m WHERE t.teamid = m.winner_team GROUP BY t.teamid HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) cnt FROM MatchDetails GROUP BY winner_team) y);

SELECT t.team_name FROM Team t, MatchDetails m WHERE t.teamid = m.winner_team GROUP BY t.teamid, t.team_name HAVING COUNT(DISTINCT m.stadiumid) = 1;