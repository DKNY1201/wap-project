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
    <form action="search" method="post" id="search-form">
        <div class="form-group">
            <div class="row">
                <div class="input-group col-sm-5">
                    <span class="input-group-addon" id="basic-addon-pp"><i class="fa fa-font" aria-hidden="true"></i></span>
                    <input type="text" name="pickupPoint" class="form-control" placeholder="Pick up point" aria-label="pickupPoint"
                           aria-describedby="basic-addon-pp" required value="${param.pickupPoint}">
                </div>
                <div class="input-group col-sm-5">
                    <span class="input-group-addon" id="basic-addon-dp"><i class="fa fa-font" aria-hidden="true"></i></span>
                    <input type="text" name="dropoffPoint" class="form-control" placeholder="Drop off point" aria-label="dropoffPoint"
                           aria-describedby="basic-addon-dp" required value="${param.dropoffPoint}">
                </div>
                <button type="submit" class="col-sm-2 btn btn-danger">search</button>
            </div>
        </div>
    </form>
    <c:forEach items="${rideBookings}" var="rideBooking">
        <div class="row">
            <div class="col-sm-3">
                <div class="info-box">
                    <img src="<c:url value='/resources/images/avatar.jpg' />" width="180">
                    <p>${rideBooking.ride.user.firstName} ${rideBooking.ride.user.lastName}</p>
                    <p>${rideBooking.ride.user.yearOfBirth}</p>
                </div>
                <div class="email">${rideBooking.ride.user.email}</div>
                <div class="gender">
                    <c:choose>
                        <c:when test = "${rideBooking.ride.user.gender == 0}">
                            Female
                        </c:when>
                        <c:otherwise>
                            Male
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <div class="col-sm-6">
                <h3>${rideBooking.ride.startDatetime}</h3>
                <p class="pickupPoint"><i class="fa fa-play-circle" aria-hidden="true"></i> ${rideBooking.ride.pickupPoint}</p>
                <p class="dropoffPoint"><i class="fa fa-stop-circle-o" aria-hidden="true"></i> ${rideBooking.ride.dropoffPoint}</p>
            </div>
            <div class="col-sm-3">
                <p class="price">
                    <strong>$${rideBooking.ride.price}</strong> per passenger
                </p>
                <p class="seats">

                    <strong>${rideBooking.numOfBookedSeat}</strong> available seats
                </p>
                <p><a class="btn btn-info" href="ridedetail?rideID=${rideBooking.ride.id}">Detail</a></p>
            </div>
        </div>
    </c:forEach>

</div>
<tags:footer></tags:footer>
<tags:basejs></tags:basejs>
</body>
</html>