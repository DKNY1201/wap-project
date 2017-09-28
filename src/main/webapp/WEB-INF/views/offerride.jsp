<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Offer a ride</title>
    <tags:basecss></tags:basecss>
    <link href="<c:url value='/resources/css/offerride.css' />" rel="stylesheet"/>
</head>
<body>
<tags:header></tags:header>
<div id="register" class="container wrapper">
    <form id="register-form" action="offerride" method="POST" novalidate>
        <h2 class="title">Offer a ride on your next long journey</h2>
        <div class="form-group">
            <div class="has-error">${errorMsg}</div>
        </div>

        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon" id="basic-addon-pp"><i class="fa fa-play-circle" aria-hidden="true"></i></span>
                <input type="text" name="pickupPoint" class="form-control" placeholder="Example: Fairfield, Ottumwa, Des Moine" aria-label="pickupPoint"
                       aria-describedby="basic-addon-pp" required value="${param.pickupPoint}">
            </div>
        </div>
        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon" id="basic-addon-dp"><i class="fa fa-stop-circle-o" aria-hidden="true"></i></span>
                <input type="text" name="dropoffPoint" class="form-control" placeholder="Example: Davenport, Chicago, Mount Pleasant" aria-label="dropoffPoint"
                       aria-describedby="basic-addon-dp" required value="${param.dropoffPoint}">
            </div>
        </div>

        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon" id="basic-addon-startdatetime">
                    <i class="fa fa-calendar" aria-hidden="true"></i>
                </span>
                <input id="datetimepicker" type="text" name="startDatetime" class="form-control" aria-label="startdatetime"
                       aria-describedby="basic-addon-startdatetime" value="${param.startDatetime}" placeholder="Pick-up date">
            </div>
        </div>

        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon" id="basic-addon-price">
                    <i class="fa fa-usd" aria-hidden="true"></i>
                </span>
                <input type="text" name="price" class="form-control" placeholder="Enter price of the ride" aria-label="price"
                       aria-describedby="basic-addon-price" required pattern="\d{1,4}" value="${param.price}">
            </div>
        </div>
        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon" id="basic-addon-nos">
                    <i class="fa fa-users" aria-hidden="true"></i>
                </span>
                <input type="text" name="numOfSeat" class="form-control" placeholder="Available seats" aria-label="price"
                       aria-describedby="basic-addon-nos" required pattern="\d{1,7}" value="${param.numOfSeat}">
            </div>
        </div>
        <div class="form-group">
            <label for="start-ride-detail">Start Ride details</label>
            <textarea class="form-control" id="start-ride-detail" rows="3" name="startRideDetail">${param.startRideDetail}</textarea>
        </div>

        <div class="form-group">
            <label for="max-luggage">Max. luggage</label>
            <select class="form-control" id="max-luggage" name="maxLuggage" required>
                <option value="Small" <c:if test="${param.maxLuggage == 'Small'}">selected</c:if>>Small</option>
                <option value="Medium" <c:if test="${param.maxLuggage == 'Medium'}">selected</c:if>>Medium</option>
                <option value="Large" <c:if test="${param.maxLuggage == 'Large'}">selected</c:if>>Large</option>
            </select>
        </div>

        <div class="form-group">
            <label for="pickup-flexibility">Pick-up flexibility</label>
            <select class="form-control" id="pickup-flexibility" name="pickupFlexibility" required>
                <option value="Rightontime" <c:if test="${param.pickupFlexibility == 'Rightontime'}">selected</c:if>>Right on time</option>
                <option value="Ina15minutewindow" <c:if test="${param.pickupFlexibility == 'Ina15minutewindow'}">selected</c:if>>In a 15 minute window</option>
                <option value="Ina30minutewindow" <c:if test="${param.pickupFlexibility == 'Ina30minutewindow'}">selected</c:if>>In a 30 minute window</option>
                <option value="Ina1hourwindow" <c:if test="${param.pickupFlexibility == 'Ina1hourwindow'}">selected</c:if>>In a 1 hour window</option>
                <option value="Ina2hourwindow" <c:if test="${param.pickupFlexibility == 'Ina2hourwindow'}">selected</c:if>>In a 2 hour window</option>
            </select>
        </div>

        <div class="form-group">
            <button class="btn btn-danger" type="submit">Offer a ride</button>
        </div>
    </form>
</div>
<tags:footer></tags:footer>
<tags:basejs></tags:basejs>
<script src="<c:url value='/resources/js/offerride.js' />"></script>
</body>
</html>