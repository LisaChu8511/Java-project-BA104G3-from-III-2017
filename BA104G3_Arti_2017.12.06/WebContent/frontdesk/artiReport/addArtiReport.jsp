<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.artiReport.model.*"%>

<%
  ArtiReportVO artiReportVO = (ArtiReportVO) request.getAttribute("artiReportVO");
%>


<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title> 檢舉文章新增 - AddArtiReport.jsp</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="/BA104G3/lib/css/arti_ref/report.min.css" />
<link rel="stylesheet" href="/BA104G3/lib/css/arti_ref/booystrap.min.css" />

<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

<style>
  table {
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
  }
  table, th, td {
    border: 0px solid #CCCCFF;
  }
  th, td {
    padding: 1px;
  }
</style>

</head>
<body bgcolor='white'>

<jsp:include page="/lib/publicfile/include/file/navbar.jsp" flush="true" />

<table id="table-1">
	<tr><td>
		 <h3>檢舉文章新增 - AddArtiReport.jsp</h3></td><td>
		 <h4><a href="selectReport_page.jsp"><img src="images/tomcat.png" width="100" height="100" border="0">回首頁</a></h4>
	</td></tr>
</table>

<h3>資料新增:</h3>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>


<div class="container">
<div class="col-xs-12 col-sm-11 widget-container-span">
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/artiReport/artiReport.do" name="form1" enctype="multipart/form-data">
                <div class="widget-box">
                    <div class="widget-header header-color-dark">
                        <h5 class="bigger lighter"> 
                         <jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService" />
                        <input type="hidden" name="mem_No" value="${memVO.mem_No}" ${(artiReportVO.mem_No==memVO.mem_No)?'selected':'' } >${memVO.mem_No}
                        </h5>
                        <div class="widget-toolbar">
                            <div class="" style="width:100px;">
                            <jsp:useBean id="artiClassSvc" scope="page" class="com.artiClass.model.ArtiClassService" />
                            <input type="hidden" name="arti_Cls_No" size="45" value="${artiReportVO.arti_Cls_No}" ${(artiReportVO.arti_Cls_No==artiClassVO.arti_No)?'selected':'' } >
                            ${artiClassVO.arti_Class_Name}
                            </div>
                        </div>
                        <div class="widget-toolbar">
                            <div class="" style="width:100px;">
                                <div class="" style="">${artiReportVO.arti_No}</div>
                            </div>
                        </div>
                        <div class="widget-toolbar">
                            <div class="" style="width:100px;">
                                <div class="" style="">
                                <input  type="hidden" name="reply_No" size="45" value="<%= (artiReportVO==null)? "REP0000066" : artiReportVO.getReport_No()%>" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="widget-body">
                        <div class="widget-toolbox">
                            <div class="btn-toolbar">
                                <div class="btn-group">
                                    <div class="widget-toolbar">
                                    <div class="widget-main padding-6">
                                            <div class="pic">
                                            
    <img src="<%=request.getContextPath()%>/tool/showimage.do?action=mem_Pic&mem_No=${memVO.mem_No}"
	                     style="height:100px;width:120px;"/>
    </div>
                                    </div>
                                    </div>
                                    
                                    <div class="widget-toolbar">
                                    <div class="widget-main padding-6">
                                            <div class="pic">
                                            
    <img id="theImage" src="<%=request.getContextPath()%>/image/no-product.gif=${artiReportVO.mem_No}"
	                     style="height:111px;width:120px;"/>
		<input type="hidden" name="mem_No" size="45" 
			 value="${memVO.mem_Pic}" ${(artiReportVO.mem_No==memVO.mem_No)?'selected':'' } >${memVO.mem_Pic}
    </div>
                                    </div>
                                    </div>
                                    
                                    <div class="widget-toolbar">
                                    <div class="widget-main padding-6">
                                        <i class="icon-remove bigger-110"></i>
                                        <jsp:useBean id="artiFormSvc" scope="page" class="com.artiForm.model.ArtiFormService" />
                                    <input type="hidden" name="arti_No" size="45" value="${artiFormVO.arti_No}" ${(artiReportVO.arti_No==artiFormVO.arti_No)?'selected':'' } >${artiFormVO.arti_Title}
                                    </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="widget-main padding-16">
                         <input type="hidden" name="arti_Cls_No"  value="${artiReplyVO.arti_Cls_No}">
                        <input type="TEXTAREA" style="height:200px; width:100%" name="report_Desc" size="45"	value="<%= (artiReportVO==null)? " @@? " : artiReportVO.getReport_Desc()%>" />
                            ${artiReportVO.report_Desc}
                        </div>
                    </div>
                    <div class="widget-header header-color-dark">
                        <h5 class="bigger lighter">
                        <input type="hidden" name="report_Time" id="f_date1" type="text">
                        </h5>
                        <div class="widget-toolbar">
                            <div class="btn-group">
                            <div>
                                <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/artiReport/artiReport.do" style="margin-bottom: 0px;">
			                    <input type="hidden" name="report_No"  value="${artiReportVO.report_No}">
			                    <input type="hidden" name="requestURL" value="<%=request.getServletPath()%>">
			                    <button class="btn btn-info" type="submit" name="action" value="insertReport"> 送出檢舉 </button>
 			                    </FORM>  
                            </div>
                            </div>
                            </div>
                        </div>
                    </div>
                    </FORM>
                </div>
</div>

 <jsp:include page="/lib/publicfile/include/file/footer.jsp" flush="true" />
</body>

<% 
  java.sql.Timestamp reply_Time = null;
  try {
	  reply_Time = artiReportVO.getReport_Time();
   } catch (Exception e) {
	   reply_Time = new java.sql.Timestamp(System.currentTimeMillis());
   }
%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/build/jquery.datetimepicker.full.min.js"></script>

<style>
  .xdsoft_datetimepicker .xdsoft_datepicker {
           width:  300px;   /* width:  300px; */
  }
  .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
           height: 151px;   /* height:  151px; */
  }
</style>

<script>
        $.datetimepicker.setLocale('zh');
        $('#f_date1').datetimepicker({
	       theme: '',              //theme: 'dark',
	       timepicker:false,       //timepicker:true,
	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
		   value: '<%=reply_Time%>', // value:   new Date(),
        });
</script>

<script type="text/javascript">
        function onLoadBinaryFile() {
            var theFile = document.getElementById("theBinaryFile");

            // 確定選取了一個二進位檔案，而非其他格式。
            if (theFile.files.length != 0 && theFile.files[0].type.match(/image.*/)) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    var theImg = document.getElementById("theImage");
                    theImg.src = e.target.result;
                };
                reader.onerror = function (e) {
                    alert("例外狀況，無法讀取二進位檔");
                };

                // 讀取二進位檔案。
                reader.readAsDataURL(theFile.files[0]);
            }
            else {
                alert("請選取一個二進位檔");
            }
        }
    </script>
</html>