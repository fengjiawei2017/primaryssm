<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>



<title>My JSP 'index.jsp' starting page</title>

<link rel="stylesheet" href="${path}/resources/css/reset.css" />
<link rel="stylesheet" href="${path}/resources/css/iconfont.css" />
<link rel="stylesheet" href="${path}/resources/js/iconfont.js" />
<link rel="stylesheet" href="${path}/resources/css/login.css" />

<link rel="stylesheet" href="${path}/resources/css/bootstrap.min.css" />
<script src="${path}/resources/js/jquery-3.2.1.min.js"></script>
<script src="${path}/resources/js/bootstrap.min.js"></script>
</head>

<body>

	<div class="up">
		<div class="ppo">
			<a href="#" class="orange">账号登录</a>


			<form action="${path }/logina" method="post" class="bear">
				<span class="iconfont dl">&#xe61b;</span> <span class="iconfont d2">&#xe6a6;</span>
				<input type="text" name="userName" class="myinpiut"
					placeholder="邮箱/手机号/会员号" /> <input type="password" name="userPwd"
					class="myinpiut loo" placeholder="请输入密码" /> <input class="denglu"
					type="submit" value="登录" />
			</form>
			<span>&nbsp;&nbsp;&nbsp;还没有账号？</span> <a href="${path }/register"
				class="recruit">立即注册</a>

				<script type="text/javascript">
					<c:if test="${not empty msg}">
					alert('${msg}');
					</c:if>
				</script>
		</div>

	</div>

</body>
</html>
