<%@ page language="java" contentType="text/html; charset=US-ASCII"
         pageEncoding="US-ASCII"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
    <title>Home Page</title>
    <tags:basecss></tags:basecss>

    <link href="<c:url value='/resources/css/homepage.css' />" rel="stylesheet" />
</head>
<body>
<tags:header></tags:header>

<div class="container-fluid wrapper">
    <div class="row">
        <div class="col-md-12 col-lg-12 col-sm-12">
            <img class="img-fluid" alt="blabla" src="<c:url value='/resources/images/homepage-banner.jpg'/>">
        </div>
    </div>

    <form action="search" method="post" id="homePageSearch-form">

        <div class="form-group">
            <h1>Love getting there</h1>
            <p>Carpool in good company</p>
        </div>

         <div class="row">
                <div class="input-group col-md-4">
                    <span class="input-group-addon" id="basic-addon-pp"><i class="fa fa-font" aria-hidden="true"></i></span>
                    <input type="text" name="pickupPoint" class="form-control" placeholder="Pick up point" aria-label="pickupPoint"
                           aria-describedby="basic-addon-pp" required value="">
                </div>
                <div class="input-group col-md-4">
                    <span class="input-group-addon" id="basic-addon-dp"><i class="fa fa-font" aria-hidden="true"></i></span>
                    <input type="text" name="dropoffPoint" class="form-control" placeholder="Drop off point" aria-label="dropoffPoint"
                           aria-describedby="basic-addon-dp" required value="">
                </div>
                <div class="input-group col-md-4">
                    <input type="submit" class="btn btn-primary" value="Find a ride">
                </div>
            </div>

    </form>
</div>

<tags:basejs></tags:basejs>
<tags:footer></tags:footer>
</body>
</html>