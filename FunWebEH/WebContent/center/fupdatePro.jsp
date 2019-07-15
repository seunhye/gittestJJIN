<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="board2.BoardDAO"%>
<%@page import="board2.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
// center/fupdatePro.jsp
String pageNum=request.getParameter("pageNum");
// 업로드하는 프로그램 설치 cos.jar
// upload 폴더 만들기
// upload 물리적 경로
String realPath=application.getRealPath("/upload");
System.out.println(realPath);
// 업로드할 파일의 크기 제한
int maxSize=5*1024*1024; //5M
// MultipartRequest 객체생성 => 파일업로드 , multi 정보 저장
MultipartRequest multi=new MultipartRequest(request,realPath,maxSize,"utf-8",new DefaultFileRenamePolicy());
// 파라미터값 가져오셔서 변수에 저장
int num=Integer.parseInt(multi.getParameter("num"));
String name=multi.getParameter("name");
String pass=multi.getParameter("pass");
String subject=multi.getParameter("subject");
String content=multi.getParameter("content");
String file=multi.getFilesystemName("file");
String orifile=multi.getParameter("orifile");
// BoardBean bb 객체생성
// 멤버변수 <= 파라미터값 저장
BoardBean bb=new BoardBean();
bb.setNum(num);
bb.setName(name);
bb.setPass(pass);
bb.setSubject(subject);
bb.setContent(content);
//첨부파일이 있으면 새파일수정  없으면 원이미지이름 수정
if(file!=null){
	bb.setFile(file);
}else{
	bb.setFile(orifile);
}


// BoardDAO bdao 객체생성
BoardDAO bdao=new BoardDAO();
//int check = numCheck(num,pass) 메서드호출
int check=bdao.numCheck(num, pass);
//check==1  이면 updateBoard(bb) 호출 content.jsp?num=값&pageNum=값
//check==0  이면 "비밀번호틀림" 뒤로이동 
if(check==1){
	bdao.updateBoard(bb);
	response.sendRedirect("fcontent.jsp?num="+num+"&pageNum="+pageNum);
}else{
	%>
	<script type="text/javascript">
		alert("비밀번호틀림");
		history.back();
	</script>
	<%
}
%>
</body>
</html>






