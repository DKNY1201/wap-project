<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Search rides</title>
    <tags:basecss></tags:basecss>
    <link href="<c:url value='/resources/css/search.css' />" rel="stylesheet"/>
</head>
<body>
<tags:header></tags:header>
<div id="search" class="container wrapper">
    <div class="row">
        <div class="col">
            <form action="search" method="post" id="search-form">
                <div class="form-group">
                    <div class="row">
                        <div class="input-group col-sm-5">
                            <span class="input-group-addon" id="basic-addon-pp"><i class="fa fa-play-circle" aria-hidden="true"></i></span>
                            <input type="text" name="pickupPoint" class="form-control" placeholder="Pick up point" aria-label="pickupPoint"
                                   aria-describedby="basic-addon-pp" required value="${param.pickupPoint}">
                        </div>
                        <div class="input-group col-sm-5">
                            <span class="input-group-addon" id="basic-addon-dp"><i class="fa fa-stop-circle-o" aria-hidden="true"></i></span>
                            <input type="text" name="dropoffPoint" class="form-control" placeholder="Drop off point" aria-label="dropoffPoint"
                                   aria-describedby="basic-addon-dp" required value="${param.dropoffPoint}">
                        </div>
                        <button type="submit" class="col-sm-2 btn btn-danger">search</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <c:forEach items="${rideBookingSeats}" var="rideBookingSeat">
        <div class="row ride-item">
            <div class="col-sm-3">
                <div class="info-box">
                    <img src="<c:url value='/resources/images/avatar.jpg' />">
                    <p>Name: ${rideBookingSeat.ride.user.firstName} ${rideBookingSeat.ride.user.lastName}</p>
                    <p>
                        Age:
                        <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                        <jsp:useBean id="now" class="java.util.Date" />
                        <fmt:formatDate var="year" value="${now}" pattern="yyyy" />
                            ${year - rideBookingSeat.ride.user.yearOfBirth} y/o</p>
                    </p>
                </div>
                <div class="email">
                    <i class="fa fa-envelope" aria-hidden="true"></i> Email: ${rideBookingSeat.ride.user.email}</div>
                <div class="gender">
                    <i class="fa fa-venus-mars" aria-hidden="true"></i> Gender:
                    <c:choose>
                        <c:when test = "${rideBookingSeat.ride.user.gender == 0}">
                            Female
                        </c:when>
                        <c:otherwise>
                            Male
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <div class="col-sm-6">
                <h3>${rideBookingSeat.ride.startDatetime}</h3>
                <p class="pickupPoint"><i class="fa fa-play-circle" aria-hidden="true"></i> From: ${rideBookingSeat.ride.pickupPoint}</p>
                <p class="dropoffPoint"><i class="fa fa-stop-circle-o" aria-hidden="true"></i> To: ${rideBookingSeat.ride.dropoffPoint}</p>
            </div>
            <div class="col-sm-3">
                <p class="price">
                    <strong>$${rideBookingSeat.ride.price}</strong> per passenger
                </p>
                <p class="seats">

                    <strong>${rideBookingSeat.numOfBookedSeat}</strong> available seats
                </p>
                <p><a class="btn btn-info" href="ridedetail?rideID=${rideBookingSeat.ride.id}">Detail</a></p>
            </div>
        </div>
    </c:forEach>

</div>
<tags:footer></tags:footer>
<tags:basejs></tags:basejs>
</body>
</html>