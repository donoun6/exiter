<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko" dir="ltr">

<head>
  <meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<link rel="shortcut icon" href="<c:url value='/exiter.ico'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/common/initial.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/common/default.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/common/header.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/common/copyright.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/company/company_signUp.css'/>">
  <script type="text/javascript" src="<c:url value='/resources/js/common/jquery.js'/>"></script>
  <title>Exiter Company main</title>
</head>

<body>
  <!-- header nav -->
  <jsp:include page="../common/company_header.jsp"></jsp:include>
  <!-- main -->
  <div id="wrap">
    <div class="title">
      <h2><a href="<c:url value='/company/company_login'/>">Exiter</a></h2>
    </div>
    <form:form modelAttribute="company" method="post">
      <table class="table">
        <tr>
          <td>
            <ul class="id">
              <li>
                <h2>아이디</h2>&nbsp<span id="checkComId" class="err">${err }${err0 }</span><br>
              </li>
              <li><form:input id="comId" path="comId" type="text" placeholder="5~20자의 영문 소문자,숫자와 사용가능합니다." minlength="5" maxlength="20" pattern="^[a-zA-Z0-9]+$"/></li>
            </ul>
          </td>
        </tr>
        <tr>
          <td>
            <ul>
              <li>
                <h2>비밀번호</h2>&nbsp<span class="err">${err1 }</span><br>
              </li>
              <form:input path="comPasswd" type="password" placeholder="8~16자의 영문 대 소문자,숫자를 사용하세요." minlength="8" maxlength="16" pattern="^[a-zA-Z0-9]+$"/>
            </ul>
          </td>
        </tr>
        <tr>
          <td>
            <ul>
              <li>
                <h2>전화번호</h2>&nbsp<span class="err">${err2 }</span><br>
              </li>
              <form:select path="comTel1" class="tel">
                <option value="02">02 </option>
                <option value="031">031 </option>
                <option value="032">032 </option>
                <option value="033">033 </option>
                <option value="041">041 </option>
                <option value="042">042 </option>
                <option value="043">043 </option>
                <option value="051">051 </option>
                <option value="052">052 </option>
                <option value="053">053 </option>
                <option value="054">054 </option>
                <option value="054">054 </option>
                <option value="055">055 </option>
                <option value="061">061 </option>
                <option value="062">062 </option>
                <option value="063">063 </option>
                <option value="064">064 </option>
              </form:select>
              <form:input path="comTel2" type="tel" class="small" minlength="3" maxlength="3"/>
              <form:input path="comTel3" type="tel" class="small" minlength="4" maxlength="4"/>
            </ul>
          </td>
        </tr>
        <tr>
          <td>
            <ul>
              <li>
                <h2>주소</h2>&nbsp<span class="err">${err3 }</span><br>
              </li>
              <form:input path="comAddress1" type="text" id="sample4_postcode" class="small" placeholder="우편번호"/>
              <form:input path="comAddress2" type="text" id="sample4_roadAddress" class="small" placeholder="도로명주소"/>
              <form:input path="comAddress3" type="text" id="sample4_jibunAddress" class="small" placeholder="지번주소"/><br><br>
              <form:input path="" type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"/><br><br>
              <span id="guide" style="color:#999;display:none"/></span>
              <form:input path="comAddress4" type="text" id="sample4_detailAddress" placeholder="상세주소"/><br><br>
              <form:input path="" type="hidden" id="sample4_extraAddress" placeholder="참고항목"/>
            </ul>
          </td>
        </tr>
          <tr>
          <td>
            <ul>
              <li>
              </li>
              <h2>사업자등록번호</h2>&nbsp<span id="checkComNum" class="err">${err4 }${err5 }${err6 } 조회를 눌러서 확인하세요.</span><br>
              <input type="hidden" value="" class="checkComNum" name="checkComNum"/> 
              <!-- 히든 input의 value 통하여 조회여부를 controller에 전달 -->
              <form:input path="comNum" type="text" id="b_no" value="" placeholder="사업자 등록 번호를 입력해주세요." minlength="10" maxlength="10"/><span class="def">ex) (-)를 제외한 10자리 입력</span><br><br>
              <form:input path="" type="button" id="b_no_btn" value="조회하기"/>
            </ul>
          </td>
        </tr>
        <tr>
          <td>
            <ul>
              <li>
                <h2>매장 정보</h2>&nbsp<span class="err">${err7 }</span><br>
              </li>
              <form:input path="comName" type="text" placeholder="점포명을 입력해 주세요."/><span class="def">ex) 엑시터방탈출카페</span><br><br>
              <form:input path="comPocus" type="text" placeholder="지점명을 입력해 주세요."/><span class="def">ex) 대구동성로점</span>
            </ul>
          </td>
        </tr>
        <tr>
          <td>
            <ul>
              <li>
              </li>
              <button type="submit" class="gbtn normal" cursor: pointer;>가입하기</button>
            </ul>
          </td>
        </tr>
      </table>
    </form:form>
  </div>
  <!-- footer -->
  <jsp:include page="../common/copyright.jsp"></jsp:include>
  <!-- Script area -->
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script>
    // Daum,Kakao 주소 찾기 API //
    function sample4_execDaumPostcode() {
      new daum.Postcode({
        oncomplete: function(data) {
          // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
          // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
          var roadAddr = data.roadAddress; // 도로명 주소 변수
          var extraRoadAddr = ''; // 참고 항목 변수

          // 법정동명이 있을 경우 추가한다. (법정리는 제외)
          // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
          if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
            extraRoadAddr += data.bname;
          }
          // 건물명이 있고, 공동주택일 경우 추가한다.
          if (data.buildingName !== '' && data.apartment === 'Y') {
            extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
          }
          // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
          if (extraRoadAddr !== '') {
            extraRoadAddr = ' (' + extraRoadAddr + ')';
          }

          // 우편번호와 주소 정보를 해당 필드에 넣는다.
          document.getElementById('sample4_postcode').value = data.zonecode;
          document.getElementById("sample4_roadAddress").value = roadAddr;
          document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

          // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
          if (roadAddr !== '') {
            document.getElementById("sample4_extraAddress").value = extraRoadAddr;
          } else {
            document.getElementById("sample4_extraAddress").value = '';
          }

          var guideTextBox = document.getElementById("guide");
          // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
          if (data.autoRoadAddress) {
            var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
            guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
            guideTextBox.style.display = 'block';

          } else if (data.autoJibunAddress) {
            var expJibunAddr = data.autoJibunAddress;
            guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
            guideTextBox.style.display = 'block';
          } else {
            guideTextBox.innerHTML = '';
            guideTextBox.style.display = 'none';
          }
        }
      }).open();
    }
    
		//JQuery area
    $(function() {
    	// 사업자 등록 조회 API
        $("#b_no_btn").click(function() {
          var data = {
            "b_no": [$("#b_no").val()] // 사업자번호 "xxxxxxx" 로 조회 시,
          };
          $.ajax({
            url: "https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=NzqAAE9arI91NEUdHAKEv0M2wa637iVpyauJecBY0Xm8ZMLoKICJUXZ9NnL9/PWxHIe7rGuX6hj6sMpSfgYToA==", // serviceKey 값을 xxxxxx에 입력
            type: "POST",
            data: JSON.stringify(data), // json 을 string으로 변환하여 전송
            dataType: "JSON",
            contentType: "application/json",
            accept: "application/json",
            success: function(result) {
              if (result.data[0].tax_type == '국세청에 등록되지 않은 사업자등록번호입니다.'){
            	$('#checkComNum').text('국세청에 등록되지 않은 사업자등록번호입니다.');
  				$('#checkComNum').removeClass('suc');
				$('#checkComNum').addClass('err');
				$('.checkComNum').val('no');
				// 등록되지 않은 번호이면 hidden input에 value를 no라고준다. submit 이후 request parm을 통하여 컨트롤러에서 값을 받고 페이지 이동여부를 확인
              }else {
            	$('#checkComNum').text('국세청에 등록된 사업자등록번호입니다.');
            	$('#checkComNum').removeClass('err');
  				$('#checkComNum').addClass('suc');
  				$('.checkComNum').val('ok');
              }
            },
            error: function(result) {
              console.log(result.responseText); //responseText의 에러메세지 확인
            }
          });
        });
        
		// 아이디 실시간 중복 체크(ajax 활용)
		$('#comId').keyup(function() {
			if($('#comId').val().length > 5 ) {
			var comId = $('#comId').val();
			$.ajax({
				async: true,
				type: 'POST',
				data: comId, //id가 comId인 input태그의 value값을 비동기통신 데이터로 전달
				url: "company_signUp/checkId",
				dataType: "json",
				contentType: "application/json; charset=UTF-8",
				success: function(data) {
					console.log(data);
					if(data) {
						// 아이디가 존재할 경우
						$('#checkComId').text('해당 아이디는 중복된 아이디입니다.');
		  				$('#checkComId').removeClass('suc');
						$('#checkComId').addClass('err');
					}else {
						// 아이디가 존재하지 않을 경우
						$('#checkComId').text('사용 가능한 아이디.');
		            	$('#checkComId').removeClass('err');
		  				$('#checkComId').addClass('suc');
					}
				}
			});
		  }
		});
      });
  </script>
</body>

</html>

