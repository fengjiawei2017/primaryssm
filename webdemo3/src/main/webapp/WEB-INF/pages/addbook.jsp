<%@ page language="java"
	import="java.util.*,com.springmvc.dao.*,com.springmvc.entity.*,com.springmvc.controller.*"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>



<title>My JSP 'addbook.jsp' starting page</title>


<link rel="stylesheet" href="${path}/resources/css/reset.css" />
<link rel="stylesheet" href="${path}/resources/css/iconfont.css" />
<link rel="stylesheet" href="${path}/resources/js/iconfont.js" />
<link rel="stylesheet" href="${path}/resources/css/login.css" />

<link rel="stylesheet" href="${path}/resources/css/bootstrap.min.css" />
<script src="${path}/resources/js/jquery-3.2.1.min.js"></script>
<script src="${path}/resources/js/bootstrap.min.js"></script>
<style>
table {
	margin: 0 auto;
}
</style>
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


	<button class="btn btn-primary" type="button" data-toggle="collapse"
		data-target="#collapseExample" aria-expanded="false"
		aria-controls="collapseExample">添加图书</button>
	<div class="collapse" id="collapseExample">
		<div class="well">
			<form action="${path}/addbooktushu" method="post">
				<table>
					<tr>
						<td>书名：</td>
						<td><input type="text" name="bname" /></td>
					</tr>
					<tr>
						<td>作者：</td>
						<td><input type="text" name="bauthor" /></td>
					</tr>
					<tr>
						<td>出版社：</td>
						<td><input type="text" name="bpublisher" /></td>
					</tr>
					<tr>
						<td>价格：</td>
						<td><input type="text" name="bprices" /></td>
					</tr>
					<tr>
						<td>图书照片（***.jpg）：</td>
						<td><input type="text" name="bpicture" /></td>
					</tr>
					<tr>
						<td>好书推荐（yes/no）：</td>
						<td><input type="text" name="bnice" /></td>
					</tr>
					<tr>
						<td>数量：</td>
						<td><input type="text" name="bcount" /></td>
					</tr>
					<tr>
						<td><input type="submit" value="添加" /></td>
					</tr>
				</table>

			</form>
		</div>
	</div>


	<button class="btn btn-primary" type="button" data-toggle="collapse"
		data-target="#collapseExample1" aria-expanded="false"
		aria-controls="collapseExample">删除图书</button>
	<div class="collapse" id="collapseExample1">
		<div class="well">


			<table class="order">
				<thead>
					<tr>
						<th>书名</th>
						<th>作者</th>
						<th>精选</th>
						<th>价格</th>
						<th>出版社</th>
						<th>数量</th>
						<th></th>
					</tr>
				</thead>
				
				<c:forEach var="b" items="${blist }">
				<tr>
					<td>${b.bname }</td>
					<td>${b.bauthor }</td>
					<td>${b.bnice }</td>
					<td>${b.bprices }</td>
					<td>${b.bpublisher }</td>
					<td>${b.bcount }</td>

					<td>
						<form action="${path}/deletebook" method="post">

							<input type="hidden" value="${b.bid }" name="bid">

							<input type="submit" value="删除">
						</form>

					</td>

				</tr>
				</c:forEach>
				

			
			</table>

		</div>
	</div>




	<button class="btn btn-primary" type="button" data-toggle="collapse"
		data-target="#collapseExample2" aria-expanded="false"
		aria-controls="collapseExample">用户信息</button>
	<div class="collapse" id="collapseExample2">
		<div class="well">


			<table class="order">
				<thead>
					<tr>
						<th>用户名</th>
						<th>密码</th>
						<th>电话</th>
						<th>地址</th>
						<th>性别</th>
						<th>IDcard</th>
						<th></th>
					</tr>
				</thead>
				
				<c:forEach items="${userlist }" var="u">
				
				
				<tr>
					<td>${u.userName}</td>
					<td>${u.userPwd}</td>
					<td>${u.tel}</td>
					<td>${u.address}</td>
					<td>${u.sex}</td>
					<td>${u.idcard}</td>

					<td>
						<form action="${path}/deleteuser" method="post">

							<input type="hidden" value="${u.uid}" name="uid">

							<input type="submit" value="删除">
						</form>

					</td>

				</tr>
				</c:forEach>

			</table>

		</div>
	</div>
	<script type="text/javascript">
		<c:if test="${not empty msg}">
		alert('${msg}');
		</c:if>
	</script>
</body>
</html>
