<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/front.css" rel="stylesheet" type="text/css">

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
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp" />
<!-- 헤더파일들어가는 곳 -->
<!-- 메인이미지 들어가는곳 -->
<div class="clear"></div>
<div id="main_img"><img src="../images/main_img.jpg"
 width="971" height="282"></div>
<!-- 메인이미지 들어가는곳 -->
<!-- 메인 콘텐츠 들어가는 곳 -->
<article id="front">
<div id="solution">
<div id="hosting">
<h3>화명 야외 수영장</h3>
<p>화명 생태 공원 내 위치하고 있는 부산 유일의 야외수영장으로, 겨울에는 눈썰매장으로 운영되고 있습니다.</p>
</div>
<div id="security">
<h3>화명 수목원</h3>
<p>화명동 대천천 상류 11만m2 부지에 전시실과 온실, 미로원, 수서생태원 등을 갖춘 부산 최초의 공립수목원입니다.</p>
</div>
<div id="payment">
<h3>화명 도서관</h3>
<p>화명도서관은 구민의 정보 및 문화센터로서의 중추적 역할을 다하고자 합니다.</p>
</div>
</div>
<div class="clear"></div>
<div id="sec_news">
<h3><span class="blue">Security</span> News</h3>
<dl>
<dt>·</dt>
<dd>살기 좋은 신도시 화명동 커뮤니티에 오신 걸 환영합니다~~~!</dd>
</dl>
<dl>
<dt>·</dt>
<dd>다양한 정보 공유해요~~~!</dd>
</dl>
</div>
<div id="news_notice">
<h3 class="black">News &amp; Notice</h3>
<table>
<%
// BoardDAO bdao 객체생성
BoardDAO bdao=new BoardDAO();
// int count=getBoardCount() 메서드호출 
int count=bdao.getBoardCount();
int pageSize=5;
int startRow=1;
SimpleDateFormat sdf=new SimpleDateFormat("yyyy.MM.dd");
List<BoardBean> boardList =null;
// 게시판 글있으면
//boardList = getBoardList(시작행,가져올 글개수)
if(count!=0){
	boardList=bdao.getBoardList(startRow, pageSize);
	for(int i=0;i<boardList.size();i++){
		BoardBean bb=boardList.get(i);
		%>
	<tr><td class="contxt"><a href="../center/content.jsp?num=<%=bb.getNum()%>&pageNum=1"><%=bb.getSubject() %></a></td>
    <td><%=sdf.format(bb.getDate()) %></td></tr>	
		<%
	}
}
%>
</table>
</div>
</article>
<!-- 메인 콘텐츠 들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp" />
<!-- 푸터 들어가는 곳 -->
</div>
</body>
</html>