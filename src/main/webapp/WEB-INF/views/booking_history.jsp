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
            <h3>Your booking is successful. Click to return to <a href="/">Home page</a> or click here to see your
                <a href="booking_history">Booking history</a></h3>
        </div>
    </div>

</div>
<tags:footer></tags:footer>
<tags:basejs></tags:basejs>
</body>
</html>