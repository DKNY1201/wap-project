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

    <form id="register-form" action="register" method="POST" enctype="multipart/form-data">
        <h2 class="title">Sign up</h2>

        <div class="form-check">
            <label class="form-check-label">
                <input class="form-check-input" type="radio" name="gender" value="0" checked>
                Female
            </label>
            <label class="form-check-label">
                <input class="form-check-input" type="radio" name="gender" value="1">
                Male
            </label>
            <small name="errGender" class="form-text text-muted">${errGender}</small>
        </div>
        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon" id="basic-addon-fn"><i class="fa fa-font" aria-hidden="true"></i></span>
                <input type="text" name="firstname" class="form-control" placeholder="First name" aria-label="firstname"
                       aria-describedby="basic-addon-fn" required value="${param.firstname}">
            </div>
            <small name="errFirstname" class="form-text text-muted">${errFirstname}</small>
        </div>
        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon" id="basic-addon-ln"><i class="fa fa-font" aria-hidden="true"></i></span>
                <input type="text" name="lastname" class="form-control" placeholder="Last name" aria-label="lastname"
                       aria-describedby="basic-addon-ln" required value="${param.lastname}">
            </div>
            <small name="errLastname" class="form-text text-muted">${errLastname}</small>
        </div>

        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon" id="basic-addon-email"><i class="fa fa-envelope-o"
                                                                          aria-hidden="true"></i></span>
                <input type="email" name="email" class="form-control" placeholder="Email" aria-label="email"
                       aria-describedby="basic-addon-email" pattern="[a-zA-Z0-9_\-]+@(([a-zA-Z_\-])+\.)+[a-zA-Z]{2,4}"
                       value="${param.email}">
            </div>
            <small name="errEmail" class="form-text text-muted">${errEmail} ${errEmailVerify}</small>
        </div>
        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon" id="basic-addon-pw"><i class="fa fa-lock" aria-hidden="true"></i></span>
                <input type="password" name="password" class="form-control" placeholder="Password (min .8 characters)"
                       aria-label="password" aria-describedby="basic-addon-pw" required pattern=".{8,}">
            </div>
            <small name="errPassword" class="form-text text-muted">${errPassword} ${errPasswordPattern}</small>
        </div>
        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon" id="basic-addon-cpw"><i class="fa fa-lock"
                                                                        aria-hidden="true"></i></span>
                <input type="password" name="confirm-password" class="form-control" placeholder="Confirm password"
                       aria-label="confirm-password" aria-describedby="basic-addon-cpw" required pattern=".{8,}">
            </div>
            <small name="errConfirmPassword"
                   class="form-text text-muted">${errConfirmPassword} ${errPasswordNotEqual}</small>
        </div>

        <div class="form-group">
            <label class="custom-file">
                <input type="file" id="file" class="custom-file-input" name="profile_picture">
                <span class="custom-file-control"></span>
            </label>
            <small class="form-text text-muted">${errProfilePicture} ${errProfilePicture}</small>
        </div>

        <div class="form-group">
            <select class="form-control" id="year-of-birth" name="yearOfBirth" required>
                <option value="0">Year of birth</option>
                <c:forEach begin="1900" end="2010" var="i">
                    <option value="${i}" <c:if test="${param.yearOfBirth == i}">selected</c:if>>
                        <c:out value="${i}"/>
                    </option>
                </c:forEach>
            </select>
            <small name="errYearOfBirth" class="form-text text-muted">${errYearOfBirth}</small>
        </div>

        <div class="form-group">
            <button class="btn btn-danger" type="submit">Sign up</button>
        </div>

        <div class="form-group">
            If you are a registered user, please click <a href="<c:url value='/login'/>">here</a> to login.
        </div>
    </form>
</div>
<tags:footer></tags:footer>
<tags:basejs></tags:basejs>
</body>
</html>