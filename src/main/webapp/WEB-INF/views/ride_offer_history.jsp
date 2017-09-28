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
    <link href="<c:url value='/resources/css/history.css' />" rel="stylesheet"/>
</head>
<body>
<tags:header></tags:header>
<div id="history" class="container wrapper">
    <div class="row">
        <div class="col">
            <h2 class="title">Your ride offer history</h2>
            <c:forEach items="${rideBookingSeats}" var="rideBookingSeat">
                <div class="history-item row">
                    <div class="col-sm-3 left-box">
                        <p class="date">
                            <i class="fa fa-calendar" aria-hidden="true"></i> Start date: ${rideBookingSeat.ride.startDatetime}
                        </p>
                        <p class="num-of-seat">
                            <i class="fa fa-users" aria-hidden="true"></i> Seats: ${rideBookingSeat.ride.numOfSeat}
                        </p>
                        <p class="price">
                            <i class="fa fa-usd" aria-hidden="true"></i> Price: ${rideBookingSeat.ride.price}
                        </p>
                    </div>
                    <div class="col-sm-9 right-box">
                        <div class="pickup-point">
                            <span><i class="fa fa-play-circle" aria-hidden="true"></i> Pick-up point: </span>${rideBookingSeat.ride.pickupPoint}
                        </div>
                        <div class="dropoff-point">
                            <span><i class="fa fa-stop-circle-o" aria-hidden="true"></i> Drop-off point: </span>${rideBookingSeat.ride.dropoffPoint}
                        </div>
                        <div class="start-ride-detail">
                            <span>Start ride detail: </span>
                            <p>${rideBookingSeat.ride.startRideDetail}</p>
                        </div>
                        <div class="option">
                            <h2>Option:</h2>
                            <p class="max-luggage">
                                <i class="fa fa-suitcase" aria-hidden="true"></i>
                                <span>Max luggage: </span>${rideBookingSeat.ride.maxLuggage}
                            </p>
                            <p class="pickup-flexibility">
                                <i class="fa fa-clock-o" aria-hidden="true"></i>
                                <span>Pick-up flexibility: </span>${rideBookingSeat.ride.pickupFlexibility.name}
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