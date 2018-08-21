<%@ page language="java"
	import="java.util.*,com.springmvc.dao.*,com.springmvc.entity.*,com.springmvc.controller.*"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


<title>图书借阅管理系统</title>

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
				<!-- javascript:void(0)死链接没啥作用换成#也可以 -->
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
	<div id="lunbo">
		<div id="carousel-example-generic" class="carousel slide top"
			data-ride="carousel">

			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#carousel-example-generic" data-slide-to="0"
					class="active"></li>
				<li data-target="#carousel-example-generic" data-slide-to="1"></li>
				<li data-target="#carousel-example-generic" data-slide-to="2"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active item1">
					<img src="resources/img/s1.jpg" alt="...">
					<div class="carousel-caption">...</div>
				</div>
				<div class="item item2 ">
					<img src="resources/img/s2.jpg" alt="...">
					<div class="carousel-caption">...</div>
				</div>
				<div class="item item3">
					<img src="resources/img/s3.jpg" alt="...">
					<div class="carousel-caption">...</div>
				</div>
				...
			</div>

			<!-- Controls -->
			<a class="left carousel-control" href="#carousel-example-generic"
				role="button" data-slide="prev"> </a> <a
				class="right carousel-control" href="#carousel-example-generic"
				role="button" data-slide="next"> </a>
		</div>

		<div class="mid">



			<c:forEach var="b" items="${goodbook}">
				<div class="foo foo1 pic1"
					style="background:url(resources/img/${b.bpicture} ) no-repeat; ">
					<div>
						<p>书名：${b.bname}</p>
						<p>作者：${b.bauthor}</p>
						<p>在架可借数量：${b.bcount}本</p>
						<a href="${path}/addtocar?bid=${b.bid}  "><span
							class="iconfont">&#xe61b;加入借书车</span></a>
					</div>
				</div>

			</c:forEach>

		</div>
		<script type="text/javascript">
			<c:if test="${not empty msg}">
			alert('${msg}');
			</c:if>
		</script>
</body>
</html>
