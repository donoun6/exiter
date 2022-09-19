INSERT INTO User (userId, uPasswd, uName, uPhone) VALUES ("knh", "11111111", "김나혜", "010-1111-1111");

SELECT Count(*) as cnt FROM User WHERE userId = "knh" and uPasswd = "11111111";