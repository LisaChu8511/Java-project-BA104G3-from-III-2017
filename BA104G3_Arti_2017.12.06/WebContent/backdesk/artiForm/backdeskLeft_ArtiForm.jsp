<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/lib/css/style.pro.default.css" type="text/css" />
<style>


</style>
</head>
<body>
	<div class="col-xs-12 col-sm-2  left01" >
	
	<!-- 標籤面板：內容區 -->
		<div role="" class="tab-pane active " id="tab1">
			<div class="list-group">
				<a href="/BA104G3/backdesk/artiForm/select_page.jsp" class="list-group-item">&nbsp;&nbsp;討論區文章管理</a> 
				<a href="/BA104G3/backdesk/artiReply/selectReply_page.jsp" class="list-group-item">&nbsp;&nbsp;討論區文章回覆管理</a> 
				<a href="/BA104G3/backdesk/artiReport/selectReport_page.jsp" class="list-group-item">&nbsp;&nbsp;討論區文章檢舉管理</a> 
				<a href="/BA104G3/backdesk/ad/selectAd_page.jsp" class="list-group-item">&nbsp;&nbsp;討論區廣告管理</a> 
			</div>
	</div><!--rol -->
 	</div><!--2 -->
	<script src="https://code.jquery.com/jquery.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>