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
    <c:forEach items="${rides}" var="ride">
        <div class="row">
            <div class="col-sm-3">
                <div class="ProfileCard ProfileCard--condensed span2">
                    <div class="ProfileCard-head">
                        <div class="ProfileCard-picture">
                            <div class="PhotoWrapper PhotoWrapper--medium">
                                <img src="https://d2kwny77wxvuie.cloudfront.net/user/iwiJ5ug7RqGr34CwzsjA2w/thumbnail_72x72.jpeg"
                                     width="72" height="72" alt=""
                                     class="PhotoWrapper-user PhotoWrapper-user--medium u-rounded ">
                            </div>
                        </div>
                        <div class="ProfileCard-infosBlock">
                            <h2 class="ProfileCard-info ProfileCard-info--name u-truncate">
                                    ${ride.user.firstName}
                                ${ride.pickupPoint}
                            </h2>
                            <div class="ProfileCard-info">
                                    ${ride.dropoffPoint}<br>
                            </div>
                            <div class="ProfileCard-info u-blue">
                                ID verified
                            </div>
                        </div>
                    </div>
                    <div class="ProfileCard-row">
                        <p class="ratings-container">
                            <i class="bbc-icon2-star u-yellow" aria-hidden="true"></i>
                            <span class="u-textBold u-darkGray">4.7/5</span><span class="u-gray"> - 153 ratings</span>
                        </p>
                    </div>
                    <div class="ProfileCard-row">
                        <span class="tip user-trust-fb u-gray" data-hasqtip="166" oldtitle="Number of Facebook friends"
                              title="">
                            <i class="bbc-icon2-facebook-logo u-facebook"></i>
                            98 friends
                        </span>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <h3 class="time u-darkGray" itemprop="startDate" content="2017-09-27">
                    Tomorrow - 16:20
                </h3>
                <h3 class="fromto" itemprop="name">
                    <span class="from trip-roads-stop">London</span>
                    <span class="arrow-ie">→</span>
                    <span class="trip-roads-stop">Manchester</span>
                </h3>
                <dl class="geo-from">
                    <dt>
                        <i class="bbc-icon2-circle first size16 green" title="Pick-up point"></i>
                    </dt>
                    <dd class="js-tip-custom" data-hasqtip="189" oldtitle="Pick-up" title="">
                        london
                    </dd>
                </dl>
                <dl class="geo-to">
                    <dt>
                        <i class="bbc-icon2-circle first size16 red" title="Drop-off point"></i>
                    </dt>
                    <dd class="js-tip-custom" data-hasqtip="190" oldtitle="Drop-off" title="">
                        Manchester
                    </dd>
                </dl>
            </div>
            <div class="col-sm-3">
                <div class="price price-black" itemprop="location">
                    <strong>
                        <span class="">
                                £23<span class="size20">.50</span></span> </strong>
                    <span class="priceUnit">per passenger</span>
                </div>
                <div class="availability">
                    <strong>3</strong> <span>available seats</span>
                </div>

                <i class="bbc-icon2-instant size26 u-yellow u-cell u-right no-margin-right tip" aria-hidden="true"
                   data-hasqtip="214" oldtitle="Driver approval: Instant" title=""></i>
                <span class="u-visuallyHidden">Driver approval: Instant</span>

                <i class="bbc-icon2-comfort-plus size26 u-blue u-cell u-right no-margin-right tip" aria-hidden="true"
                   data-hasqtip="215" oldtitle="Trevor S guarantees max. 2 people in the back seats" title=""></i>
                <span class="u-visuallyHidden">Trevor S guarantees max. 2 people in the back seats</span>
            </div>
        </div>
    </c:forEach>

</div>
<tags:footer></tags:footer>
<tags:basejs></tags:basejs>
</body>
</html>