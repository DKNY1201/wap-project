<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Ride detail</title>
    <tags:basecss></tags:basecss>
    <link href="<c:url value='/resources/css/ridedetail.css' />" rel="stylesheet"/>
</head>
<body>
<tags:header></tags:header>
<div id="ride-detail" class="container wrapper">
    <div class="row">
        <div class="col-sm-8">
            <h2 class="route">${ride.pickupPoint} -> ${ride.dropoffPoint}</h2>

            <div class="content">
                <div class="row">
                    <div class="col-sm-4">
                        Pick-up point
                    </div>
                    <div class="col-sm-8">
                        ${ride.pickupPoint}
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-4">
                        Drop-off point
                    </div>
                    <div class="col-sm-8">
                        ${ride.dropoffPoint}
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-4">
                        Date
                    </div>
                    <div class="col-sm-8">
                        ${ride.startDatetime}
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-4">
                        Detail
                    </div>
                    <div class="col-sm-8">
                        <span>${ride.pickupFlexibility.name}</span>
                        <span>${ride.maxLuggage}</span>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-2">
                        <img src="<c:url value='/resources/images/avatar.jpg' />" width="40">
                    </div>
                    <div class="col-sm-10">
                        <h3>${ride.user.firstName} ${ride.user.lastName}</h3>
                        <p>${ride.startRideDetail}</p>
                    </div>
                </div>

            </div>
        </div>
        <div class="col-sm-4">
            <section class="first-right-box">
                <div class="price">
                    <span>Price per seat</span>
                    <span>${ride.price}</span>
                </div>
                <div class="passengers">
                    <p>Passengers on this ride</p>
                    <p class="passenger-on"></p>
                    <p class="available-seat">${ride.numOfSeat} available seats</p>
                </div>
                <div class="booking">
                    <form action="booking" method="post">
                        <select name="numOfSeat" id="booking-seat">
                            <c:forEach begin="1" end="${ride.numOfSeat}" var="i">
                                <option value="${i}">${i} seat<c:if test="${i > 1}">s</c:if></option>
                            </c:forEach>
                        </select>
                        <input type="hidden" value="${ride.id}" name="rideID">
                        <button type="submit" class="btn btn-danger">Book</button>
                    </form>

                </div>
            </section>

            <section class="second-right-box">
                <h2>Driver</h2>
                <div class="driver-detail">
                    <img src="<c:url value='/resources/images/avatar.jpg' />" width="40">
                    <h3>${ride.user.firstName} ${ride.user.lastName}</h3>
                    <p>${ride.user.yearOfBirth}</p>
                    <p>${ride.user.email}</p>
                    <p>
                        <c:choose>
                            <c:when test = "${ride.user.gender == 0}">
                                Female
                            </c:when>
                            <c:otherwise>
                                Male
                            </c:otherwise>
                        </c:choose>
                    </p>
                </div>
            </section>
        </div>
    </div>

</div>
<tags:footer></tags:footer>
<tags:basejs></tags:basejs>
</body>
</html>