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
<link rel="stylesheet" href="<c:url value='/resources/css/reser/reser.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/common/common.js'/>"></script>
<title>reservation</title>
</head>
<body>
  <!-- 헤더 -->
    <jsp:include page="../common/header.jsp"></jsp:include>

  <article class="wrap" id="wrap">

      <div class="subtitle">
      </div>

      <br id="list" />
      <div class="container">
        <br />

        <section class="res-item clear-b" style="border: none;">
          <figure class="pax3">
            <img src="<c:url value='/resources/images/theme/img.jpg'/>" alt="사명 : 투쟁의 노래">
          </figure>
          <div class="eve-mopa">
            <h2 class="ff-bhs pax3">사명 : 투쟁의 노래</h2>

            <table class="ff-bhs pax3">
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

            <br />
            <ul class="res-times kit">
              <li class="pax3">
                <div class="res-times-btn">
                  <button type="button">
                    <label>예약가능</label>
                    <span class="ff-bhs">10:00</span>
                    <em></em>
                  </button>
                </div>
              </li>
              <li class="pax3">
                <div class="res-times-btn">
                  <button type="button">
                    <label>예약가능</label>
                    <span class="ff-bhs">11:30</span>
                    <em></em>
                  </button>
                </div>
              </li>
              <li class="pax3">
                <div class="res-times-btn">
                  <button type="button">
                    <label>예약가능</label>
                    <span class="ff-bhs">13:00</span>
                    <em></em>
                  </button>
                </div>
              </li>
              <li class="pax3">
                <div class="res-times-btn">
                  <button type="button">
                    <label>예약가능</label>
                    <span class="ff-bhs">14:30</span>
                    <em></em>
                  </button>
                </div>
              </li>
              <li class="pax3">
                <div class="res-times-btn">
                  <button type="button">
                    <label>예약가능</label>
                    <span class="ff-bhs">16:00</span>
                    <em></em>
                  </button>
                </div>
              </li>
              <li class="pax3">
                <div class="res-times-btn">
                  <button type="button">
                    <label>예약가능</label>
                    <span class="ff-bhs">17:30</span>
                    <em></em>
                  </button>
                </div>
              </li>
              <li class="pax3">
                <div class="res-times-btn">
                  <button type="button">
                    <label>예약가능</label>
                    <span class="ff-bhs">19:00</span>
                    <em></em>
                  </button>
                </div>
              </li>
              <li class="pax3">
                <div class="res-times-btn">
                  <button type="button">
                    <label>예약가능</label>
                    <span class="ff-bhs">20:30</span>
                    <em></em>
                  </button>
                </div>
              </li>
              <li class="pax3">
                <div class="res-times-btn">
                  <button type="button">
                    <label>예약가능</label>
                    <span class="ff-bhs">22:00</span>
                    <em></em>
                  </button>
                </div>
              </li>
            </ul>

          </div>
        </section>
        <section class="res-item clear-b">
          <figure class="pax3">
            <img src="<c:url value='/resources/images/theme/img6.jpg'/>" alt="펭귄키우기">
          </figure>
          <div class="eve-mopa">
            <h2 class="ff-bhs pax3">펭귄키우기</h2>

            <table class="ff-bhs pax3">
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

            <br />
            <ul class="res-times kit">
              <li class="pax3">
                <div class="res-times-btn">
                  <button class="active1 eveReservationButton" type="button">
                    <label>예약가능</label>
                    <span class="ff-bhs">10:40</span>
                    <em></em>
                    <div class="d-n eveHiddenData"></div>
                  </button>
                </div>
              </li>
              <li class="pax3">
                <div class="res-times-btn">
                  <button class="active1 eveReservationButton" type="button">
                    <label>예약가능</label>
                    <span class="ff-bhs">12:00</span>
                    <em></em>
                    <div class="d-n eveHiddenData"></div>
                  </button>
                </div>
              </li>
              <li class="pax3">
                <div class="res-times-btn">
                  <button class="active1 eveReservationButton" type="button">
                    <label>예약가능</label>
                    <span class="ff-bhs">13:20</span>
                    <em></em>
                    <div class="d-n eveHiddenData"></div>
                  </button>
                </div>
              </li>
              <li class="pax3">
                <div class="res-times-btn">
                  <button class="active1 eveReservationButton" type="button">
                    <label>예약가능</label>
                    <span class="ff-bhs">14:40</span>
                    <em></em>
                    <div class="d-n eveHiddenData"></div>
                  </button>
                </div>
              </li>
              <li class="pax3">
                <div class="res-times-btn">
                  <button class="active1 eveReservationButton" type="button">
                    <label>예약가능</label>
                    <span class="ff-bhs">16:00</span>
                    <em></em>
                    <div class="d-n eveHiddenData"></div>
                  </button>
                </div>
              </li>
              <li class="pax3">
                <div class="res-times-btn">
                  <button class="active1 eveReservationButton" type="button">
                    <label>예약가능</label>
                    <span class="ff-bhs">17:20</span>
                    <em></em>
                    <div class="d-n eveHiddenData"></div>
                  </button>
                </div>
              </li>
              <li class="pax3">
                <div class="res-times-btn">
                  <button class="active1 eveReservationButton" type="button">
                    <label>예약가능</label>
                    <span class="ff-bhs">18:40</span>
                    <em></em>
                    <div class="d-n eveHiddenData"></div>
                  </button>
                </div>
              </li>
              <li class="pax3">
                <div class="res-times-btn">
                  <button class="active1 eveReservationButton" type="button">
                    <label>예약가능</label>
                    <span class="ff-bhs">20:00</span>
                    <em></em>
                    <div class="d-n eveHiddenData"></div>
                  </button>
                </div>
              </li>
              <li class="pax3">
                <div class="res-times-btn">
                  <button class="active1 eveReservationButton" type="button">
                    <label>예약가능</label>
                    <span class="ff-bhs">21:20</span>
                    <em></em>
                    <div class="d-n eveHiddenData"></div>
                  </button>
                </div>
              </li>
              <li class="pax3">
                <div class="res-times-btn">
                  <button class="active1 eveReservationButton" type="button">
                    <label>예약가능</label>
                    <span class="ff-bhs">22:40</span>
                    <em></em>
                    <div class="d-n eveHiddenData"></div>
                  </button>
                </div>
              </li>
            </ul>

          </div>
        </section>
        <section class="res-item clear-b">
          <figure class="pax3">
            <img src="<c:url value='/resources/images/theme/img3.jpg'/>" alt="우리 아빠">
          </figure>
          <div class="eve-mopa">
            <h2 class="ff-bhs pax3">우리 아빠</h2>

            <table class="ff-bhs pax3">
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

            <br />
            <ul class="res-times kit">
              <li class="pax3">
                <div class="res-times-btn">
                  <button type="button">
                    <label>예약가능</label>
                    <span class="ff-bhs">10:20</span>
                    <em></em>
                  </button>
                </div>
              </li>
              <li class="pax3">
                <div class="res-times-btn">
                  <button type="button">
                    <label>예약가능</label>
                    <span class="ff-bhs">11:55</span>
                    <em></em>
                  </button>
                </div>
              </li>
              <li class="pax3">
                <div class="res-times-btn">
                  <button type="button">
                    <label>예약가능</label>
                    <span class="ff-bhs">13:30</span>
                    <em></em>
                  </button>
                </div>
              </li>
              <li class="pax3">
                <div class="res-times-btn">
                  <button type="button">
                    <label>예약가능</label>
                    <span class="ff-bhs">15:05</span>
                    <em></em>
                  </button>
                </div>
              </li>
              <li class="pax3">
                <div class="res-times-btn">
                  <button type="button">
                    <label>예약가능</label>
                    <span class="ff-bhs">16:40</span>
                    <em></em>
                  </button>
                </div>
              </li>
              <li class="pax3">
                <div class="res-times-btn">
                  <button type="button">
                    <label>예약가능</label>
                    <span class="ff-bhs">18:15</span>
                    <em></em>
                  </button>
                </div>
              </li>
              <li class="pax3">
                <div class="res-times-btn">
                  <button type="button">
                    <label>예약가능</label>
                    <span class="ff-bhs">19:50</span>
                    <em></em>
                  </button>
                </div>
              </li>
              <li class="pax3">
                <div class="res-times-btn">
                  <button type="button">
                    <label>예약가능</label>
                    <span class="ff-bhs">21:25</span>
                    <em></em>
                  </button>
                </div>
              </li>
              <li class="pax3">
                <div class="res-times-btn">
                  <button type="button">
                    <label>예약가능</label>
                    <span class="ff-bhs">23:00</span>
                    <em></em>
                  </button>
                </div>
              </li>
            </ul>

          </div>
        </section>
        <section class="res-item clear-b">
          <figure class="pax3">
            <img src="<c:url value='/resources/images/theme/img7.jpg'/>" alt="너의 겨울은 가고, 봄은 온다">
          </figure>
          <div class="eve-mopa">
            <h2 class="ff-bhs pax3">너의 겨울은 가고, 봄은 온다</h2>

            <table class="ff-bhs pax3">
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

            <br />
            <ul class="res-times kit">
              <li class="pax3">
                <div class="res-times-btn">
                  <button class="active1 eveReservationButton" type="button">
                    <label>예약가능</label>
                    <span class="ff-bhs">10:30</span>
                    <em></em>
                    <div class="d-n eveHiddenData"></div>
                  </button>
                </div>
              </li>
              <li class="pax3">
                <div class="res-times-btn">
                  <button type="button">
                    <label>예약가능</label>
                    <span class="ff-bhs">11:50</span>
                    <em></em>
                  </button>
                </div>
              </li>
              <li class="pax3">
                <div class="res-times-btn">
                  <button class="active1 eveReservationButton" type="button">
                    <label>예약가능</label>
                    <span class="ff-bhs">13:10</span>
                    <em></em>
                    <div class="d-n eveHiddenData"></div>
                  </button>
                </div>
              </li>
              <li class="pax3">
                <div class="res-times-btn">
                  <button type="button">
                    <label>예약가능</label>
                    <span class="ff-bhs">14:30</span>
                    <em></em>
                  </button>
                </div>
              </li>
              <li class="pax3">
                <div class="res-times-btn">
                  <button type="button">
                    <label>예약가능</label>
                    <span class="ff-bhs">15:50</span>
                    <em></em>
                  </button>
                </div>
              </li>
              <li class="pax3">
                <div class="res-times-btn">
                  <button type="button">
                    <label>예약가능</label>
                    <span class="ff-bhs">17:10</span>
                    <em></em>
                  </button>
                </div>
              </li>
              <li class="pax3">
                <div class="res-times-btn">
                  <button type="button">
                    <label>예약가능</label>
                    <span class="ff-bhs">18:30</span>
                    <em></em>
                  </button>
                </div>
              </li>
              <li class="pax3">
                <div class="res-times-btn">
                  <button type="button">
                    <label>예약가능</label>
                    <span class="ff-bhs">19:50</span>
                    <em></em>
                  </button>
                </div>
              </li>
              <li class="pax3">
                <div class="res-times-btn">
                  <button type="button">
                    <label>예약가능</label>
                    <span class="ff-bhs">21:10</span>
                    <em></em>
                  </button>
                </div>
              </li>
              <li class="pax3">
                <div class="res-times-btn">
                  <button class="active1 eveReservationButton" type="button">
                    <label>예약가능</label>
                    <span class="ff-bhs">22:30</span>
                    <em></em>
                    <div class="d-n eveHiddenData"></div>
                  </button>
                </div>
              </li>
            </ul>

          </div>
        </section>
        <section class="res-item clear-b">
          <figure class="pax3">
            <img src="<c:url value='/resources/images/theme/img5.jpg'/>" alt="만월 &lt;&lt;꿈을 훔치는 요괴&gt;&gt;">
          </figure>
          <div class="eve-mopa">
            <h2 class="ff-bhs pax3">만월 꿈을 훔치는 요괴</h2>

            <table class="ff-bhs pax3">
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

            <br />
            <ul class="res-times kit">
              <li class="pax3">
                <div class="res-times-btn">
                  <button class="active1 eveReservationButton" type="button">
                    <label>예약가능</label>
                    <span class="ff-bhs">10:00</span>
                    <em></em>
                    <div class="d-n eveHiddenData"></div>
                  </button>
                </div>
              </li>
              <li class="pax3">
                <div class="res-times-btn">
                  <button class="active1 eveReservationButton" type="button">
                    <label>예약가능</label>
                    <span class="ff-bhs">11:35</span>
                    <em></em>
                    <div class="d-n eveHiddenData"></div>
                  </button>
                </div>
              </li>
              <li class="pax3">
                <div class="res-times-btn">
                  <button type="button">
                    <label>예약가능</label>
                    <span class="ff-bhs">13:10</span>
                    <em></em>
                  </button>
                </div>
              </li>
              <li class="pax3">
                <div class="res-times-btn">
                  <button type="button">
                    <label>예약가능</label>
                    <span class="ff-bhs">14:45</span>
                    <em></em>
                  </button>
                </div>
              </li>
              <li class="pax3">
                <div class="res-times-btn">
                  <button type="button">
                    <label>예약가능</label>
                    <span class="ff-bhs">16:20</span>
                    <em></em>
                  </button>
                </div>
              </li>
              <li class="pax3">
                <div class="res-times-btn">
                  <button type="button">
                    <label>예약가능</label>
                    <span class="ff-bhs">17:55</span>
                    <em></em>
                  </button>
                </div>
              </li>
              <li class="pax3">
                <div class="res-times-btn">
                  <button type="button">
                    <label>예약가능</label>
                    <span class="ff-bhs">19:30</span>
                    <em></em>
                  </button>
                </div>
              </li>
              <li class="pax3">
                <div class="res-times-btn">
                  <button type="button">
                    <label>예약가능</label>
                    <span class="ff-bhs">21:05</span>
                    <em></em>
                  </button>
                </div>
              </li>
              <li class="pax3">
                <div class="res-times-btn">
                  <button type="button">
                    <label>예약가능</label>
                    <span class="ff-bhs">22:40</span>
                    <em></em>
                  </button>
                </div>
              </li>
            </ul>

          </div>
        </section>
        <section class="res-item clear-b">
          <figure class="pax3">
            <img src="<c:url value='/resources/images/theme/img8.jpg'/>" alt="단디해라">
          </figure>
          <div class="eve-mopa">
            <h2 class="ff-bhs pax3">단디해라</h2>

            <table class="ff-bhs pax3">
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

            <br/>
            <ul class="res-times kit">
              <li class="pax3">
                <div class="res-times-btn">
                  <button type="button">
                    <label>예약가능</label>
                    <span class="ff-bhs">10:10</span>
                    <em></em>
                  </button>
                </div>
              </li>
              <li class="pax3">
                <div class="res-times-btn">
                  <button class="active1 eveReservationButton" type="button">
                    <label>예약가능</label>
                    <span class="ff-bhs">11:30</span>
                    <em></em>
                    <div class="d-n eveHiddenData"></div>
                  </button>
                </div>
              </li>
              <li class="pax3">
                <div class="res-times-btn">
                  <button type="button">
                    <label>예약가능</label>
                    <span class="ff-bhs">12:50</span>
                    <em></em>
                  </button>
                </div>
              </li>
              <li class="pax3">
                <div class="res-times-btn">
                  <button type="button">
                    <label>예약가능</label>
                    <span class="ff-bhs">14:10</span>
                    <em></em>
                  </button>
                </div>
              </li>
              <li class="pax3">
                <div class="res-times-btn">
                  <button type="button">
                    <label>예약가능</label>
                    <span class="ff-bhs">15:30</span>
                    <em></em>
                  </button>
                </div>
              </li>
              <li class="pax3">
                <div class="res-times-btn">
                  <button type="button">
                    <label>예약가능</label>
                    <span class="ff-bhs">16:50</span>
                    <em></em>
                  </button>
                </div>
              </li>
              <li class="pax3">
                <div class="res-times-btn">
                  <button class="active1 eveReservationButton" type="button">
                    <label>예약가능</label>
                    <span class="ff-bhs">18:10</span>
                    <em></em>
                    <div class="d-n eveHiddenData"></div>
                  </button>
                </div>
              </li>
              <li class="pax3">
                <div class="res-times-btn">
                  <button type="button">
                    <label>예약가능</label>
                    <span class="ff-bhs">19:30</span>
                    <em></em>
                  </button>
                </div>
              </li>
              <li class="pax3">
                <div class="res-times-btn">
                  <button type="button">
                    <label>예약가능</label>
                    <span class="ff-bhs">20:50</span>
                    <em></em>
                  </button>
                </div>
              </li>
              <li class="pax3">
                <div class="res-times-btn">
                  <button type="button">
                    <label>예약가능</label>
                    <span class="ff-bhs">22:10</span>
                    <em></em>
                  </button>
                </div>
              </li>
            </ul>

          </div>
        </section>

      </div>

      <br/>
      <br/>
      <br/>
    </div>

  </article>
  
     <!-- 푸터 -->
    <jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>