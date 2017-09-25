<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Login</title>
<tags:basecss></tags:basecss>
<link href="<c:url value='/resources/css/login.css' />" rel="stylesheet" />
</head>
<body>
	<tags:header></tags:header>
	<div id="main" class="container">
		<form id="login-form" class="form-horizontal" action="login" method="POST" novalidate="novalidate">
			<h2>Log in</h2>
			<div class="form-group">
				<label for="inputEmail" class="col-sm-3 control-label">Email</label>
				<div class="col-sm-9">
					<input name="email" type="email" id="inputEmail" class="form-control" placeholder="Email address" required="required" autofocus=""
						value="<c:out value="${empty param.email ? cookie.email.value : param.email}" />" />
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword" class="col-sm-3 control-label">Password</label>
				<div class="col-sm-9">
					<input name="password" type="password" id="inputPassword" class="form-control" placeholder="Password" required="required"
						value="<c:out value="${empty param.password ? cookie.password.value : param.password}" />" />
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-3 col-sm-9">
					<div class="checkbox">
						<label> <input name="rememberMe" type="checkbox" ${not empty cookie.email ? 'checked="checked"' : ''}> Remember me
						</label>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-3 col-sm-9">
					<button class="btn btn-primary" type="submit">Log in</button>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-3 col-sm-9 has-error">${errorMsg}</div>
			</div>
			<div class="form-group">
				<p class="col-sm-offset-3 col-sm-9">
					<em>If you are a new user, please click <a href="<c:url value='/register'/>">here</a> to register.</em>
				</p>
			</div>
		</form>
	</div>
	<tags:footer></tags:footer>
	<tags:basejs></tags:basejs>
</body>
</html>