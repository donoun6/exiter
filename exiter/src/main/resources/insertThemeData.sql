-- company 임시 데이터
INSERT INTO Company (comId, comPasswd, comTel, comAddress1, comAddress2, comAddress3, comAddress4, comNum, comName, comPocus) 
VALUES ('earth1', '11111111', '02-111-1111', '04041', '서울특별시 마포구 와우산로21길 31', '서교동 364-26', '3층 지구별방탈출 어드벤처점', '3345800466', '지구별 방탈출', '홍대어드벤처점');
INSERT INTO Company (comId, comPasswd, comTel, comAddress1, comAddress2, comAddress3, comAddress4, comNum, comName, comPocus) 
VALUES ('earth2', '22222222', '053-222-2222', '41937', '대구광역시 중구 동성로 15-1', '동성로2가 127-2', '3층 4층 5층 지구별방탈출 대구점', '3345800466', '지구별 방탈출', '대구점');
INSERT INTO Company (comId, comPasswd, comTel, comAddress1, comAddress2, comAddress3, comAddress4, comNum, comName, comPocus) 
VALUES ('escafeV1', '33333333', '053-333-3333', '41942', '대구광역시 중구 동성로5길 50', '삼덕동1가 17-16', '3층 방탈출브이 삼덕점', '5053893628', '방탈출 브이', '삼덕점');

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
INSERT INTO Theme (cid, tName, tCategory, tLevel, tNum, tDef, tTime, tImage) 
VALUES (3, '셜록', '추리', 6, 7, '김반장의 네번째 의뢰, 새로 생긴 중국집 하나가 주변 중국집들을 초토화 시킨다고 한다. 그들의 비법을 훔쳐오라는 다소 위험하고 식상한 의뢰, 그리고 이곳은 김반장의 단골집이기도 하다.', 60, '7. 셜록홈즈 살인누명.jpg');

INSERT INTO Theme (cid, tName, tCategory, tLevel, tNum, tDef, tTime, tImage) 
VALUES (1, '테러리스트', '잠입', 3, 7, '"기억하라! 폭탄 해체 기회는 단 한 번뿐이다“
브리핑 합니다.
테러리스트 본거지에서 많은 정보를 제공한 핵융합연구소 
이주혁 박사 가 현재 교신이 안됩니다.
​마지막으로 교신한 내용은 지금 쫒기고 있다는 점​과 폭탄에 관한
단서를 곳곳에 숨겨놓았다는 것.
현재 테러리스트 건물에는 이 지역 도시를 날려버릴 수 있는
마이크로핵폭탄이 장착되어 있습니다.
테러 본 기지에 들어가 폭탄을 해체하고 도시를 구하시기 바랍니다', 60, '13. 테러리스트.jpg');

INSERT INTO Theme (cid, tName, tCategory, tLevel, tNum, tDef, tTime, tImage) 
VALUES (1, '감옥탈출', '액션', 4, 7, '"희망은 당신을 자유롭게 하리라“

 이제 모든 준비는 끝났다.
 감옥구조를 파악하니 약점이 보인다. ​내외부의 도움도 확보했다.
간수들의 일과를 살펴보니 바로 오늘이 탈출 적기.
바로 오늘 나는 탈출할 것이다.
그리고 내 결백함을 증명해서 모든 것을 바로잡을 것이다.', 60, '9. 감옥탈출.jpg');

INSERT INTO Theme (cid, tName, tCategory, tLevel, tNum, tDef, tTime, tImage) 
VALUES (1, '기술자들', '잠입', 4, 7, '​"기술자들.. 그들이 움직이기 시작했다."
​
어느 날 검은손 진 회장으로부터 한 통의 문자가 왔다.
​"날짜-시간-장소" 그 외에는 아무것도 없다.
​무엇을 훔치는지..
​얼마의 대가를 받는지..​현재로서는 알 수 없다..
​
​잠입에 성공하면
​검은손 진 회장과 나의 동료이자 천재 해커인 밧데리가
​우리들을 도와줄 것이다. 이제 그 시간이 다가왔다.', 60, '기술자들.jpg');

INSERT INTO Theme (cid, tName, tCategory, tLevel, tNum, tDef, tTime, tImage) 
VALUES (1, '살인사건 현장', '추리', 4, 7, '​​​"사건조사에 필요한 것은 단지 사실 뿐!“

퀸즈파크주에 살인사건이 발생했다.

현장에서 발견된 ﻿﻿5개의 증거품 ,6명의 용의자
그리고 알 수 없는 ​​﻿​​﻿현장들.
​​﻿​​
당신의 모든 감각을 발휘하여 살인자를 검거해야 한다.', 60, '살인사건.jpg');

INSERT INTO Theme (cid, tName, tCategory, tLevel, tNum, tDef, tTime, tImage) 
VALUES (1, '좀비 90일 후', '공포', 4, 7, '​​​"생존율 제로, 최후의 카운터다운이 시작된다”
정체불명의 바이러스가 전국으로 확산되고 있다.﻿
긴급 재난 경보령이 선포된 가운데 국가는
바이러스 감염자를 ''좀비''라고 정의했다. ​현재로서는 알 수 없다..

감염되면 72시간 후 생존율 제로.
그 생존율 제로가 나와 내 친구들에게 찾아왔다.시간이 얼마 없다.
언론에 있는 친구로부터 중요한 정보를 전달 받았다.
4-4구역 내 연구소에 좀비 항 바이러스를 개발하고 있다는 것.
​이제 우리가 기댈 곳은 이 곳 뿐이다.', 60, '좀비.jpg');

INSERT INTO Theme (cid, tName, tCategory, tLevel, tNum, tDef, tTime, tImage) 
VALUES (2, '마법사 케라스의 방', '판타지  ', 5, 7, '"마법사는 언제나 예고한 시간에 나타나지.“

마법사 케라스에게 붙잡힌 당신.
이제 당신의 영혼을 훔쳐 더욱 강력해지려 합니다.
마법사 케라스가 잠시 집을 비우는 사이 탈출할 수 있는
마지막 기회를 갖게 되었습니다. 
 반드시 탈출하셔서 후일을 도모하시기 바랍니다.', 60, 's2.jpg');

INSERT INTO Theme (cid, tName, tCategory, tLevel, tNum, tDef, tTime, tImage) 
VALUES (2, '얼어붙은 물의 신전', '판타지  ', 3, 7, '국내 최초, 온라인 게임과 방탈출카페의 특별한 콜라보!

"숨쉬는 모든 것이 얼어붙었다.
살고 싶다면, [영웅]의 자취를 따르라!"​

엘리오스를 모험하던 중 만난 갑작스러운 산사태로 인해 기절한 당신.
눈을 떠보니 알 수 없는 동굴에 갇혀있다.
뼛속까지 스며드는 한기와 멀리서 들려오는 정체불명의 울음 소리.
"그런데… 도대체 너희는 이 곳을 어떻게 들어 온 거야, 퓨?"', 60, 's3.jpg');

INSERT INTO Theme (cid, tName, tCategory, tLevel, tNum, tDef, tTime, tImage) 
VALUES (2, '기억상실', '추리  ', 4, 7, '"삭제된 기억, 알 수 없는 메시지로 둘러싸인 낯선 공간“

정신을 차리고 눈을 떴다.
알 수 없는 장소에, 알 수 없는 메시지가 가득하다.
여긴 도대체 어디란 말인가?
정확히 설명할 순 없지만 무언가 엄청난 일들이 벌어지는 중이라는 걸
직감할 수 있다.
내가 누구이고 무슨 일이 벌어지고 있는지 지금부터 파헤쳐 보자.', 60, '기억상실.jpg');

INSERT INTO Theme (cid, tName, tCategory, tLevel, tNum, tDef, tTime, tImage) 
VALUES (2, '충무공 이순신', '액션  ', 4, 7, '"국내 방탈출 카페 최초 한국 해전 테마“

​1592년 임진왜란 충무공 이순신
 
"이번 해전은 가장 힘든 전투가 될 것이다.
 
이순신 장군의 수하 장수가 되어 직접 전쟁에 참여하라.
 
거북선에 승선하여 꼭 승리하라"', 60, '이순신.jpg');

INSERT INTO Theme (cid, tName, tCategory, tLevel, tNum, tDef, tTime, tImage) 
VALUES (3, '도둑들', '잠입', 3, 7, '"거절하기 어려운 유혹, 당신의 선택은?"

당신은 이쪽 바닥에서 꽤나 유명한 은행털이범.
출소 후 세계 최고의 해커 ''모리스로부터'' 솔깃한 제안을 받는다.
최고의 디자이너 마추가 제작한 한정판 금괴가 한국은행 본사에
숨겨져 있는데 이를 꺼내다 주면 100만 달러를 주겠다는 것.
더구나 내부조력자도 보장받았다.
 
어떤가? 도전해 보겠는가? ', 60, 'thema_2.jpg');

INSERT INTO Theme (cid, tName, tCategory, tLevel, tNum, tDef, tTime, tImage) 
VALUES (3, '미스터리 거울의 방 -15세 이상-', '공포', 5, 7, '​"마지막 공포 테마의 퍼즐이 완성됐다“
 
친구들과 함께 등산을 하던 중 갑자기 내려진 폭우!
날씨는 어두워지고 멀리서 보이는 한줄기 빛!
그 빛 줄기를 따라가니 작은 폐허가 한 채 있다.

“그래 여기서 비를 피하자"
"그런데 이 음산한 분위기는 뭐지?"
사방이 거울로 둘러싸인 이 곳에서 당신은 살아남을 수 있는가?', 60, '거울의방.jpg');

INSERT INTO Theme (cid, tName, tCategory, tLevel, tNum, tDef, tTime, tImage) 
VALUES (3, '꼬레아 우라!', '잠입', 5, 7, '​꼬레아 우라!', 60, '꼬레아 우라.jpg');

INSERT INTO Theme (cid, tName, tCategory, tLevel, tNum, tDef, tTime, tImage) 
VALUES (3, '납치(2인전용)', '공포', 4, 7, '​"우린 무사히 살아남을 수 있을까?“

깨어보니 철창을 사이에 두​​고 나와 여자친구가 갇혀 있다.
여자친구와 커피를 마신 것까지 기억난다.
외진 곳이었지만 꽤 분위기가 좋은 카페였고, 느긋이 커피를 마시며
다음 행선지를 상의하려 했다. 

그런데 우리가 왜 여기에……
주변을 둘러보니 음산한 기운이 느껴진다.
위험한 상황에 놓였다는 것이 감지된다. 
 
정신 차리자! 탈출할 방법이 있을 것이다.', 60, '납치.jpg');

INSERT INTO Theme (cid, tName, tCategory, tLevel, tNum, tDef, tTime, tImage) 
VALUES (3, '미치광이 과학자 연쇄살인범', '스릴러', 5, 7, '"번듯한 연구소, 그리고 그 뒤에 숨겨진 충격적 이야기“

 “저와 친구들은 그저 많은 돈을 준다기에 임상실험 아르바이트에
지원했던 것 뿐이었어요. 그런데….”
 겨우 저만 빠져 나왔지만 다시는 기억하고 싶지 않아요. 헉헉헉….”
 
 "무섭고 힘들겠지만 남은 친구들이 꼭 살아 돌아왔으면 좋겠어요.”', 60, '미치광이 과학자 연쇄살인범.jpg');
 
 INSERT INTO Theme (cid, tName, tCategory, tLevel, tNum, tDef, tTime, tImage) 
VALUES (3, '저주받은 산장', '공포', 3, 7, '"우리 산장에 놀러 오세요"​ 

“풍경, 객실 뭐하나 나무랄 데 없어. 쿠폰 적용했더니 만원이야.
일단 지른다. 환불 안되니까 무조건 가는 거다.”

시작은 좋았다. ​서류 제출기한은 일주일 여유가 생겼고,
날씨도 화창 했다.
웬일인지 도로도 뻥 뚫렸다.
‘슬슬 여행 기분 나네’ 하던 게 불과 1시간 전이다.
숙소에 도착..그런데 이 음산한 분위기는 도대체 뭐란 말인가? ', 60, '저주받은산장.jpg');


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

INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (7, 1, 23000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (7, 2, 45000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (7, 3, 60000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (7, 4, 72000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (7, 5, 90000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (7, 6, 105000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (7, 7, 120000);

INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (8, 1, 23000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (8, 2, 45000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (8, 3, 60000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (8, 4, 72000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (8, 5, 90000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (8, 6, 105000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (8, 7, 120000);

INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (9, 1, 23000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (9, 2, 45000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (9, 3, 60000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (9, 4, 72000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (9, 5, 90000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (9, 6, 105000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (9, 7, 120000);

INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (10, 1, 23000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (10, 2, 45000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (10, 3, 60000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (10, 4, 72000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (10, 5, 90000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (10, 6, 105000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (10, 7, 120000);

INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (11, 1, 23000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (11, 2, 45000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (11, 3, 60000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (11, 4, 72000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (11, 5, 90000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (11, 6, 105000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (11, 7, 120000);

INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (12, 1, 23000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (12, 2, 45000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (12, 3, 60000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (12, 4, 72000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (12, 5, 90000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (12, 6, 105000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (12, 7, 120000);

INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (13, 1, 23000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (13, 2, 45000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (13, 3, 60000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (13, 4, 72000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (13, 5, 90000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (13, 6, 105000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (13, 7, 120000);

INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (14, 1, 23000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (14, 2, 45000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (14, 3, 60000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (14, 4, 72000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (14, 5, 90000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (14, 6, 105000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (14, 7, 120000);

INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (15, 1, 23000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (15, 2, 45000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (15, 3, 60000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (15, 4, 72000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (15, 5, 90000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (15, 6, 105000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (15, 7, 120000);

INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (16, 1, 23000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (16, 2, 45000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (16, 3, 60000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (16, 4, 72000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (16, 5, 90000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (16, 6, 105000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (16, 7, 120000);

INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (17, 1, 23000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (17, 2, 45000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (17, 3, 60000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (17, 4, 72000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (17, 5, 90000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (17, 6, 105000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (17, 7, 120000);

INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (18, 1, 23000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (18, 2, 45000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (18, 3, 60000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (18, 4, 72000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (18, 5, 90000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (18, 6, 105000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (18, 7, 120000);

INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (19, 1, 23000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (19, 2, 45000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (19, 3, 60000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (19, 4, 72000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (19, 5, 90000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (19, 6, 105000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (19, 7, 120000);

INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (20, 1, 23000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (20, 2, 45000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (20, 3, 60000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (20, 4, 72000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (20, 5, 90000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (20, 6, 105000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (20, 7, 120000);

INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (21, 1, 23000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (21, 2, 45000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (21, 3, 60000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (21, 4, 72000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (21, 5, 90000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (21, 6, 105000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (21, 7, 120000);

INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (22, 1, 23000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (22, 2, 45000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (22, 3, 60000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (22, 4, 72000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (22, 5, 90000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (22, 6, 105000);
INSERT INTO ThemePrice (tid, tpNum, tPrice) VALUES (22, 7, 120000);

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

INSERT INTO ThemeReservationTime (tid, trTime) VALUES (7, '11:00 AM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (7, '12:15 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (7, '01:25 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (7, '02:40 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (7, '03:55 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (7, '05:10 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (7, '06:25 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (7, '07:40 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (7, '08:55 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (7, '10:10 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (7, '11:25 PM');

INSERT INTO ThemeReservationTime (tid, trTime) VALUES (8, '10:20 AM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (8, '11:55 AM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (8, '01:30 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (8, '03:05 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (8, '04:40 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (8, '06:15 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (8, '07:50 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (8, '09:25 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (8, '11:00 PM');

INSERT INTO ThemeReservationTime (tid, trTime) VALUES (9, '10:20 AM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (9, '11:55 AM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (9, '01:30 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (9, '03:05 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (9, '04:40 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (9, '06:15 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (9, '07:50 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (9, '09:25 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (9, '11:00 PM');

INSERT INTO ThemeReservationTime (tid, trTime) VALUES (10, '10:20 AM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (10, '11:55 AM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (10, '01:30 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (10, '03:05 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (10, '04:40 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (10, '06:15 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (10, '07:50 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (10, '09:25 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (10, '11:00 PM');

INSERT INTO ThemeReservationTime (tid, trTime) VALUES (11, '10:20 AM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (11, '11:55 AM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (11, '01:30 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (11, '03:05 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (11, '04:40 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (11, '06:15 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (11, '07:50 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (11, '09:25 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (11, '11:00 PM');

INSERT INTO ThemeReservationTime (tid, trTime) VALUES (12, '10:20 AM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (12, '11:55 AM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (12, '01:30 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (12, '03:05 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (12, '04:40 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (12, '06:15 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (12, '07:50 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (12, '09:25 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (12, '11:00 PM');

INSERT INTO ThemeReservationTime (tid, trTime) VALUES (13, '10:20 AM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (13, '11:55 AM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (13, '01:30 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (13, '03:05 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (13, '04:40 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (13, '06:15 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (13, '07:50 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (13, '09:25 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (13, '11:00 PM');

INSERT INTO ThemeReservationTime (tid, trTime) VALUES (14, '10:20 AM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (14, '11:55 AM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (14, '01:30 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (14, '03:05 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (14, '04:40 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (14, '06:15 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (14, '07:50 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (14, '09:25 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (14, '11:00 PM');

INSERT INTO ThemeReservationTime (tid, trTime) VALUES (15, '10:20 AM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (15, '11:55 AM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (15, '01:30 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (15, '03:05 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (15, '04:40 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (15, '06:15 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (15, '07:50 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (15, '09:25 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (15, '11:00 PM');

INSERT INTO ThemeReservationTime (tid, trTime) VALUES (16, '10:20 AM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (16, '11:55 AM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (16, '01:30 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (16, '03:05 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (16, '04:40 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (16, '06:15 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (16, '07:50 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (16, '09:25 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (16, '11:00 PM');

INSERT INTO ThemeReservationTime (tid, trTime) VALUES (17, '10:20 AM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (17, '11:55 AM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (17, '01:30 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (17, '03:05 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (17, '04:40 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (17, '06:15 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (17, '07:50 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (17, '09:25 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (17, '11:00 PM');

INSERT INTO ThemeReservationTime (tid, trTime) VALUES (18, '10:20 AM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (18, '11:55 AM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (18, '01:30 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (18, '03:05 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (18, '04:40 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (18, '06:15 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (18, '07:50 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (18, '09:25 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (18, '11:00 PM');

INSERT INTO ThemeReservationTime (tid, trTime) VALUES (19, '10:20 AM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (19, '11:55 AM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (19, '01:30 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (19, '03:05 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (19, '04:40 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (19, '06:15 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (19, '07:50 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (19, '09:25 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (19, '11:00 PM');

INSERT INTO ThemeReservationTime (tid, trTime) VALUES (20, '10:20 AM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (20, '11:55 AM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (20, '01:30 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (20, '03:05 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (20, '04:40 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (20, '06:15 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (20, '07:50 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (20, '09:25 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (20, '11:00 PM');

INSERT INTO ThemeReservationTime (tid, trTime) VALUES (21, '10:20 AM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (21, '11:55 AM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (21, '01:30 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (21, '03:05 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (21, '04:40 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (21, '06:15 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (21, '07:50 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (21, '09:25 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (21, '11:00 PM');

INSERT INTO ThemeReservationTime (tid, trTime) VALUES (22, '10:20 AM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (22, '11:55 AM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (22, '01:30 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (22, '03:05 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (22, '04:40 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (22, '06:15 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (22, '07:50 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (22, '09:25 PM');
INSERT INTO ThemeReservationTime (tid, trTime) VALUES (22, '11:00 PM');