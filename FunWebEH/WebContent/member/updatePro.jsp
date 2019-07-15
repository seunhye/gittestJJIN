<%@page import="member.MemberDAO"%>
<%@page import="member.MemberBean"%>
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
</head>
<body>
<h1>member/updatePro.jsp</h1>
<%
// request 한글처리
request.setCharacterEncoding("utf-8");
//id, pass, name 파라미터 가져와서 변수에 저장
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String name=request.getParameter("name");
String email=request.getParameter("email");
//String address=request.getParameter("address");
String phone=request.getParameter("phone");
String mobile=request.getParameter("mobile");
String address= request.getParameter("address1")+ request.getParameter("address2")+ request.getParameter("address3");
String address1=request.getParameter("address1");
String address2=request.getParameter("address2");
String address3=request.getParameter("address3");


//MemberBean mb 객체생성
// mb변수에 <- 파라미터 값 저장
MemberBean mb=new MemberBean();
mb.setId(id);
mb.setPass(pass);
mb.setName(name);
mb.setEmail(email);
mb.setAddress(address);
mb.setAddress1(address1);
mb.setAddress2(address2);
mb.setAddress3(address3);
//mb.setAddress(address);
mb.setPhone(phone);
mb.setMobile(mobile);
//MemberDAO 객체 생성
MemberDAO mdao=new MemberDAO();
// 리턴값 저장변수  = userCheck(함수처리할때 필요한 id,pass 가져가기)
//  리턴값이 1 이면 아이디 비밀번호 일치  
//              수정작업 updateMember(mb) 메서드호출
//               main.jsp 이동
//  리턴값이 0 이면 비밀번호틀림 뒤로이동
//  리턴값이 -1 이면 아이디없음 뒤로이동
int check=mdao.userCheck(id, pass);
if(check==1){
//  수정작업 updateMember(mb) 메서드호출
	mdao.updateMember(mb);
// sql="update member set name=? where id=?";
// 		pstmt=con.prepareStatement(sql);
// 		pstmt.setString(1, name);
// 		pstmt.setString(2, id);
// 		pstmt.executeUpdate();
//  main.jsp 이동
	response.sendRedirect("info.jsp");
}else if(check==0){
//  리턴값이 0 이면 비밀번호틀림 뒤로이동
	%>
	<script type="text/javascript">
		alert("비밀번호틀림");
		history.back();
	</script>
	<%
}else{
//  리턴값이 -1 이면 아이디없음 뒤로이동
	%>
	<script type="text/javascript">
		alert("id없음");
		history.back();
	</script>
	<%
}


%>
</body>
</html>