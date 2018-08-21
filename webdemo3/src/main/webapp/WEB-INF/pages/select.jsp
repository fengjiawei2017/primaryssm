<%@ page language="java"
	import="java.util.*,com.springmvc.dao.*,com.springmvc.entity.*,com.springmvc.controller.*"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="URI" value="/select"></c:set>
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
		<c:when test="${not empty slist }">
			<table class="order">
				<thead>
					<tr>
						<th>书名</th>
						<th>作者</th>
						<th>出版社</th>
						<th>价格</th>
						<th>剩余数量</th>

					</tr>
				</thead>

				<c:forEach var="b" items="${slist}">
					<tr>
						<td>${b.bname }</td>
						<td>${b.bauthor }</td>
						<td>${b.bpublisher }</td>
						<td>${b.bprices }</td>
						<td>${b.bcount }</td>
					</tr>

				</c:forEach>

				<div class="fenye">
					<table
						style="text-align: center; font-size: 20px; color: red; margin: 0 auto;">
						<tr>
							<td colspan=3 align="center">当前为第${currentPage}页,共${totalPage }页</td>
						</tr>
						<tr>
							<td colspan=3 align="center">
					</table>
					<p style="text-align: center; font-size: 20px; color: red;">
						<a href="${URI}?currentPage=1&chaxun=${chaxun}">首页</a> |
						<c:choose>
							<c:when test="${currentPage==1 }"></c:when>

							<c:otherwise>
								<a href="${URI}?currentPage=${currentPage-1}&chaxun=${chaxun}">上一页</a>
							</c:otherwise>
						</c:choose>

						<c:choose>
							<c:when test="${currentPage==totalPage }">
							</c:when>
							<c:otherwise>
								<a href="${URI}?currentPage=${currentPage+1}&chaxun=${chaxun}">下一页</a>
							</c:otherwise>

						</c:choose>
						|<a href="${URI}?currentPage=${totalPage}&chaxun=${chaxun}">尾页</a>




					</p>
				</div>

			</table>

		</c:when>
		<c:otherwise>
			<p style="text-align: center; font-size: 30px; color: red;">很抱歉，未查询到相关书籍。</p>
		</c:otherwise>
	</c:choose>


	<script type="text/javascript">
		<c:if test="${not empty msg}">
		alert('${msg}');
		</c:if>
	</script>
</body>
</html>
