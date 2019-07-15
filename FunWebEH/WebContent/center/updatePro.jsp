<%@page import="board.BoardDAO"%>
<%@page import="board.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>board/updatePro.jsp</h1>
<%
//request 한글처리
request.setCharacterEncoding("utf-8");
String pageNum=request.getParameter("pageNum");
//num, name ,pass,subject,content 파라미터 가져와서 변수에 저장
int num=Integer.parseInt(request.getParameter("num"));
String name=request.getParameter("name");
String pass=request.getParameter("pass");
String subject=request.getParameter("subject");
String content=request.getParameter("content");

// BoardBean bb객체생성
// bb 멤버변수에  파라미터 가져온변수를  저장
BoardBean bb=new BoardBean();
bb.setNum(num);
bb.setName(name);
bb.setPass(pass);
bb.setSubject(subject);
bb.setContent(content);

// BoardDAO bdao 객체생성
BoardDAO bdao=new BoardDAO();
// int check = numCheck(num,pass)
int check=bdao.numCheck(num, pass);
// check==1 이면  updateBoard(bb) 호출 content.jsp?num= 이동
//              name,subject,content 수정
// check==0 이면 "비밀번호틀림" 뒤로이동
if(check==1){
	bdao.updateBoard(bb);
	response.sendRedirect("content.jsp?num="+num+"&pageNum="+pageNum);
}else if(check==0){
	%>
	<script type="text/javascript">
		alert("비밀번호틀림");
		history.back();
	</script>
	<%
}else{
	%>
	<script type="text/javascript">
		alert("num틀림");
		history.back();
	</script>
	<%
}
%>
</body>
</html>





