<%@ page language="java"
	import="java.util.*,com.springmvc.dao.*,com.springmvc.entity.*,com.springmvc.controller.*"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


<title>My JSP 'Center.jsp' starting page</title>

<link rel="stylesheet" href="${path}/resources/css/reset.css" />
<link rel="stylesheet" href="${path}/resources/css/iconfont.css" />
<link rel="stylesheet" href="${path}/resources/js/iconfont.js" />
<link rel="stylesheet" href="${path}/resources/css/login.css" />

<link rel="stylesheet" href="${path}/resources/css/bootstrap.min.css" />
<script src="${path}/resources/js/jquery-3.2.1.min.js"></script>
<script src="${path}/resources/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function disp1() {

		document.getElementById("a1").style.display = "none";
		document.getElementById("b1").style.display = "block";
	}
	function disp2() {
		document.getElementById("a2").style.display = "none";
		document.getElementById("b2").style.display = "block";
	}
	function disp3() {
		document.getElementById("a3").style.display = "none";
		document.getElementById("b3").style.display = "block";
	}
	function disp4() {
		document.getElementById("a4").style.display = "none";
		document.getElementById("b4").style.display = "block";
	}
	function disp5() {
		document.getElementById("a5").style.display = "none";
		document.getElementById("b5").style.display = "block";
	}
</script>
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



	<c:choose>
		<c:when test="${not empty uid}">
			<form action="${path }/update" method="post">
				<div class="center">
					<h1>个人信息</h1>
					<table>
						<tr>
							<td>用户名:</td>
							<td id="a1">${u.userName }</td>
							<td id="b1"><input type="text" value="${u.userName }"
								name="userName" /></td>
							<td>
								<button type="button" class="btn btn-primary" onclick="disp1()">修改</button>
							</td>
						</tr>

						<tr>
							<td>密码:</td>
							<td id="a2">*******</td>
							<td id="b2"><input type="password" name="userPwd" /></td>
							<td>
								<button type="button" class="btn btn-primary" onclick="disp2()">修改</button>
							</td>
						</tr>

						<tr>
							<td>电话:</td>
							<td id="a3">${u.tel}</td>
							<td id="b3"><input type="text" value="${u.tel}" name="tel" /></td>
							<td>
								<button type="button" class="btn btn-primary" onclick="disp3()">修改</button>
							</td>
						</tr>

						<tr>
							<td>地址:</td>
							<td id="a4">${u.address}</td>
							<td id="b4"><input type="text" value="${u.address}"
								name="address" /></td>
							<td>
								<button type="button" class="btn btn-primary" onclick="disp4()">修改</button>
							</td>
						</tr>

						<tr>
							<td>身份证号:</td>
							<td id="a5">${u.idcard}</td>
							<td id="b5"><input type="text" value="${u.idcard}"
								name="idcard" /></td>
							<td>
								<button type="button" class="btn btn-primary" onclick="disp5()">修改</button>
							</td>
						</tr>
						<tr>
							<td><input type="submit" class="dsubmit" value="提交修改" /></td>
						</tr>
					</table>



				</div>
			</form>
		</c:when>
		<c:otherwise>
			<div id="topa"></div>
			<p style="text-align: center;">请先登录!
		</c:otherwise>
	</c:choose>

	<script type="text/javascript">
		<c:if test="${not empty msg}">
		alert('${msg}');
		</c:if>
	</script>
</body>
</html>
