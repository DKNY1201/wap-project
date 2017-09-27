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

<div class="container-fluid">
    <div class="row">
        <div class="col-md-12 col-lg-12 col-sm-12">
            <img alt="blabla" src="<c:url value='/resources/images/blablacar.jpg'/>">
        </div>
    </div>

    <form id="homeForm" action="" method="">
        <div class="form-group">
            <h1>Love getting there</h1>
            <p>Carpool in good company</p>
        </div>

        <div class="row">
            <div class="col-md-3">
                <input class="form-control" id="fromCityName" name = "fromCityName" type="text" placeholder="Leaving from...">
            </div>
            <div class="col-md-3">
                <input class="form-control" id="toCityName" name = "toCityName" type="text" placeholder="Going to...">
            </div>

            <div class="col-md-3">
                <input class="form-control" id="startDate" name = "startDate" type="text" placeholder="Date (MM/DD/YYYY)" pattern = "(0[1-9]|1[012])[- \/.](0[1-9]|[12][0-9]|3[01])[- \/.](201)[789]" title = "Please enter the date as specified">
            </div>

            <div class="col-md-3">
                <input type="submit" class="btn btn-primary" value="Find a ride">
            </div>
        </div>
    </form>

</div>

<tags:basejs></tags:basejs>
<tags:footer></tags:footer>
</body>
</html>