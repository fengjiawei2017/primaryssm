<%@ page language="java"
	import="java.util.*,com.springmvc.dao.*,com.springmvc.entity.*,com.springmvc.controller.*"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


<title>My JSP 'borrow.jsp' starting page</title>

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


	<p class="index_hr"></p>
	<div style="margin-left: 50px">
		<table align="center" width="940" style="margin: 0 auto">


			<c:choose>

				<c:when test="${not empty uid}">
					<c:choose>
						<c:when test="${empty list}">
							<div
								style="height: 300px; text-align: center; line-height: 150px">购物车为空!</div>
						</c:when>

						<c:otherwise>

							<tr height="20"></tr>
							<tr>
								<td colspan="8"><br></td>
							</tr>
							<tr>
								<td align="center" style="padding-left: 45px"><font
									style="color: #8893b0;"><b>图书</b></font></td>
								<td align="center"><div style="text-align: center;">
										<font style="color: #8893b0;"><b>图书名称</b></font>
									</div></td>
								<td align="center"><font style="color: #8893b0;"><b>价格</b></font></td>
								<td align="center" width="20"></td>
								<td align="center" width="40"><font style="color: #8893b0;"><b>数量</b></font></td>
								<td align="center" width="20"></td>

								<td align="center" style="padding-left: 30px"><font
									style="color: #8893b0;"><b>操作</b></font></td>
							</tr>
							<tr>
								<td colspan="8"><br></td>
							</tr>

							<c:forEach var="car" items="${list}">
								<tr align="center">
									<td height="80" width="60"><img style="margin-left: 20px"
										width="100px" height="154px"
										src="${basePath}resources/img/${car.cpicture}"></td>
									<td align="center"><div style="text-align: center;">${car.cname}</div></td>
									<td align="center">￥${car.cprice}</td>
									<td align="center" width="20">
										<form action="${path}/subbnum?bookid=${car.bid}" method="post"
											name="numform">
											<!--减数量 -->
											<br> <input value="-" type="submit" name="sub"
												style="margin-bottom: 17px;"> <input type="hidden"
												value="-1" name="hid" style="margin-bottom: 17px;">
										</form>
									</td>

									<td align="center" width="40"><input type="text" size="10"
										readonly value="${car.num} "
										style="text-align: center; width: 40px"></td>

									<td align="center" width="20">
										<form action="${path}/addbnum?bookid=${car.bid}" method="post">
											<!-- 加数量 -->
											<br> <input value="+" type="submit" name="add"
												style="margin-bottom: 17px; margin-right: 30px"> <input
												type="hidden" value="1" name="hid"
												style="margin-bottom: 17px; margin-right: 30px">
										</form>
									</td>

									<td align="center"><a class="anniu"
										href="${path}/delbnum?bookid=${car.bid} ">删除</a></td>
								</tr>
								<tr>
									<td colspan="8"><br></td>
								</tr>
								<tr>
									<td colspan="8"><br></td>
								</tr>



								<tr>
									<td colspan="8"><br></td>
								</tr>
							</c:forEach>
							<tr>
								<td colspan="2"><a style="margin-left: 15px" class="anniu"
									href="${path}/delcar">清空借阅车</a></td>
								<td width="80" colspan="4">总数量：<font color="#f40" size="6">${totalNum}</font></td>

								<td colspan="4" style="text-align: center;"><a
									class="anniu" href="${path}/lend">借阅</a>
							</tr>
						</c:otherwise>
					</c:choose>

				</c:when>
				<c:otherwise>
					<div style="height: 300px; text-align: center; line-height: 150px">您尚未登录，请先登录!</div>
				</c:otherwise>
			</c:choose>



		</table>
	</div>


	</div>
	</div>
	<script type="text/javascript">
		<c:if test="${not empty msg}">
		alert('${msg}');
		</c:if>
	</script>
</body>
</html>
