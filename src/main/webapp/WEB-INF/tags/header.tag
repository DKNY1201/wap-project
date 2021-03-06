<%@ tag language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
	<div class="row">
		<div class="col-sm-12">
			<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
				<a class="navbar-brand" href="<c:url value="/" />">Chalo Chalo in car</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNavDropdown">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item <c:if test="${currentPage == 'search'}">active</c:if>">
							<a class="nav-link" href="search">Find a ride <span class="sr-only">(current)</span></a>
						</li>
						<li class="nav-item <c:if test="${currentPage == 'offerride'}">active</c:if>">
							<a class="nav-link" href="offerride">Offer a ride</a>
						</li>
						<c:if test="${empty sesUser}">
							<li class="nav-item <c:if test="${currentPage == 'signup'}">active</c:if>">
								<a class="nav-link" href="register">Sign up</a>
							</li>
							<li class="nav-item <c:if test="${currentPage == 'login'}">active</c:if>">
								<a class="nav-link" href="login">Log in</a>
							</li>
						</c:if>
						<c:if test="${not empty sesUser}">
							<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									<c:out value="${sesUser.firstName} ${sesUser.lastName}" />
								</a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
									<a class="dropdown-item" href="booking_history">Booking history</a>
									<a class="dropdown-item" href="ride_offer_history">Ride offer history</a>
									<a class="dropdown-item" href="logout">Logout</a>
								</div>
							</li>
						</c:if>
					</ul>
				</div>
			</nav>
		</div>
	</div>
</div>