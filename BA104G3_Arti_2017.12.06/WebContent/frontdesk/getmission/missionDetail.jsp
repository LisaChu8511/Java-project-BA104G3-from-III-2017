<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="missionImagesSvc" scope="page"
	class="com.missionimages.model.MissionImagesService" />
<jsp:useBean id="getMissionSvc" scope="page"
	class="com.getmission.model.GetMissionService" />
<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService" />
<jsp:useBean id="ChangeStateToName" scope="page" class="com.getmission.controller.ChangeStateToName" />

<%@ page import="com.getmission.model.*"%>
<%@ page import="com.missionimages.model.*"%>

<%
	GetMissionVO getMissionVO = (GetMissionVO) request.getAttribute("getMissionVO");
	String mem_No = (String) session.getAttribute("mem_No");
	String errorMsgs = (String) session.getAttribute("errorMsgs");
%>

<!DOCTYPE html>
<html lang="">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>Mission_Detail</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<!--[if lt IE 9]>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->
<style type="text/css">
#carousel-id {
	height: 500px;
}

.missionImg {
            position: fixed;
            top: 0;
            left: 0;
            bottom: 0;
            right: 0;
            z-index: -999;
        }
        .missionImg img {
            max-height: 520px;
            min-width: auto;
            width: 100%;
        }

        @media screen and (max-width: 1000px) {
            img.missionImg {
                left: 50%;
                margin-left: -500px;
            }
        }



</style>
</head>
<body>

<div class="col-xs-12 col-sm-12">
<%@ include file="/lib/publicfile/include/file/navbar.jsp"%>
</div>
<br><br><br><br><br><br><br>
<div class="col-xs-12 col-sm-10 col-sm-offset-1">
	<div class="row">
	<table>
		<tr>
		<td>
			<div class="form-group">
				
				<div class="col-xs-12 col-sm-9">
					<c:if test="${not empty errorMsgs}">
					<div>${errorMsgs}</div>
					</c:if>
				</div>
			</div>
		</td>
		
		</tr>
		<tr class="jas">
		
			
			<div class="col-xs-12 col-sm-10 col-sm-offset-1">
				<div class="col-xs-12 col-sm-6">
					<div id="carousel-id" class="carousel slide amos"
						data-ride="carousel">
						<!-- 幻燈片小圓點區 -->
						<ol class="carousel-indicators">
							<c:forEach var="missionImagesVO"
								items="${missionImagesSvc.getMissionpho(getMissionVO.mission_No)}"
								varStatus="p">
								<c:if test="${p.index == 0 }">
									<li data-target="#carousel-id" data-slide-to="${p.index}"
										class="active"></li>
								</c:if>
								<c:if test="${p.index != 0 }">
									<li data-target="#carousel-id" data-slide-to="${p.index}"
										class=""></li>
								</c:if>
							</c:forEach>
						</ol>
						<!-- 幻燈片主圖區 -->
						<div class="carousel-inner">
							<c:forEach var="missionImagesVO"
								items="${missionImagesSvc.getMissionpho(getMissionVO.mission_No)}"
								varStatus="p">

								<c:if test="${p.index == 0 }">
									<div class="item active missionImg">
										<img src="<%=request.getContextPath()%>/missionimages/getpic.do?image_No=${missionImagesVO.image_No}"
											alt="" >
										
									</div>
								</c:if>
								<c:if test="${p.index != 0 }">
									<div class="item missionImg">
										<img
											src="<%=request.getContextPath()%>/missionimages/getpic.do?image_No=${missionImagesVO.image_No}"
											alt="" >
									
									</div>
								</c:if>
							</c:forEach>
						</div>
						<!-- 上下頁控制區 -->
						<a class="left carousel-control" href="#carousel-id"
							data-slide="prev"><span
							class="glyphicon glyphicon-chevron-left"></span></a> <a
							class="right carousel-control" href="#carousel-id"
							data-slide="next"><span
							class="glyphicon glyphicon-chevron-right"></span></a>
					</div>
				</div>

				<div class="col-xs-12 col-sm-4 ">
					<h3 class="text-center">任務簡介</h3>
					<h4>任務編號:</h4>
					<p>----${getMissionVO.mission_No}</p>
					<h4>任務名稱:</h4>
					<p>----${getMissionVO.mission_Name}</p>
					<h4>任務種類:</h4>
					<p>----${getMissionVO.mission_Category}</p>
					<h4>任務狀態:</h4>
					<p>----${ChangeStateToName.ChangeStateToName(getMissionVO.mission_State)}</p>
					<h4>發案人:</h4>
					<p>發案人:${memSvc.getOneMem(getMissionVO.issuer_Mem_No).mem_Name}</p>
				</div>
				<div class="col-xs-12 col-sm-2 ">
				<div class="panel-body">

					<form method="post"
						action="<%=request.getContextPath()%>/accusecase/accusecase.do"
						name="getmission3">
						<button class="btn-lg btn-danger" type="submit" name="action"
							value="accusecase">檢舉任務</button>
						<input type="hidden" name="mission_No"
							value="${getMissionVO.mission_No}">
						<input type="hidden" name="mem_No"
							value="${mem_No}">
					</form>
				</div>
				</div>
		</tr>
		</div>
		</table>
		<table>
		<tr>
			<div class="col-xs-12 col-sm-9 col-sm-offset-1">
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title">任務細節</h3>
					</div>
					<div class="panel-body">
						<h5>發案人</h5><p>${getMissionVO.issuer_Mem_No}~${memSvc.getOneMem(getMissionVO.issuer_Mem_No).mem_Name}</p>

						<h5>敘述</h5><p>${getMissionVO.mission_Des}</p>
						<h5>任務發佈時間</h5><p>${getMissionVO.mission_Release_Time}</p>
						<h5>任務截止日期</h5><p>${getMissionVO.mission_Due_Time}</p>
						<h5>任務模式</h5><p>${ChangeStateToName.ChangePatternToName(getMissionVO.mission_Pattern)}</p>
						<h5>任務報酬</h5><p>${getMissionVO.mission_Pay} 積分</p>
					</div>
				</div>


			</div>
			
<!-- 			<div class="col-xs-12 col-sm-2"> -->

			<td>
				

					<form method="post"
						action="<%=request.getContextPath()%>/getmission/getmission.do"
						name="getmission2">
						<a href='#modal-id-mission' data-toggle="modal"><button
								class="btn-lg btn-warning">我要接案</button></a> <input type="hidden"
							name="mission_No" value="${getMissionVO.mission_No}">
					</form>
				
			</td>
			<div class="modal fade" id="modal-id-mission">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title">任務編號:${getMissionVO.mission_No}</h4>
						</div>
						<div class="modal-body">
							<h4>任務名稱:</h4>
							<p>----${getMissionVO.mission_Name}</p>
							<h4>任務種類:</h4>
							<p>----${getMissionVO.mission_Category}</p>
						</div>
						<div class="modal-footer">

							<form method="post"
								action="<%=request.getContextPath()%>/getmission/getmission.do"
								name="getmission2">
								<button class="btn btn-info" type="submit" name="action"
									value="take_mission">確認接案</button>
								<input type="hidden" name="mission_No"
									value="${getMissionVO.mission_No}">
								<input type="hidden" name="requestURL" value="<%=request.getContextPath()%>/frontdesk/getmission/missionDetail.jsp">
							</form>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">關閉</button>
						</div>
					</div>
				</div>
			</div>
			<td>
				<div class="panel-body">

					<form method="post"
						action="<%=request.getContextPath()%>/getmission/getmission.do"
						name="getmission3">
						<button class="btn-lg btn-success" type="submit" name="action"
							value="chat">和他聊天</button>
						<input type="hidden" name="mission_No"
							value="${getMissionVO.mission_No}">
					</form>
				</div>
			</td>

			<td>
				<form method="post"
					action="<%=request.getContextPath()%>/getmission/getmission.do"
					name="getmission">

					<button class="btn btn-info" type="submit" name="action"
						value="missionindex">任務首頁</button>

				</form>

			</td>
<!-- 			</div> -->
			
		</tr>
	
	</table>
	</div>
</div>
	<div class="col-xs-12 col-sm-12">
	<jsp:include page="/lib/publicfile/include/file/footer.jsp" flush="true"></jsp:include>
	</div>
	<script src="https://code.jquery.com/jquery.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<script type="text/javascript">
		
	</script>
</body>
</html>
</body>
</html>