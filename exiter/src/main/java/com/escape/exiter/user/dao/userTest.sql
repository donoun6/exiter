INSERT INTO User (userId, uPasswd, uName, uPhone) VALUES ("knh", "11111111", "김나혜", "010-1111-1111");

SELECT Count(*) as cnt FROM User WHERE userId = "knh" and uPasswd = "11111111";

INSERT INTO User (userId, uPasswd, uName, uPhone, uGrade) VALUES ("dbswjd","1234","윤정짱","010-2619-3226","방린이");
DELETE FROM User WHERE uid=1;
SELECT * FROM User;

UPDATE User A INNER JOIN Account B ON
A.uid=B.userId
SET A.grade = 
CASE 
WHEN B.point >= 10 THEN '방린이'
WHEN B.point >=30 THEN '꽃길러'
WHEN B.point >=50 THEN '대탈출러'
END;


CREATE TABLE Account (
	pId				BIGINT			PRIMARY KEY AUTO_INCREMENT,
	userId 			BIGINT			NOT NULL,
	point			INT				NOT NULL		DEFAULT 0,
	
	CONSTRAINT Account_userId_FK FOREIGN KEY (userId) REFERENCES User(uId)
) AUTO_INCREMENT = 3001;

INSERT INTO Theme (cid, tName, tCategory, tLevel, tNum, tPrice, tDef, tTime, tImage) VALUES (1,"가이아 기적의땅","판타지",3,2,20000,"모든 것이 이 곳에서 시작된다.", 60,"1_a.jpg");
INSERT INTO Company (comId, comPasswd, comName, comNum, comAddress, comTel,comX,comY) VALUES ("gold","123456","황금열쇠","328-36-00737","대구광역시 중구 봉산동 22-1","053-428-0045",35.8664273,128.5969341);