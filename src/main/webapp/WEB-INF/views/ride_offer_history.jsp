<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Ride offer history</title>
    <tags:basecss></tags:basecss>
    <link href="<c:url value='/resources/css/ride_offer_history.css' />" rel="stylesheet"/>
</head>
<body>
<tags:header></tags:header>
<div id="ride-detail" class="container wrapper">
    <div class="row">
        <div class="col">
            <h2>Your Ride offer history</h2>
            <c:forEach items="${rideBookingSeats}" var="rideBookingSeat">
                <div class="booking-item row">
                    <div class="col-sm-3">
                        <p class="date">
                            <span>Start date:</span> ${rideBookingSeat.ride.startDatetime}
                        </p>
                        <p class="num-of-seat">
                            <span>Number of seats:</span> ${rideBookingSeat.ride.numOfSeat}
                        </p>
                        <p class="price">
                            <span>Price:</span> ${rideBookingSeat.ride.price}
                        </p>
                    </div>
                    <div class="col-sm-9">
                        <div class="pickup-point">
                            <span>Pick-up point: </span>${rideBookingSeat.ride.pickupPoint}
                        </div>
                        <div class="dropoff-point">
                            <span>Drop-off point: </span>${rideBookingSeat.ride.dropoffPoint}
                        </div>
                        <div class="start-ride-detail">
                            <span>Start ride detail: </span>${rideBookingSeat.ride.startRideDetail}
                        </div>
                        <div class="option">
                            <p class="max-luggage"><span>Max luggage: </span>${rideBookingSeat.ride.maxLuggage}</p>
                            <p class="pickup-flexibility"><span>Pick-up flexibility: </span>${rideBookingSeat.ride.pickupFlexibility.name}</p>
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