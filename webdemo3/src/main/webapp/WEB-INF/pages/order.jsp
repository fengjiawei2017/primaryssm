<%@ page language="java"
	import="java.util.*,com.springmvc.dao.*,com.springmvc.entity.*,com.springmvc.controller.*"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


<title>My JSP 'order.jsp' starting page</title>



<link rel="stylesheet" href="${path}/resources/css/reset.css" />
<link rel="stylesheet" href="${path}/resources/css/iconfont.css" />
<link rel="stylesheet" href="${path}/resources/js/iconfont.js" />
<link rel="stylesheet" href="${path}/resources/css/login.css" />

<link rel="stylesheet" href="${path}/resources/css/bootstrap.min.css" />
<script src="${path}/resources/js/jquery-3.2.1.min.js"></script>
<script src="${path}/resources/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function tijiao() {

		document.getElementById('myform').submit();
	}
</script>
</head>

<body>

	<nav>
	<div class="mid">
		<div class="dian">
			<span class="iconfont myblog">&#xe607;</span> <i>图书借阅管理系统</i>

		</div>
		<div class="search">
			<form action="${path}/select" class="navi" id="myform">
				<input type="text" class="dao" name="chaxun" placeholder="大家都在搜索..." />
				<a href="javascript:void(0)" onclick="tijiao()"><span
					class="iconfont">&#xe620;</span></a>
			</form>


		</div>
		<div class="right1">
			<ul>
				<li><a href="${path}/index"><span class="iconfont">&#xe61b;</span>首页</a></li>
				<li><a href="${path}/car"><span class="iconfont">&#xe620;</span>借书车</a></li>
				<li><a href="${path}/order"><span class="iconfont">&#xe646;</span>还书</a></li>
				<li><a href="${path}/center"><span class="iconfont">&#xe6a6;</span>个人中心</a></li>



				<c:choose>
					<c:when test="${empty username}">
						<li class="sd"><a href="${path}/register">注册</a></li>
						<li class="small">|</li>
						<li class="sd"><a href="${path}/denglujiemian">登录</a></li>
					</c:when>

					<c:when test="${username=='admin'}">
						<li class="se"><a href="${path}/addbook"> ${username}
								：您好！</a> <a href="${path}/loginOut">退出登录</a></li>
					</c:when>
					<c:otherwise>
						<li class="se"><%=session.getAttribute("username")%>：您好！ <a
							href="${path}/loginOut">退出登录</a></li>
					</c:otherwise>
				</c:choose>




			</ul>
		</div>
	</div>
	</nav>

	<div id="topa"></div>

	<c:choose>
		<c:when test="${not empty uid}">
			<table class="order">
				<thead>
					<tr>
						<th>订单号</th>
						<th>用户名</th>
						<th>书名</th>
						<th>数量</th>
						<th>借阅状态</th>
						<th>借书时间</th>
						<th>最晚还书日期</th>
						<th></th>
					</tr>
				</thead>

				<c:forEach var="order" items="${olist}">
					<tr>
						<td>${order.ordernum}</td>
						<td>${order.uname}</td>
						<td>${order.bname}</td>
						<td>${order.bnum}</td>
						<td>${order.status}</td>
						<td>${order.lend}</td>
						<td class="red">${order.returns}</td>

						<c:if test="${ order.status ne '已还书'}">
							<td>
								<form action="${path }/returnbook" method="post">
									<input type="hidden" value="${order.ordernum}" name="oid">
									<input type="hidden" value="${order.bid}" name="bid"> <input
										type="hidden" value="${order.bnum}" name="num"> <input
										type="submit" value="还书">
								</form>

							</td>

						</c:if>
					</tr>
				</c:forEach>



			</table>

		</c:when>
		<c:otherwise>
			<div style="height: 300px; text-align: center; line-height: 300px">您尚未登录，请登录！</div>
		</c:otherwise>
	</c:choose>
		<script type="text/javascript">
			<c:if test="${not empty msg}">
			alert('${msg}');
			</c:if>
		</script>
</body>
</html>
