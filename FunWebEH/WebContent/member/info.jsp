<%@page import="member.MemberBean"%>
<%@page import="com.mysql.fabric.xmlrpc.base.Member"%>
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
<%
//세션값 가져와서 변수에 저장
String id=(String)session.getAttribute("id");
// MemberDAO mdao 객체생성
MemberDAO mdao = new MemberDAO();

//세션값인 id를 메서드에 넘겨서 디비에서 
//회원정보 전체(id,pass,name,reg_date)를 한 곳에 담아서 리턴
//리턴한 결과값 저장 변수 = getMember(메서드에서 처리하는 값)
MemberBean mb=mdao.getMember(id);
%>
<article>
<h1>회원정보조회</h1>
아이디:<%=mb.getId()%><br>
비밀번호:<%=mb.getPass() %><br>
이름:<%=mb.getName() %><br>
가입날짜:<%=mb.getReg_date() %><br>
이메일:<%=mb.getEmail() %><br>
주소:<%=mb.getAddress() %><br>
전화번호:<%=mb.getPhone() %><br>
폰번호:<%=mb.getMobile() %><br>

<input type="button" value="정보 수정" class="btn" 
 onclick="location.href='updateForm.jsp'">
 <input type="button" value="정보 삭제" class="btn" 
 onclick="location.href='deleteForm.jsp'">		


</article>
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp" />
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>





