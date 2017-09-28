<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ page import="java.util.Date" %>
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
        <div class="col">
            <h2 class="route">${ride.pickupPoint} -> ${ride.dropoffPoint}</h2>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-8 ride-detail-left ride-detail-box">
            <div class="content">
                <div class="row">
                    <div class="col-sm-4">
                        Pick-up point
                    </div>
                    <div class="col-sm-8">
                        <i class="fa fa-play-circle" aria-hidden="true"></i> ${ride.pickupPoint}
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-4">
                        Drop-off point
                    </div>
                    <div class="col-sm-8">
                        <i class="fa fa-stop-circle-o" aria-hidden="true"></i> ${ride.dropoffPoint}
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-4">
                        Date
                    </div>
                    <div class="col-sm-8">
                        <i class="fa fa-calendar" aria-hidden="true"></i> ${ride.startDatetime}
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-4">
                        Detail
                    </div>
                    <div class="col-sm-8">
                        <span><i class="fa fa-clock-o" aria-hidden="true"></i> Pick-up ${ride.pickupFlexibility.name}</span>
                        <span class="ml-5"><i class="fa fa-suitcase" aria-hidden="true"></i> ${ride.maxLuggage} (travel bag)</span>
                    </div>
                </div>

                <div class="driver">
                    <div class="row">
                        <div class="col-sm-3">
                            <img class="driver-image" src="<c:url value='/resources/images/avatar.jpg' />">
                        </div>
                        <div class="col-sm-9">
                            <h3 class="driver-name">${ride.user.firstName} ${ride.user.lastName}</h3>
                            <p class="ride-description">${ride.startRideDetail}</p>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="col-sm-3 ml-auto ride-detail-box">
            <section class="first-right-box box">
                <div class="price">
                    <span class="left">Price per seat</span>
                    <span class="right">$${ride.price}</span>
                </div>
                <div class="passengers">
                    <p>Passengers on this ride</p>
                    <p class="passenger-on">
                        <c:forEach begin="1" end="${ride.numOfSeat}" var="i">
                            <c:choose>
                                <c:when test = "${i <= ride.numOfSeat - numOfAvailableSeat}">
                                    <i class="fa fa-circle" aria-hidden="true"></i>
                                </c:when>
                                <c:otherwise>
                                    <i class="fa fa-circle-thin" aria-hidden="true"></i>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </p>
                    <p class="available-seat"><strong>${numOfAvailableSeat}</strong> available seat<c:if test="${numOfAvailableSeat > 1}">s</c:if></p>
                </div>
                <div class="booking">
                    <form action="booking" method="post">
                        <select name="numOfSeat" id="booking-seat" class="custom-select">
                            <c:forEach begin="1" end="${numOfAvailableSeat}" var="i">
                                <option value="${i}">${i} seat<c:if test="${i > 1}">s</c:if></option>
                            </c:forEach>
                        </select>
                        <input type="hidden" value="${ride.id}" name="rideID">
                        <button type="submit" class="btn btn-danger">Request to book</button>
                    </form>

                </div>
            </section>

            <section class="second-right-box box">
                <h2>Driver</h2>
                <div class="driver-detail">
                    <img src="<c:url value='/resources/images/avatar.jpg' />">
                    <h3>${ride.user.firstName} ${ride.user.lastName}</h3>
                    <p class="age">
                        Age:
                        <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                        <jsp:useBean id="now" class="java.util.Date" />
                        <fmt:formatDate var="year" value="${now}" pattern="yyyy" />
                        ${year - ride.user.yearOfBirth} y/o</p>
                    <p>Email: ${ride.user.email}</p>
                    <p>
                        Gender:
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