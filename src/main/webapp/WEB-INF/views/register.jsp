<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Register</title>
    <tags:basecss></tags:basecss>
    <link href="<c:url value='/resources/css/register.css' />" rel="stylesheet"/>
</head>
<body>
<tags:header></tags:header>
<div id="register" class="container wrapper">
    <form id="register-form" class="form-horizontal regular-form" action="register" method="POST">
        <h2 class="title">Sign up</h2>
        <div class="form-group">
            <div class="has-error">${errorMsg}</div>
        </div>
        <div class="form-check">
            <label class="form-check-label">
                <input class="form-check-input" type="radio" name="gender" value="0" checked>
                Female
            </label>
            <label class="form-check-label">
                <input class="form-check-input" type="radio" name="gender" value="1">
                Male
            </label>
        </div>
        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon" id="basic-addon-fn"><i class="fa fa-font" aria-hidden="true"></i></span>
                <input type="text" name="firstname" class="form-control" placeholder="First name" aria-label="firstname"
                       aria-describedby="basic-addon-fn" required value="${ not empty firstname ? firstname : '' }">
            </div>
        </div>
        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon" id="basic-addon-ln"><i class="fa fa-font" aria-hidden="true"></i></span>
                <input type="text" name="lastname" class="form-control" placeholder="Last name" aria-label="lastname"
                       aria-describedby="basic-addon-ln" required>
            </div>
        </div>

        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon" id="basic-addon-email"><i class="fa fa-envelope-o"
                                                                          aria-hidden="true"></i></span>
                <input type="email" name="email" class="form-control" placeholder="Email" aria-label="email"
                       aria-describedby="basic-addon-email" pattern="[a-zA-Z_\-]+@(([a-zA-Z_\-])+\.)+[a-zA-Z]{2,4}" >
            </div>
        </div>
        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon" id="basic-addon-pw"><i class="fa fa-lock" aria-hidden="true"></i></span>
                <input type="password" name="password" class="form-control" placeholder="Password (min .8 characters)"
                       aria-label="password" aria-describedby="basic-addon-pw" required pattern=".{8,}">
            </div>
        </div>
        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon" id="basic-addon-cpw"><i class="fa fa-lock"
                                                                        aria-hidden="true"></i></span>
                <input type="text" name="confirm-password" class="form-control" placeholder="Confirm password"
                       aria-label="confirm-password" aria-describedby="basic-addon-cpw" required pattern=".{8,}">
            </div>
        </div>
        <div class="form-group">
            <select class="form-control" id="year-of-birth" name="year-of-birth" required>
                <option value="0">Year of birth</option>
                <option value="1990">1990</option>
                <option value="1991">1991</option>
                <option value="1992">1992</option>
                <option value="1993">1993</option>
                <option value="1994">1994</option>
                <option value="1995">1995</option>
                <option value="1996">1996</option>
                <option value="1997">1997</option>
                <option value="1998">1998</option>
                <option value="1999">1999</option>
            </select>
        </div>

        <div class="form-group">
            <button class="btn btn-primary" type="submit">Sign up</button>
        </div>

        <div class="form-group">
            <p class="col-sm-12">
                <em>If you are a registered user, please click <a href="<c:url value='/login'/>">here</a> to login.</em>
            </p>
        </div>
    </form>
</div>
<tags:footer></tags:footer>
<tags:basejs></tags:basejs>
</body>
</html>