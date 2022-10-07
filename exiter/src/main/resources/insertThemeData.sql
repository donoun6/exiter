-- company 임시 데이터
INSERT INTO Company (comId, comPasswd, comTel, comAddress1, comAddress2, comAddress3, comAddress4, comNum, comName, comPocus) 
VALUES ('earth1', '1111', '02-111-1111', '04041', '서울특별시 마포구 와우산로21길 31', '서교동 364-26', '3층 지구별방탈출 어드벤처점', '3345800466', '지구별 방탈출', '홍대어드벤처점');
INSERT INTO Company (comId, comPasswd, comTel, comAddress1, comAddress2, comAddress3, comAddress4, comNum, comName, comPocus) 
VALUES ('earth2', '2222', '053-222-2222', '41937', '대구광역시 중구 동성로 15-1', '동성로2가 127-2', '3층 4층 5층 지구별방탈출 대구점', '3345800466', '지구별 방탈출', '대구점');
INSERT INTO Company (comId, comPasswd, comTel, comAddress1, comAddress2, comAddress3, comAddress4, comNum, comName, comPocus) 
VALUES ('escafeV1', '3333', '053-333-3333', '41942', '대구광역시 중구 동성로5길 50', '삼덕동1가 17-16', '3층 방탈출브이 삼덕점', '5053893628', '방탈출 브이', '삼덕점');

-- theme 임시 데이터
INSERT INTO Theme (cid, tName, tCategory, tLevel, tNum, tDef, tTime, tImage) 
VALUES (1, '미스터리', '미스터리', 4, 6, '오늘 하루, 당신께 잊지 못할 추억을 선물해 드리겠습니다. - 미스터리 트래블', 85, 'img2.png');
INSERT INTO Theme (cid, tName, tCategory, tLevel, tNum, tDef, tTime, tImage) 
VALUES (1, '퀘스트 : 여정의 시작', '판타지', 3, 3, '퀘스트를 수락하시겠습니까? * 지구별 어드벤처 입문 테마로 추천드립니다.', 40, 'img4.png');
INSERT INTO Theme (cid, tName, tCategory, tLevel, tNum,  tDef, tTime, tImage) 
VALUES (2, '사명 : 투쟁의 노래', '탈옥', 4, 6, '그날의 모든 것은 우리의 선택이었다. 처절하게 울려 퍼졌던 투쟁의 노래. * 사명은 분리 테마입니다. 관찰력이 중요한 간수팀과 활동성이 높은 죄수팀으로 나눠집니다. 협력과 소통이 중요합니다.', 69, 'img.jpg');
INSERT INTO Theme (cid, tName, tCategory, tLevel, tNum,  tDef, tTime, tImage) 
VALUES (2, '펭귄키우기', '문제방', 5, 4, '남극 대륙의 지독한 한파 속에서 태어난 작은 펭귄. 당신의 능력과 선택에 따라 달라지는 145개의 결말. 나는 어떤 펭귄이 될까? * 문제가 매우 어렵고 아주 많은 문제방입니다. 이지/하드 중 모드 선택이 가능하며, 하드모드는 100방 이상 매니아들에게 권장합니다.', 60, 'img6.jpg');
INSERT INTO Theme (cid, tName, tCategory, tLevel, tNum, tDef, tTime, tImage) 
VALUES (2, '우리 아빠', '공포', 3, 6, '어느 날 아빠가 나에게 물었다. 내 딸, 기분이 어떠니? 나는 대답했다. 너무 행복해요 아빠. * 이 테마는 자극적이고 불편한 요소가 포함되어 있습니다.', 70, 'img3.jpg');
INSERT INTO Theme (cid, tName, tCategory, tLevel, tNum, tDef, tTime, tImage) 
VALUES (3, '삼덕반점', '공포', 6, 7, '김반장의 네번째 의뢰, 새로 생긴 중국집 하나가 주변 중국집들을 초토화 시킨다고 한다. 그들의 비법을 훔쳐오라는 다소 위험하고 식상한 의뢰, 그리고 이곳은 김반장의 단골집이기도 하다.', 60, 'img3.png');

-- themePrice 임시 데이터
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (1, 1, 28000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (1, 2, 56000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (1, 3, 81000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (1, 4, 104000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (1, 5, 125000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (1, 6, 150000);

INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (2, 1, 28000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (2, 2, 42000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (2, 3, 56000);

INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (3, 1, 23000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (3, 2, 46000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (3, 3, 66000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (3, 4, 84000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (3, 5, 100000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (3, 6, 120000);

INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (4, 1, 21000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (4, 2, 42000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (4, 3, 60000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (4, 4, 80000);

INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (5, 1, 26000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (5, 2, 52000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (5, 3, 75000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (5, 4, 96000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (5, 5, 115000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (5, 6, 138000);

INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (6, 1, 23000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (6, 2, 45000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (6, 3, 60000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (6, 4, 72000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (6, 5, 90000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (6, 6, 105000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (6, 7, 120000);

-- ThemeReservationTime 임시 데이터
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (1, '10:10 AM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (1, '11:55 AM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (1, '01:40 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (1, '03:25 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (1, '05:10 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (1, '06:55 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (1, '08:40 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (1, '10:25 PM');

INSERT INTO ThemeReservationTime (tid, trTime) VALUES (2, '10:40 AM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (2, '11:40 AM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (2, '12:40 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (2, '01:40 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (2, '02:40 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (2, '03:40 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (2, '04:40 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (2, '05:40 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (2, '06:40 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (2, '07:40 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (2, '08:40 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (2, '09:40 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (2, '10:40 PM');

INSERT INTO ThemeReservationTime (tid, trTime) VALUES (3, '10:00 AM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (3, '11:30 AM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (3, '01:00 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (3, '02:30 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (3, '04:00 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (3, '05:30 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (3, '07:00 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (3, '08:30 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (3, '10:00 PM');

INSERT INTO ThemeReservationTime (tid, trTime) VALUES (4, '10:40 AM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (4, '12:00 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (4, '01:20 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (4, '02:40 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (4, '04:00 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (4, '05:20 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (4, '06:40 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (4, '08:00 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (4, '09:20 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (4, '10:40 PM');

INSERT INTO ThemeReservationTime (tid, trTime) VALUES (5, '10:20 AM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (5, '11:55 AM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (5, '01:30 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (5, '03:05 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (5, '04:40 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (5, '06:15 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (5, '07:50 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (5, '09:25 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (5, '11:00 PM');

INSERT INTO ThemeReservationTime (tid, trTime) VALUES (6, '11:00 AM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (6, '12:15 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (6, '01:25 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (6, '02:40 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (6, '03:55 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (6, '05:10 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (6, '06:25 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (6, '07:40 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (6, '08:55 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (6, '10:10 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (6, '11:25 PM');
