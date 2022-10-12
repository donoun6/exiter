-- 테이블 삭제
DROP TABLE Answer;
DROP TABLE Question;
DROP TABLE BoardComment;
DROP TABLE Board;
DROP TABLE Reservation;
DROP TABLE ThemePrice;
DROP TABLE ThemeReservationTime;
DROP TABLE Theme;
DROP TABLE Company;
DROP TABLE User;


-- 테이블 비우기
DELETE FROM Answer;
DELETE FROM Question;
DELETE FROM BoardComment;
DELETE FROM Board;
DELETE FROM Reservation;
DELETE FROM ThemePrice;
DELETE FROM ThemeReservationTime;
DELETE FROM Theme;
DELETE FROM Company;
DELETE FROM User;


-- 테이블 보기
SELECT * FROM Answer;
SELECT * FROM Question;
SELECT * FROM BoardComment;
SELECT * FROM Board;
SELECT * FROM Reservation;
SELECT * FROM ThemePrice;
SELECT * FROM ThemeReservationTime;
SELECT * FROM Theme;
SELECT * FROM Company;
SELECT * FROM User;

--임시데이터 등록


-- 테이블 생성
CREATE TABLE User (
	uid				BIGINT				NOT NULL PRIMARY KEY AUTO_INCREMENT,
	userId			VARCHAR(20)			NOT NULL,
	uPasswd			VARCHAR(16)			NOT NULL,
	uName			VARCHAR(20)			NOT NULL,
	uPhone			VARCHAR(13)			NOT NULL,
	uGrade			VARCHAR(10)			NOT NULL DEFAULT '방린이',
	uType			CHAR(1)				NOT NULL DEFAULT 'U',
	uCheck			BOOLEAN				NOT NULL DEFAULT '0',
	regDate			TIMESTAMP			NOT NULL DEFAULT	CURRENT_TIMESTAMP
)AUTO_INCREMENT = 1;

CREATE TABLE Company (
	cid				BIGINT				NOT NULL PRIMARY KEY AUTO_INCREMENT,
	comId			VARCHAR(20)			NOT NULL,
	comPasswd		VARCHAR(16)			NOT NULL,
	comTel			VARCHAR(13)			NOT NULL,
	comAddress1		VARCHAR(10)			NOT NULL,
	comAddress2		VARCHAR(50)			NOT NULL,
	comAddress3		VARCHAR(50)			NOT NULL,
	comAddress4		VARCHAR(50)			NOT NULL,
	comNum			VARCHAR(10)			NOT NULL,
	comName			VARCHAR(20)			NOT NULL,
	comPocus		VARCHAR(20)			NULL,
	regDate			TIMESTAMP			NOT NULL DEFAULT	CURRENT_TIMESTAMP
)AUTO_INCREMENT = 1;

CREATE TABLE Theme (
	tid				BIGINT				NOT NULL PRIMARY KEY AUTO_INCREMENT,
	cid				BIGINT				NOT NULL,
	tName			VARCHAR(20)			NOT NULL,
	tCategory		VARCHAR(10)			NOT NULL,
	tLevel			INT					NOT NULL,
	tNum			INT					NOT NULL,
	tDef			VARCHAR(500)		NOT NULL,
	tTime			INT					NOT NULL,
	tImage			VARCHAR(100)		NOT NULL,
	regDate			TIMESTAMP			NOT NULL DEFAULT	CURRENT_TIMESTAMP,
	CONSTRAINT Theme_cid_FK FOREIGN KEY (cid) REFERENCES Company(cid)
)AUTO_INCREMENT = 1;

CREATE TABLE ThemePrice (
	tid				BIGINT				NOT NULL,
	tpid			BIGINT				NOT NULL PRIMARY KEY AUTO_INCREMENT,
	tpNum			INT					NOT NULL,
	tPrice			INT					NOT NULL,
	CONSTRAINT ThemePrice_tid_FK FOREIGN KEY (tid) REFERENCES Theme(tid)
)AUTO_INCREMENT = 1;

CREATE TABLE ThemeReservationTime (
	tid				BIGINT				NOT NULL,
	trid			BIGINT				NOT NULL PRIMARY KEY AUTO_INCREMENT,
	trTime			VARCHAR(10)			NOT NULL,
	CONSTRAINT ThemeThemeReservationTime_tid_FK FOREIGN KEY (tid) REFERENCES Theme(tid)
)AUTO_INCREMENT = 1;

CREATE TABLE Reservation (
	rid				BIGINT				NOT NULL PRIMARY KEY AUTO_INCREMENT,
	uid				BIGINT				NOT NULL,
	tid				BIGINT				NOT NULL,
	rPrice			INT					NOT NULL,
	rDate			DATE				NOT NULL,
	rTime			TIME				NOT NULL,
	rNum			INT					NOT	NULL,
	regDate			TIMESTAMP			NOT NULL DEFAULT	CURRENT_TIMESTAMP,
	CONSTRAINT Reservation_uid_FK FOREIGN KEY (uid) REFERENCES User(uid),
	CONSTRAINT Reservation_tid_FK FOREIGN KEY (tid) REFERENCES theme(tid)
)AUTO_INCREMENT = 1;

CREATE TABLE Board (
	bid				BIGINT				NOT NULL PRIMARY KEY AUTO_INCREMENT,
	uid				BIGINT				NOT NULL,
	bTitle			VARCHAR(100)		NOT NULL,
	bDef			VARCHAR(3000)		NOT NULL,
	bCategory		VARCHAR(10)			NOT NULL,
	regDate			TIMESTAMP			NOT NULL DEFAULT	CURRENT_TIMESTAMP,
	CONSTRAINT Board_uid_FK FOREIGN KEY (uid) REFERENCES User(uid)
)AUTO_INCREMENT = 1;

CREATE TABLE BoardComment (
	bcid			BIGINT				NOT NULL PRIMARY KEY AUTO_INCREMENT,
	uid				BIGINT				NOT NULL,
	bid				BIGINT				NOT NULL,
	bcDef			VARCHAR(500)		NOT NULL,
	regDate			TIMESTAMP			NOT NULL DEFAULT	CURRENT_TIMESTAMP,
	CONSTRAINT BoardComment_uid_FK FOREIGN KEY (uid) REFERENCES User(uid),
	CONSTRAINT BoardComment_bid_FK FOREIGN KEY (bid) REFERENCES Board(bid)
)AUTO_INCREMENT = 1;

CREATE TABLE Question (
	qid				BIGINT				NOT NULL PRIMARY KEY AUTO_INCREMENT,
	uid				BIGINT				NOT NULL,
	cid				BIGINT				NOT NULL,
	qTitle			VARCHAR(100)		NOT NULL,
	qDef			VARCHAR(3000)		NOT NULL,
	regDate			TIMESTAMP			NOT NULL DEFAULT	CURRENT_TIMESTAMP,
	CONSTRAINT Question_uid_FK FOREIGN KEY (uid) REFERENCES User(uid),
	CONSTRAINT Question_cid_FK FOREIGN KEY (cid) REFERENCES Company(cid)
)AUTO_INCREMENT = 1;

CREATE TABLE Answer (
	aid				BIGINT				NOT NULL PRIMARY KEY AUTO_INCREMENT,
	cid				BIGINT				NOT NULL,
	qid				BIGINT				NOT NULL,
	aDef			VARCHAR(1000)		NOT NULL,
	regDate			TIMESTAMP			NOT NULL DEFAULT	CURRENT_TIMESTAMP,
	CONSTRAINT Answer_qid_FK FOREIGN KEY (qid) REFERENCES Question(qid), 
	CONSTRAINT Answer_cid_FK FOREIGN KEY (cid) REFERENCES Company(cid)
)AUTO_INCREMENT = 1;
