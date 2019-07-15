<%@page import="member.MemberBean"%>
<%@page import="member.MemberDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp" />
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 본문메인이미지 -->
<div id="sub_img_member"></div>
<!-- 본문메인이미지 -->
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
</nav>
<!-- 왼쪽메뉴 -->
<!-- 본문내용 -->
<%
// 세션값 가져와서 변수에 저장
String id=(String)session.getAttribute("id");
// MemberDAO mdao 객체생성
MemberDAO mdao=new MemberDAO();
// MemberBean mb = getMember(id)메서드호출
MemberBean mb=mdao.getMember(id);
%>
<article>
<input type="hidden" name="address" value=<%=mb.getAddress() %>><br>
<h1>회원수정</h1>
<form action="updatePro.jsp" method="post" name="fr">
아이디:<input type="text" name="id" value="<%=id %>" readonly><br>
비밀번호:<input type="password" name="pass"><br>
수정할 이름:<input type="text" name="name" 
value="<%=mb.getName() %>"><br>
수정할 이메일:<input type="text" name="email" 
value="<%=mb.getEmail() %>"><br>
수정할 phone:<input type="text" name="phone" 
value="<%=mb.getPhone() %>"><br>
수정할 mobile:<input type="text" name="mobile" 
value="<%=mb.getMobile() %>"><br>
					
수정할 address:	<input type="text" id="sample2_postcode"placeholder="우편번호" >
					<input type="button"onclick="sample2_execDaumPostcode()" value="우편번호 찾기"><br>
					<label>주소</label>
					<input type="text" id="sample2_address" placeholder="주소" name="address1" value="<%=mb.getAddress1() %>"><br>
				    <label>상세주소</label>
					<input type="text" id="sample2_detailAddress" placeholder="상세주소" name="address2" value="<%=mb.getAddress2() %>"> <br> 
					<label>참고항목</label>
					 <input	type="text" id="sample2_extraAddress" placeholder="참고항목"name="address3" value="<%=mb.getAddress3() %>"> <br>



					<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->

					<div id="layer"
						style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">

						<img src="//t1.daumcdn.net/postcode/resource/images/close.png"
							id="btnCloseLayer"
							style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1"
							onclick="closeDaumPostcode()" alt="닫기 버튼">

					</div>



					<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

					<script>
						// 우편번호 찾기 화면을 넣을 element

						var element_layer = document.getElementById('layer');

						function closeDaumPostcode() {

							// iframe을 넣은 element를 안보이게 한다.

							element_layer.style.display = 'none';

						}

						function sample2_execDaumPostcode() {

							new daum.Postcode(

									{

										oncomplete : function(data) {

											// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

											// 각 주소의 노출 규칙에 따라 주소를 조합한다.

											// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.

											var addr = ''; // 주소 변수

											var extraAddr = ''; // 참고항목 변수

											//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.

											if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우

												addr = data.roadAddress;

											} else { // 사용자가 지번 주소를 선택했을 경우(J)

												addr = data.jibunAddress;

											}

											// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.

											if (data.userSelectedType === 'R') {

												// 법정동명이 있을 경우 추가한다. (법정리는 제외)

												// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.

												if (data.bname !== ''

												&& /[동|로|가]$/g

												.test(data.bname)) {

													extraAddr += data.bname;

												}

												// 건물명이 있고, 공동주택일 경우 추가한다.

												if (data.buildingName !== ''

												&& data.apartment === 'Y') {

													extraAddr += (extraAddr !== '' ? ', '

															+ data.buildingName

															: data.buildingName);

												}

												// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.

												if (extraAddr !== '') {

													extraAddr = ' ('

													+ extraAddr + ')';

												}

												// 조합된 참고항목을 해당 필드에 넣는다.

												document

														.getElementById("sample2_extraAddress").value = extraAddr;

											} else {

												document

														.getElementById("sample2_extraAddress").value = '';

											}

											// 우편번호와 주소 정보를 해당 필드에 넣는다.

											document

											.getElementById('sample2_postcode').value = data.zonecode;

											document

											.getElementById("sample2_address").value = addr;

											// 커서를 상세주소 필드로 이동한다.

											document.getElementById(

											"sample2_detailAddress")

											.focus();

											// iframe을 넣은 element를 안보이게 한다.

											// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)

											element_layer.style.display = 'none';

										},

										width : '100%',

										height : '100%',

										maxSuggestItems : 5

									}).embed(element_layer);

							// iframe을 넣은 element를 보이게 한다.

							element_layer.style.display = 'block';

							// iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.

							initLayerPosition();

						}

						// 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는

						// resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,

						// 직접 element_layer의 top,left값을 수정해 주시면 됩니다.

						function initLayerPosition() {

							var width = 300; //우편번호서비스가 들어갈 element의 width

							var height = 400; //우편번호서비스가 들어갈 element의 height

							var borderWidth = 5; //샘플에서 사용하는 border의 두께

							// 위에서 선언한 값들을 실제 element에 넣는다.

							element_layer.style.width = width + 'px';

							element_layer.style.height = height + 'px';

							element_layer.style.border = borderWidth

							+ 'px solid';

							// 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.

							element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width) / 2 - borderWidth)

									+ 'px';

							element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height) / 2 - borderWidth)

									+ 'px';

						}
					</script>


<input type="submit" value="회원수정">
</form>
</article>
<!-- 본문내용 -->
<!-- 본문들어가는 곳 -->

<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp" />
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>

