-- company 임시 데이ㅓ
INSERT INTO Company (comId, comPasswd, comTel, comAddress1, comAddress2, comAddress3, comAddress4, comNum, comName, comPocus) 
VALUES ('earth1', '1111', '02-111-1111', '서울', '홍대', '주소3', '주소4', '1111111111', '지구별 방탈출', '홍대어드벤처점');
INSERT INTO Company (comId, comPasswd, comTel, comAddress1, comAddress2, comAddress3, comAddress4, comNum, comName, comPocus) 
VALUES ('earth2', '2222', '053-222-2222', '대구', '동성로', '주소3', '주소4', '2222222222', '지구별 방탈출', '대구점');
INSERT INTO Company (comId, comPasswd, comTel, comAddress1, comAddress2, comAddress3, comAddress4, comNum, comName, comPocus) 
VALUES ('escafeV1', '3333', '053-333-3333', '대구', '동성로', '주소3', '주소4', '3333333333', '방탈출 브이', '삼덕점');

-- theme 임시 데이터
INSERT INTO Theme (cid, tName, tCategory, tLevel, tNum, tPrice, tDef, tTime, tImage) 
VALUES (1, '미스터리', '미스터리', 4, 6, 10000, '오늘 하루, 당신께 잊지 못할 추억을 선물해 드리겠습니다. - 미스터리 트래블', 85, '/resources/images/theme/img2.png');
INSERT INTO Theme (cid, tName, tCategory, tLevel, tNum, tPrice, tDef, tTime, tImage) 
VALUES (1, '퀘스트 : 여정의 시작', '판타지', 3, 3, 10000, '퀘스트를 수락하시겠습니까? * 지구별 어드벤처 입문 테마로 추천드립니다.', 40, '/resources/images/theme/img4.png');
INSERT INTO Theme (cid, tName, tCategory, tLevel, tNum, tPrice, tDef, tTime, tImage) 
VALUES (2, '사명 : 투쟁의 노래', '탈옥', 4, 6, 10000, '그날의 모든 것은 우리의 선택이었다. 처절하게 울려 퍼졌던 투쟁의 노래. * 사명은 분리 테마입니다. 관찰력이 중요한 간수팀과 활동성이 높은 죄수팀으로 나눠집니다. 협력과 소통이 중요합니다.', 69, '/resources/images/theme/img.jpg');
INSERT INTO Theme (cid, tName, tCategory, tLevel, tNum, tPrice, tDef, tTime, tImage) 
VALUES (2, '펭귄키우기', '문제방', 5, 4, 10000, '남극 대륙의 지독한 한파 속에서 태어난 작은 펭귄. 당신의 능력과 선택에 따라 달라지는 145개의 결말. 나는 어떤 펭귄이 될까? * 문제가 매우 어렵고 아주 많은 문제방입니다. 이지/하드 중 모드 선택이 가능하며, 하드모드는 100방 이상 매니아들에게 권장합니다.', 60, '/resources/images/theme/img6.jpg');
INSERT INTO Theme (cid, tName, tCategory, tLevel, tNum, tPrice, tDef, tTime, tImage) 
VALUES (2, '우리 아빠', '공포', 4, 3, 10000, '어느 날 아빠가 나에게 물었다. 내 딸, 기분이 어떠니? 나는 대답했다. 너무 행복해요 아빠. * 이 테마는 자극적이고 불편한 요소가 포함되어 있습니다.', 70, '/resources/images/theme/img3.jpg');
INSERT INTO Theme (cid, tName, tCategory, tLevel, tNum, tPrice, tDef, tTime, tImage) 
VALUES (3, '삼덕반점', '공포', 6, 7, 10000, '김반장의 네번째 의뢰, 새로 생긴 중국집 하나가 주변 중국집들을 초토화 시킨다고 한다. 그들의 비법을 훔쳐오라는 다소 위험하고 식상한 의뢰, 그리고 이곳은 김반장의 단골집이기도 하다.', 60, '/resources/images/theme/img3.png');