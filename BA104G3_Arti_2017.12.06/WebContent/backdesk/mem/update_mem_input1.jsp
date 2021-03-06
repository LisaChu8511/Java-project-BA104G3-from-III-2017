<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="com.mem.model.*" %>

<% MemVO memVO = (MemVO)request.getSession().getAttribute("memVO"); %>
<% request.getAttribute("updateSuccess"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>工具人出租</title>

    <!-- Bootstrap core CSS -->
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="<%=request.getContextPath()%>/lib/publicfile/include/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="<%=request.getContextPath()%>/lib/publicfile/include/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">


    <!-- Custom styles for this template -->
    <link href="<%=request.getContextPath()%>/lib/publicfile/include/css/freelancer.css" rel="stylesheet">

	<link rel=stylesheet type="text/css" href="<%=request.getContextPath()%>/lib/css/mem/login_mem.css">
	<link rel=stylesheet type="text/css" href="<%=request.getContextPath()%>/lib/css/index/index.css">
	<link rel=stylesheet type="text/css" href="<%=request.getContextPath()%>/lib/css/mem/register.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/lib/component/datetimepicker/jquery.datetimepicker.css" />
<%-- <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/lib/css/mem/register.css" /> --%>

<style>
#img_pic,#old_pic{width:150px;
	heigth:200px}
</style>

  </head>


<!-- 會員資料修改====================================================================== -->



           

<div class="container">

<div class="row">
    <div class="col-xs-12 col-sm-9 col-md-9 col-sm-offset-1 col-md-offset-1">
		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/mem/mem.do" name="form1" enctype="multipart/form-data">
			<h2> <small>會員修改資料</small></h2>
			<hr class="colorgraph">
			
			<div class=" ordering-image wow bounceIn" data-wow-delay="0.4s" id="preview">修改（新增）個人照片 :
			<img id="img_pic" <%-- src="<%=request.getContextPath()%>/mem/images/nopic.jpg" alt="your image" width="150" height="200"--%> /> 
			<span class="btn btn-block btn-large file-input-container">
				 <input id="mem_Pic" name="mem_Pic" size="30" type="file" value="上傳照片" onchange="previewFile();"/>
			</span>
		</div>
		
			<div class="form-group">原本圖片 :
<%-- 		<img id="old_pic"src="<%=request.getContextPath() %>/mem/memShowImage.do?action=mem_Pic&mem_No=${memVO.mem_No}"> --%>
		<img id="old_pic"src="<%=request.getContextPath() %>/mem/memShowImage.do?mem_No=${memVO.mem_No}">
			</div>
			
			<div class="form-group">E-mail
            <input type="TEXT" name="mem_Email" size="36" placeholder="請輸入e-mail EX:aaa123@gmail.com" class="form-control input-lg" tabindex="3"
			value="<%= (memVO==null)? "": memVO.getMem_Email()%>" />
    			
			</div>
		
            <div class="form-group">密碼
            <input type="password" name="mem_Pw" size="36" placeholder="請輸入數字及英文字母" class="form-control input-lg" tabindex="3" 
            id="inputPassword1" pattern="[A-Za-z0-9]{6,16}" maxlength='16' title='由英文或數字所組成的6~16字元' 
            onchange="$('#inputPassword2').attr('pattern',$(this).val())" required />
    			
			</div>
			
			<div class="form-group">再次確認密碼
            <input type="password" name="mem_Pw_reg" size="36" placeholder="請輸入數字及英文字母" class="form-control input-lg" tabindex="3" 
            id="inputPassword2" title='與密碼不符' required />
    			
			</div>
			
			<div class="form-group">姓名
            <input type="TEXT" name="mem_Name" size="36" placeholder="請輸入中文或英文姓名" class="form-control input-lg" tabindex="3"
			value="<%= (memVO==null)? "": memVO.getMem_Name()%>" />
    			
			</div>
			
			<div class="form-group">暱稱
            <input type="TEXT" name="mem_Id" size="36" placeholder="請輸入中文或英文暱稱" class="form-control input-lg" tabindex="3"
			value="<%= (memVO==null)? "": memVO.getMem_Id()%>" />
    			
			</div>
			
			
			<div class="form-group">市話號碼
            <input type="TEXT" name="mem_Tel" size="36" placeholder="EX:03-3345678" class="form-control input-lg" tabindex="3"
			value="<%= (memVO==null)? "": memVO.getMem_Tel()%>" />
			
			</div>
			
			<div class="form-group">手機號碼
            <input type="TEXT" name="mem_Pho" size="36" placeholder="EX:0978-978978" class="form-control input-lg" tabindex="3"
			value="<%= (memVO==null)? "": memVO.getMem_Pho()%>" />
			
			</div>
			
			<div class="row">
            	<div class="col-xs-6 col-sm-6 col-md-6">
			<div class="form-group">性別
			<select size="1" name="mem_Gend" value="<%= (memVO==null)? "": memVO.getMem_Gend()%>" id="estadocivil" class="form-control input-lg" tabindex="3">
			<option value="1">男</option>
			<option value="2">女</option>
			<option value="3">其他</option>
			</select>
			</div>
			</div>
			<div class="col-xs-6 col-sm-6 col-md-6">
			<div id="bday_right"class="form-group">生日
            <input type="TEXT" name="mem_Bday" size="36" id="f_date1" class="form-control input-lg" tabindex="3"
            value="<%= (memVO==null)? "": memVO.getMem_Bday()%>"/>
    		</div>	
			</div>
			</div>
			
<%----------------地址 -------------------------------------------%>


<jsp:include page="/frontdesk/mem/register_address.jsp" flush="true"></jsp:include>
<%				String City = request.getParameter("City2");
				String Area = request.getParameter("Area2");
				String ZIP = request.getParameter("ZIP"); 			%>
			<div class="form-group">通訊地址
            <input type="TEXT" name="mem_Address" size="36" placeholder="XXX路XXX巷XX弄XX號" class="form-control input-lg" tabindex="3"
			value="<%= (memVO==null)? "": memVO.getMem_Address()%>" />
			
			</div>
			
<%----------------地址 -------------------------------------------%>
			
			<div class="form-group">能否被搜尋
            <select size="1" name="mem_Search" id="estadocivil" class="form-control input-lg" tabindex="3">
			<option value="0">無法被搜索</option>
			<option value="1" selected>可以被搜索</option>
			</select>
			
			
			<input type="hidden" name="mem_No" size="36" 
			value="<%= (memVO==null)? "" : memVO.getMem_No()%>" />
			<input type="hidden" name="mem_Date" size="36" 
			value="<%= (memVO==null)? "" : memVO.getMem_Date()%>" />
			<input type="hidden" name="mem_Code" size="36" 
			value="<%= (memVO==null)? "" : memVO.getMem_Code()%>" />
			<input type="hidden" name="mem_State" size="36" 
			value="<%= (memVO==null)? "" : memVO.getMem_State()%>" />
			<input type="hidden" name="mem_Gps_Lat" size="36" 
			value="<%= (memVO==null)? "" : memVO.getMem_Gps_Lat()%>" />
			<input type="hidden" name="mem_Gps_Lng" size="36" 
			value="<%= (memVO==null)? "" : memVO.getMem_Gps_Lng()%>" />
			<input type="hidden" name="mem_Ip" size="36" 
			value="<%= (memVO==null)? "" : memVO.getMem_Ip()%>" />
			<input type="hidden" name="mission_Count" size="36" 
			value="<%= (memVO==null)? "" : memVO.getMission_Count()%>" />
			<input type="hidden" name="mem_Point" size="36" 
			value="<%= (memVO==null)? "" : memVO.getMem_Point()%>" />
			
			
			
			<input type="hidden" name="City2" id="City2" />
			<input type="hidden" name="Area2" id="Area2" />
			<input type="hidden" id="updateSuccess" value="${updateSuccess}"/>
			
			</div>
			
			
			<div class="form-group">關於我
            <textarea style="width:100%" name="mem_Intro" rows="4" cols="100" placeholder="請輸入10個中文字以上" class="form-control input-lg" tabindex="3" required ><%= (memVO==null)? "": memVO.getMem_Intro()%></textarea> 
			</div>
			 
			
			<hr class="colorgraph">
			<div class="row">
			<div class="col-xs-6 col-sm-6 col-md-6 col-xs-offset-3">
				<input type="hidden" name="action" value="updateByMem">
				<input type="submit" class="btn btn-success btn-block btn-lg" tabindex="7">
				</div>
				</div>
				
</FORM>
		</div>
	</div>
</div>
		


 
    <script src="<%=request.getContextPath()%>/lib/js/mem/register.js"></script>
  </body>
<%
	Date mem_Bday = null;
	try{
		mem_Bday = memVO.getMem_Bday();
	} catch (Exception e) {
		mem_Bday = new Date(System.currentTimeMillis());
	}
%>


<script src="<%=request.getContextPath()%>/lib/component/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/lib/component/datetimepicker/build/jquery.datetimepicker.full.min.js"></script>



<%-- 日期選擇----------------------------------------------------------%>
<script src="<%=request.getContextPath()%>/lib/js/mem/register_datetimepicker.js"></script>

<script src="<%=request.getContextPath()%>/lib/css/mem/register_datetimepicker.css"></script>
<%-- 日期選擇----------------------------------------------------------%>

<%-- 地址----------------------------------------------------------%>

<script src="<%=request.getContextPath()%>/lib/js/mem/register_address.js"></script>



<%-- 地址----------------------------------------------------------%>

<%-- 圖片上傳----------------------------------------------------------%>

<script type="text/javascript">
		function previewFile() {
	 		 var preview = document.querySelector('#img_pic');
	 		 var file    = document.querySelector('input[type=file]').files[0];
	  		 var reader  = new FileReader();

	  		  reader.addEventListener("load", function () {
	  		  preview.src = reader.result;
	 			 }, false);
	 		 if (file) {
	   			 reader.readAsDataURL(file);
	 		 }
		}
		
		
		$('#City').change(function(){
		var cityname = $('select#City option:selected').text();
			$('#City2').val(cityname);
		});
		
		$('#Area').change(function(){
			var areaname = $('select#Area option:selected').text();
				$('#Area2').val(areaname);
			});
		
		var updateOk = "ok";
		var updateSuccess = $('#updateSuccess').val();
		if(updateOk == updateSuccess){
			swal({
				  position: 'center',
				  type: 'success',
				  title: '恭喜你修改成功 !',
				  showConfirmButton: false,
				  timer: 1500
				})
		};
		
		
		
</script>







</html>