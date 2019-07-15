<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
<%
// 세션값 가져오기
String id=(String)session.getAttribute("id");
// 세션값이 없으면  login | join
// 세션값이 있으면  kim님 | logout
if(id==null){
	%><div id="login"><a href="../member/login.jsp">LOGIN</a> | <a href="../member/join.jsp">JOIN US</a></div><%
}else{
	%><div id="login"><a href="../member/info.jsp"><%=id %>님</a> | <a href="../member/logout.jsp">LOGOUT</a></div><%
}
%>
<div class="clear"></div>
<!-- 로고들어가는 곳 -->
<div id="logo"><a href="../main/main.jsp"><img src="../images/logo.gif" width="265" height="62" alt="Fun Web"></a></div>
<!-- 로고들어가는 곳 -->
<nav id="top_menu">
<ul>
	<li><a href="../main/main.jsp">home</a></li>
	<li><a href="../company/welcome.jsp">info</a></li>
	<li><a href="../center/notice.jsp">board</a></li>
	<li><a href="../gallery/gnotice.jsp">gallery</a></li>
	<li><a href="#">contact us</a></li>
</ul>
</nav>
</header>