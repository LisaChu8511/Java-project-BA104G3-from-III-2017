<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="com.mem.model.*" %>

<% MemVO memVO = (MemVO)request.getSession().getAttribute("memVO"); %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel=stylesheet type="text/css" href="<%=request.getContextPath()%>/lib/css/mem/login_mem.css">
	<link rel=stylesheet type="text/css" href="<%=request.getContextPath()%>/lib/css/index/index.css">
    <title>工具人出租</title>
</head>
<body>


<!-- navbar====================================================================== -->


<jsp:include page="/lib/publicfile/include/file/navbar.jsp" flush="true"></jsp:include>

<br><br><br><br><br><br><br>
<!-- navbar====================================================================== -->




<!-- 麵包屑 -->

<div class="row">
 <div class="col-xs-10 col-sm-8 col-xs-offset-2" >
	<ol class="breadcrumb">
	<li>
		<a href="<%=request.getContextPath()%>/lib/publicfile/include/file/index.jsp">首頁</a>
	</li>
	<li>
		<a href="<%=request.getContextPath()%>/frontdesk/mem/memForgetPw.jsp">忘記密碼</a>
	</li>
	<!-- <li class="active">媽我上電視了</li> -->
	</ol>
</div>
</div>


<!-- 註冊表單====================================================================== -->


<%-- 錯誤處理 --%>

<c:if test="${not empty errorMsgs}">
	<font style="color:#da0">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:#00f">${message}</li>
		</c:forEach>
	</ul>
</c:if>





<!-- memPageLeft====================================================================== -->





 <div class="col-xs-10 col-sm-8 col-xs-offset-2" >
            <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/mem/mem.do" name="form1" enctype="multipart/form-data">
            
            <h2> <small>會員資料確認</small></h2>
			<hr class="colorgraph">
            
            <div class="form-group">請輸入你的E-mail:
            <input type="text" name="mem_Email" size="36" class="form-control input-lg" tabindex="3"
			value="<%= (memVO==null)? "": memVO.getMem_Email()%>" />
            </div>
            <div class="form-group">請輸入你的生日:
            <input type="text" name="mem_Bday" size="36" class="form-control input-lg" tabindex="3"
			value="<%= (memVO==null)? "": memVO.getMem_Bday()%>" />
            </div>
            <div class="row">
			<div class="col-xs-6 col-sm-6 col-md-6 col-xs-offset-3">
				<input type="hidden" name="action" value="forgetPw">
				<input type="submit" class="btn btn-success btn-block btn-lg" tabindex="7" value="送出">
				</div>
				</div>
				<br>
				<h5 style="text-align:left"><input type="button" id="bb" value="Mageic_Button"></h5><h5 style="text-align:right">※資料正確送出後，會將補發新的密碼至你的E-mail</h5>
            </FORM>
        </div>
</div>
</div>

<!-- memPageLeft====================================================================== -->




<!-- footer====================================================================== -->
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>


<jsp:include page="/lib/publicfile/include/file/footer.jsp" flush="true"></jsp:include>


<!-- footer====================================================================== -->


</body>
<script>
$('#bb').click(function(){
			$("[name='mem_Email']").val("kiz7386@gmail.com");				
			$("[name='mem_Bday']").val("1988-08-06");

					});
</script>

</html>