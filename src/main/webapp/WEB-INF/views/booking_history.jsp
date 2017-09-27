<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Booking success</title>
    <tags:basecss></tags:basecss>
    <link href="<c:url value='/resources/css/bookingsuccess.css' />" rel="stylesheet"/>
</head>
<body>
<tags:header></tags:header>
<div id="ride-detail" class="container wrapper">
    <div class="row">
        <div class="col">
            <h2>Your booking history</h2>
            <c:forEach items="${rideBookings}" var="rideBooking">
                <div class="booking-item row">
                    <div class="col-sm-3">
                        <p class="date">
                                ${rideBooking.booking.bookingDateTime}
                        </p>
                        <p class="num-of-seat">
                                ${rideBooking.booking.numOfSeat}
                        </p>
                        <p class="price">
                                ${rideBooking.ride.price}
                        </p>
                    </div>
                    <div class="col-sm-9">
                        <div class="pickup-point">
                            <span>Pick-up point: </span>${rideBooking.ride.pickupPoint}
                        </div>
                        <div class="dropoff-point">
                            <span>Drop-off point: </span>${rideBooking.ride.dropoffPoint}
                        </div>

                        <div class="driver">
                            <h2>Driver information</h2>
                            <h3 class="driver-name">
                                    <span>Name: </span>${rideBooking.ride.user.firstName} ${rideBooking.ride.user.lastName}
                            </h3>
                            <p class="driver-email">
                                <span>Email: </span>${rideBooking.ride.user.email}
                            </p>
                            <p class="driver-year-of-birth">
                                <span>Year of birth: </span>${rideBooking.ride.user.yearOfBirth}
                            </p>
                            <p class="driver-gender">
                                <span>Gender: </span>
                                <c:choose>
                                    <c:when test = "${rideBooking.ride.user.gender == 0}">
                                        Female
                                    </c:when>
                                    <c:otherwise>
                                        Male
                                    </c:otherwise>
                                </c:choose>
                            </p>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

</div>
<tags:footer></tags:footer>
<tags:basejs></tags:basejs>
</body>
</html>