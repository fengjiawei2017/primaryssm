<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


<title>My JSP 'register.jsp' starting page</title>


</head>

<body>

	<form action="${path }/registers" method="post">
		<table>
			<tr>
				<td>用户名：</td>
				<td><input type="text" name="userName"></td>
			</tr>
			<tr>
				<td>密码：</td>
				<td><input type="password" name="userPwd"></td>
			</tr>
			<tr>
				<td>确认密码：</td>
				<td><input type="password" name="pwd"></td>
			</tr>

			<tr>
				<td>性别：</td>
				<td>男：<input type="radio" value="男" name="sex"> 女：<input
					type="radio" value="女" name="sex">
				</td>
			</tr>

			<tr>
				<td>联系电话(11位)：</td>
				<td><input type="text" name="tel"></td>
			</tr>

			<tr>
				<td>家庭住址：</td>
				<td><input type="text" name="address""></td>
			</tr>

			<tr>
				<td>身份证号：</td>
				<td><input type="text" name="idcard"></td>
			</tr>
			<tr>
				<td><input type="submit" value="submit"></td>
			</tr>


		</table>




	</form>
	<script type="text/javascript">
		<c:if test="${not empty msg}">
		alert('${msg}');
		</c:if>
	</script>

	${error2 } ${error1 }


</body>
</html>
