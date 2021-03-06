<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.artiForm.model.*"%>
<%@ page import="com.mem.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
    MemVO memVO = (MemVO) session.getAttribute("memVO");

    ArtiFormVO artiFormVO = new ArtiFormVO();
    session.setAttribute("artiFormVO",artiFormVO);
    ArtiFormService artiSvc = new ArtiFormService();
    
    Set<ArtiFormVO> set = artiSvc.getAll();
    pageContext.setAttribute("set",set);
%>

<jsp:useBean id="artiFormDAO" scope="page" class="com.artiForm.model.ArtiFormDAO" />

<html>
<head>
<title>所有文章資料 - listAllArtiForm.jsp</title>
<link rel="stylesheet" href="/BA104G3/lib/css/arti_ref/artiAll.css" />

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
div> .timeline-body{
    float: left;
}
  
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body bgcolor='white'>
<br><br>
<jsp:include page="/lib/publicfile/include/file/navbar.jsp" flush="true" />
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<jsp:include page="/frontdesk/ad/listOneAd.jsp" flush="true" />

<div class="page-header position-relative">

                <div class="title">
                    <div class="list">
                        <a  href="/BA104G3/frontdesk/ad/GroupChat.jsp"><h1> 神靠北練功房 </h1></a>
                    </div>
                </div>
                    
                <div class="title">
                      <div class="search">
                        <h1>
                       <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/artiForm/artiForm.do"  name="form1" enctype="multipart/form-data">
                         <input type="text" size="40"  class="" name="describe"  placeholder="請輸入內文關鍵字">
                        <input type="hidden" name="describe"  value="${artiFormVO.describe}">
    			         <input type="hidden" name="requestURL" value="<%=request.getServletPath()%>">
                        <button class="btn btn-info" type="submit" name="action" value="listArti_BySearch"> GO!!! </button>
                        </FORM>
                        </h1>
                      </div>
                  </div>
                    <!--Header Buttons-->
                    
                    <div class="header-buttons">
                     <c:if test="${memVO.mem_State == 1}">
                        <a class="refresh" href="/BA104G3/frontdesk/artiReport/listReport_ByMemNo.jsp">
                            <i></i>Report return
                        </a>
                        </c:if>
                    <c:if test="${memVO.mem_State == 1}">
                        <a class="sidebar-toggler" href="/BA104G3/frontdesk/ad/listMusic.jsp">
                            <i></i>Relax Music
                        </a>
                        </c:if>
                        <c:if test="${memVO.mem_State == 1}">
                        <a class="refresh" id="refresh-toggler" href="/BA104G3/frontdesk/artiForm/listArti_ByMemNo.jsp">
                            <i>Personal</i>
                        </a>
                        </c:if>
                        <c:if test="${memVO.mem_State == 1}">
                        <a class="fullscreen" id="fullscreen-toggler" href="/BA104G3/frontdesk/artiForm/addArtiForm.jsp">
                            <i> POST </i>
                        </a>
                        </c:if>
                         <a class="sidebar-toggler" href="/BA104G3/frontdesk/ad/GroupChat.jsp">
                            <i>Chat</i>
                        </a>
                    </div>
                        
                    </div>
<div class="container" style="font-size: 18px; text-align: center;">       
<%@ include file="/frontdesk/page1.file" %>                        
	<c:forEach var="artiFormVO" items="${set}" varStatus="s" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>" >
   </div>                     
                <div class="page-body">
                    <ul class="timeline">
                        <li>
                            <div class="timeline-datetime">
                                <div class="timeline-time">
                                    <fmt:formatDate value="${artiFormVO.arti_Time}" pattern="yyyy-MM-dd HH:mm:ss"/> 
                                </div>
                                <jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService" />
                                <div class="timeline-date" style="font-size:24px; font-family:Microsoft JhengHei;">${memSvc.getOneMem(artiFormVO.mem_No).mem_Name}</div>
                                <div class="timeline-date">
                                <img src="<%=request.getContextPath()%>/tool/showimage.do?action=mem_Pic&mem_No=${artiFormVO.mem_No}&mem_${memSvc.getOneMem(memVO.mem_No).mem_Pic}"
	                     style="height:100px;width:120px; box-shadow:3px 3px 12px gray;padding:3px;"/>

                                </div>
                                <div class="timeline-time">
                                <p></p>
                                
                                </div>
                            </div>
                            <div class="timeline-badge sky">
                                <jsp:useBean id="artiClassSvc" scope="page" class="com.artiClass.model.ArtiClassService"/>
			                    <td>${artiClassSvc.getOneClass(artiFormVO.arti_Cls_No).arti_Cls_Name}</td>
                            </div>
                            
                            <div class="timeline-panel bordered-top-3 bordered-azure">
                                <div class="timeline-header bordered-bottom bordered-blue">
                                    <span class="timeline-title">
                                    
                                        <td> <a href="/BA104G3/artiForm/artiForm.do?arti_No=${artiFormVO.arti_No}&arti_Cls_No=${artiFormVO.arti_Cls_No}&mem_No=${memVO.mem_No}&action=jumpOne_For_Display">
                                        ${artiFormVO.arti_No}</a></td>
                                        <td> ${artiFormVO.arti_Status} </td>
                                    </span>

                                </div>
                                <div class="timeline-body">
                                <div class="">
                                    <p style="font-family:Microsoft JhengHei;"> ${artiFormVO.arti_Title}</p>
                                </div>                                
                            </div>
                            
                            <div class="timeline-body">
                            <p> 目前文章人氣 : ${artiFormVO.arti_Like} </p><br>
                                    <img src="<%=request.getContextPath()%>/tool/showimage.do?action=arti_Pic&arti_No=${artiFormVO.arti_No}"
	                     style="height:150px;width:180px; box-shadow:3px 3px 12px gray;padding:3px;"/>
	                     
                                </div>
                           <div class="timeline-body">
                                 
                                </div>
                                
                            </div>
                        </li>
                    </ul>
                </div> 
                    </c:forEach>
<div class="container" style="font-size: 18px; text-align: center;">    
 <%@ include file="/backdesk/page2.file" %> 
 </div>        
     
    <!--Basic Scripts-->
    <script src="js/jquery-2.0.3.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

    <!--Beyond Scripts-->
    <script src="js/beyond.min.js"></script>

    <!--Page Related Scripts-->
    <!--Google Analytics::Demo Only-->
    <script>
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date(); a = s.createElement(o),
            m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
        })(window, document, 'script', 'http://www.google-analytics.com/analytics.js', 'ga');

        ga('create', 'UA-52103994-1', 'auto');
        ga('send', 'pageview');
        
    </script>
</body>

 <jsp:include page="/lib/publicfile/include/file/footer.jsp" flush="true" />
</html>