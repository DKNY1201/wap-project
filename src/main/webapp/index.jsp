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
        <div class="col">
            <img class="img-fluid" alt="Chalo chalo incar" src="<c:url value='/resources/images/homepage-banner.jpg'/>">
        </div>
    </div>

    <div class="row">
        <div class="col">
            <form action="search" method="post" id="search-ride-homepage">
                <div class="form-group">
                    <div class="row">
                        <div class="input-group col-sm-4">
                            <span class="input-group-addon" id="basic-addon-pp"><i class="fa fa-play-circle" aria-hidden="true"></i></span>
                            <input type="text" name="pickupPoint" class="form-control" placeholder="Pick up point" aria-label="pickupPoint"
                                   aria-describedby="basic-addon-pp" required value="${param.pickupPoint}">
                        </div>
                        <div class="input-group col-sm-5">
                            <span class="input-group-addon" id="basic-addon-dp"><i class="fa fa-stop-circle-o" aria-hidden="true"></i></span>
                            <input type="text" name="dropoffPoint" class="form-control" placeholder="Drop off point" aria-label="dropoffPoint"
                                   aria-describedby="basic-addon-dp" required value="${param.dropoffPoint}">
                        </div>
                        <button type="submit" class="col-sm-2 btn btn-danger">Find a ride</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<tags:basejs></tags:basejs>
<tags:footer></tags:footer>
</body>
</html>