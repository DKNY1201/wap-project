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
	<div id="main" class="container wrapper">
		<form id="login-form" action="login" method="POST">
			<h2 class="title">Log in</h2>
			<div class="form-group">
				<div class="has-error">${errorMsg}</div>
			</div>
			<div class="form-group">
				<div class="input-group">
                	<span class="input-group-addon" id="basic-addon-email"><i class="fa fa-envelope-o"
																		  aria-hidden="true"></i></span>
					<input type="email" name="email" class="form-control" placeholder="Email" aria-label="email"
						   aria-describedby="basic-addon-email" pattern="[a-zA-Z0-9_\-]+@(([a-zA-Z_\-])+\.)+[a-zA-Z]{2,4}" >
				</div>
			</div>
			<div class="form-group">
				<div class="input-group">
					<span class="input-group-addon" id="basic-addon-pw"><i class="fa fa-lock" aria-hidden="true"></i></span>
					<input type="password" name="password" class="form-control" placeholder="Password (min .8 characters)"
						   aria-label="password" aria-describedby="basic-addon-pw" required pattern=".{8,}">
					<input type="hidden" name="backURL" value="${backURL}">
				</div>
			</div>
			<div class="form-group">
				<button class="btn btn-primary" type="submit">Log in</button>
			</div>
			<div class="form-group">
				If you are a new user, please click <a href="<c:url value='/register'/>">here</a> to register.
			</div>
		</form>
	</div>
	<tags:footer></tags:footer>
	<tags:basejs></tags:basejs>
</body>
</html>