<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko" dir="ltr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<link rel="shortcut icon" href="<c:url value='/exiter.ico'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/common/initial.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/common/default.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/common/header.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/common/footer.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/search/search.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/common/common.js'/>"></script>
<title>search</title>
</head>
<body>
  <!-- 헤더 -->
    <jsp:include page="../common/header.jsp"></jsp:include>

	<!-- 메인 -->
  <div class="subtitle" style="display:flex;">
    <div class="container ta-c one">
      <form class="formtag" action="index.html" method="post">
        <h1 class="ff-bhs"><a href="#" class="first" onclick="theme()">테마</a></h1>
      </form>
    </div>

    <div class="container ta-c two">
      <form class="formtag" action="index.html" method="post">
        <h1 class="ff-bhs"><a href="#" class="second" onclick="area()">지역/장르</a></h1>
        </div>
        <div class="areacontainer" id="areawrap" style="display: none;">
          <div class="holdbtn">
            <a href="#" class="btnbox">전국</a>
          </div>
          <div class="holdbtn">
            <a href="#" class="btnbox">서울</a>
          </div>
          <div class="holdbtn">
            <a href="#" class="btnbox">강원도</a>
          </div>
          <div class="holdbtn">
            <a href="#" class="btnbox">경상도</a>
          </div>
          <div class="holdbtn">
            <a href="#" class="btnbox">거제도</a>
          </div>
          <div class="holdbtn">
            <a href="#" class="btnbox">전라도</a>
          </div>
          <div class="holdbtn">
            <a href="#" class="btnbox">제주도</a>
          </div>
          <div class="holdbtn">
            <a href="#" class="btnbox">마라도</a>
            <!-- <input type="radio" name="local" checked><span>서울</span> -->
          </div>
        </div>
        </form>
    </div>


  <br id="list"/>
  <div class="container active3" id="themewrap">
    <form class="searchBar" action="index.html" method="post">
        <input type="text" placeholder="테마검색" class="searchBarInput" maxlength="12">
        <img src="<c:url value='/resources/images/icon/search_FILL0_wght400_GRAD0_opsz48.png'/>" alt="" class="searchImg">
    </form>
    <br/>

    <section class="theme-item clear-b" >
      <figure class="eveThemeThumb">
        <img src="<c:url value='/resources/images/theme/img2.png'/>" alt="미스터리">
      </figure>
      <div class="eveThemeInfo">
        <h2 class="pax3">
          <span class="at1">#홍대어드벤처점</span>
          <span class="ff-bhs">미스터리</span>
        </h2>
        <table class="pax3">
          <tr>
            <th>장르</th>
            <td>미스터리</td>
          </tr>
          <tr>
            <th>인원</th>
            <td>2~6</td>
          </tr>
          <tr>
            <th>시간</th>
            <td>85분</td>
          </tr>
          <tr>
            <th>공포</th>
            <td>2</td>
          </tr>
          <tr>
            <th>난이도</th>
            <td>4</td>
          </tr>
        </table>
        <p class="pax3">
          오늘 하루, 당신께 잊지 못할 추억을 선물해 드리겠습니다.<br />
          - 미스터리 트래블
        </p>
        <br />
        <div class="btn1 theme-item-btn pax3">
          <a class="ff-bhs" href="#"> <span>예약하기</span> <em></em></a>
        </div>
      </div>
    </section>
    <section class="theme-item clear-b">
      <figure class="eveThemeThumb">
        <img src="<c:url value='/resources/images/theme/img4.png'/>" alt="퀘스트 : 여정의 시작">
      </figure>
      <div class="eveThemeInfo">
        <h2 class="pax3">
          <span class="at1">#홍대어드벤처점</span>
          <span class="ff-bhs">퀘스트 : 여정의 시작</span>
        </h2>
        <table class="pax3">
          <tr>
            <th>장르</th>
            <td>판타지</td>
          </tr>
          <tr>
            <th>인원</th>
            <td>2~3</td>
          </tr>
          <tr>
            <th>시간</th>
            <td>40분</td>
          </tr>
          <tr>
            <th>난이도</th>
            <td>3</td>
          </tr>
        </table>
        <p class="pax3">
          퀘스트를 수락하시겠습니까?<br />
          <br />
          * 지구별 어드벤처 입문 테마로 추천드립니다.
        </p>
        <br />
        <div class="btn1 theme-item-btn pax3">
          <a class="ff-bhs" href="#"> <span>예약하기</span> <em></em></a>
        </div>
      </div>
    </section>
    <section class="theme-item clear-b">
      <figure class="eveThemeThumb">
        <img src="<c:url value='/resources/images/theme/img.jpg'/>" alt="사명 : 투쟁의 노래">
      </figure>
      <div class="eveThemeInfo">
        <h2 class="pax3">
          <span class="at1">#대구점</span>
          <span class="ff-bhs">사명 : 투쟁의 노래</span>
        </h2>
        <table class="pax3">
          <tr>
            <th>장르</th>
            <td>탈옥</td>
          </tr>
          <tr>
            <th>인원</th>
            <td>2~6</td>
          </tr>
          <tr>
            <th>시간</th>
            <td>69분</td>
          </tr>
          <tr>
            <th>난이도</th>
            <td>4</td>
          </tr>
        </table>
        <p class="pax3">
          그날의 모든 것은 우리의 선택이었다.<br />
          처절하게 울려 퍼졌던 투쟁의 노래.<br />
          <br />
          -------------------------------------------<br />
          사명은 분리 테마입니다.<br />
          관찰력이 중요한 간수팀과 활동성이 높은 죄수팀으로 나눠집니다.<br />
          협력과 소통이 중요합니다.
        </p>
        <br />
        <div class="btn1 theme-item-btn pax3">
          <a class="ff-bhs" href="#"> <span>예약하기</span> <em></em></a>
        </div>
      </div>
    </section>
    <section class="theme-item clear-b">
      <figure class="eveThemeThumb">
        <img src="<c:url value='/resources/images/theme/img6.jpg'/>" alt="펭귄키우기">
      </figure>
      <div class="eveThemeInfo">
        <h2 class="pax3">
          <span class="at1">#대구점</span>
          <span class="ff-bhs">펭귄키우기</span>
        </h2>
        <table class="pax3">
          <tr>
            <th>장르</th>
            <td>문제방</td>
          </tr>
          <tr>
            <th>인원</th>
            <td>2~4명</td>
          </tr>
          <tr>
            <th>시간</th>
            <td>60분</td>
          </tr>
          <tr>
            <th>난이도</th>
            <td>5</td>
          </tr>
        </table>
        <p class="pax3">
          남극 대륙의 지독한 한파 속에서 태어난 작은 펭귄.<br />
          당신의 능력과 선택에 따라 달라지는 145개의 결말.<br />
          <br />
          나는 어떤 펭귄이 될까?<br />
          <br />
          ※ 문제가 매우 어렵고 아주 많은 문제방입니다.<br />
          ※ 이지/하드 중 모드 선택이 가능하며, 하드모드는 100방 이상 매니아들에게 권장합니다
        </p>
        <br />
        <div class="btn1 theme-item-btn pax3">
          <a class="ff-bhs" href="#"> <span>예약하기</span> <em></em></a>
        </div>
      </div>
    </section>
    <section class="theme-item clear-b">
      <figure class="eveThemeThumb">
        <img src="<c:url value='/resources/images/theme/img3.jpg'/>" alt="우리 아빠">
      </figure>
      <div class="eveThemeInfo">
        <h2 class="pax3">
          <span class="at1">#대구점</span>
          <span class="ff-bhs">우리 아빠</span>
        </h2>
        <table class="pax3">
          <tr>
            <th>장르</th>
            <td>공포</td>
          </tr>
          <tr>
            <th>인원</th>
            <td>2인~6인</td>
          </tr>
          <tr>
            <th>시간</th>
            <td>70분</td>
          </tr>
          <tr>
            <th>공포</th>
            <td>3</td>
          </tr>
          <tr>
            <th>난이도</th>
            <td>3</td>
          </tr>
        </table>
        <p class="pax3">
          어느 날 아빠가 나에게 물었다.<br />
          내 딸, 기분이 어떠니?<br />
          <br />
          나는 대답했다.<br />
          너무 행복해요 아빠<br />
          <br />
          (이 테마는 자극적이고 불편한 요소가 포함되어 있습니다)
        </p>
        <br />
        <div class="btn1 theme-item-btn pax3">
          <a class="ff-bhs" href="#"> <span>예약하기</span> <em></em></a>
        </div>
      </div>
    </section>
    
    <section class="theme-item clear-b">
      <figure class="eveThemeThumb">
        <img src="<c:url value='/resources/images/theme/img7.jpg'/>" alt="너의 겨울은 가고, 봄은 온다">
      </figure>
      <div class="eveThemeInfo">
        <h2 class="pax3">
          <span class="at1">#대구점</span>
          <span class="ff-bhs">너의 겨울은 가고, 봄은 온다</span>
        </h2>
        <table class="pax3">
          <tr>
            <th>장르</th>
            <td>감성</td>
          </tr>
          <tr>
            <th>인원</th>
            <td>2명~6명</td>
          </tr>
          <tr>
            <th>시간</th>
            <td>60분</td>
          </tr>
          <tr>
            <th>난이도</th>
            <td>2</td>
          </tr>
        </table>
        <p class="pax3">
          내 이름은 인카. 핀란드 산타마을 로바니에미의 산타클로스다.<br />
          올해 선물 배달의 주인공을 배정받았는데, 바로 마을 최악의<br />
          장난꾸러기 여자아이 안나. 매년 산타클로스가 오는 날이면<br />
          굉장히 짓궂은 장난을 벌이며, 산타가 선물을 쉽게 배달할 수 없게<br />
          집에 다양한 문제들을 만들어두는걸로 유명하다.<br />
          나는 무려 52년간 단 한번도 배달을 실패한 적 없는 초특급 베테랑.<br />
          한낱 9살 꼬마의 장난 따위에 실패할 내가 아니지!<br />
          썰매 빼와라 루돌프. 휘바휘바~!
        </p>
        <br />
        <div class="btn1 theme-item-btn pax3">
          <a class="ff-bhs" href="#"> <span>예약하기</span> <em></em></a>
        </div>
      </div>
    </section>
    
    <section class="theme-item clear-b">
      <figure class="eveThemeThumb">
        <img src="<c:url value='/resources/images/theme/img5.jpg'/>" alt="만월 &lt;&lt;꿈을 훔치는 요괴&gt;&gt;">
      </figure>
      <div class="eveThemeInfo">
        <h2 class="pax3">
          <span class="at1">#대구점</span>
          <span class="ff-bhs">만월 &lt;&lt;꿈을 훔치는 요괴&gt;&gt;</span>
        </h2>
        <table class="pax3">
          <tr>
            <th>장르</th>
            <td>잠입, 미스터리</td>
          </tr>
          <tr>
            <th>인원</th>
            <td>2명~6명</td>
          </tr>
          <tr>
            <th>시간</th>
            <td>75분</td>
          </tr>
          <tr>
            <th>공포</th>
            <td>1</td>
          </tr>
          <tr>
            <th>난이도</th>
            <td>4</td>
          </tr>
        </table>
        <p class="pax3">
          베트남 꽝남성 호이안 외곽의 작은 마을 빈디엔.<br />
          이 작은 마을엔 보름달이 뜨는 밤, 꿈을 훔치는 요괴가 나타난다는 전설이 있다.<br />
          <br />
          꿈도둑으로 취업한 신입 요괴 '뉴엉'의 첫 업무는 빈디엔에서 꿈을 훔쳐오는 것.<br />
          자, 업무 시작이다!
        </p>
        <br />
        <div class="btn1 theme-item-btn pax3">
          <a class="ff-bhs" href="#"> <span>예약하기</span> <em></em></a>
        </div>
      </div>
    </section>
    
    <section class="theme-item clear-b">
      <figure class="eveThemeThumb">
        <img src="<c:url value='/resources/images/theme/img8.jpg'/>" alt="단디해라">
      </figure>
      <div class="eveThemeInfo" style="margin-bottom: 75px;">
        <h2 class="pax3">
          <span class="at1">#대구점</span>
          <span class="ff-bhs">단디해라</span>
        </h2>
        <table class="pax3">
          <tr>
            <th>장르</th>
            <td>코믹</td>
          </tr>
          <tr>
            <th>인원</th>
            <td>2명~6명</td>
          </tr>
          <tr>
            <th>시간</th>
            <td>65분</td>
          </tr>
          <tr>
            <th>난이도</th>
            <td>3</td>
          </tr>
        </table>
        <p class="pax3">
          멸종 위기의 지구별. 드디어 우리는 인간이 살 수 있는 외계행성을 발견했다.<br />
          <br />
          새로운 세계에 대한 갈망으로 폭주한 지원경쟁을 뚫고, 혹독한 행성 환경을 탐사하기 위한 최종 선발대 트레이닝 과정에 입소한 당신.<br />
          <br />
          당신은 인류의 위대한 영웅이 될 자격이 있는가?
        </p>
        <br />
        <div class="btn1 theme-item-btn pax3">
          <a class="ff-bhs" href="#"> <span>예약하기</span> <em></em></a>
        </div>
      </div>
    </section>
  </div>


   <!-- 푸터 -->
    <jsp:include page="../common/footer.jsp"></jsp:include>
    
</body>
</html>