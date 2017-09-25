<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Home page</title>
    <tags:basecss></tags:basecss>
    <link href="<c:url value='/resources/css/homepage.css' />" rel="stylesheet" />
</head>
<body>
<tags:header></tags:header>

<section id="homepage" class="container-fluid">
    <div class="row">
        <div class="col">
            <div class="banner">


                <div class="Home u-flex">
                    <article id="homepage-block-main" class="HomeBlock HomeBlock-main">
                        <div class="HomeBlock-image" style="background-image: url(https://d1ovtcjitiy70m.cloudfront.net/vi-1/images/homepage/2016/homeblock_main_desktop_en_GB_v02.jpg);" aria-hidden="true">
                        </div>
                        <div class="HomeBlock-inner HomeBlock-pattern">
                            <h1 class="HomeBlock-title HomeBlock-title--primary u-darkGray">Love getting there</h1>
                            <div class="HomeBlock-content">
                                <p class="HomeBlock-contentText">Carpool in good company.</p>

                                <form id="search-form" class="u-marginNone u-flex js-trip-search-form" action="/search" role="search">
                                    <div class="c-input c-input--half js-trip-search-error-from-container">
                                        <img src="https://d1ovtcjitiy70m.cloudfront.net/vi-1/images/homepage/2016/icon-circle.svg" alt="" aria-hidden="true" class="c-input-icon" width="20" height="20">
                                        <input type="text" id="search_from_name" name="fn" class="c-input-field u-fullWidth place-autocomplete js-trip-search-input-from is-focused" placeholder="" data-autocomplete="name" autocomplete="off" data-js="form-input-from">
                                        <label for="search_from_name" class="c-input-label">
                                            <span>Leaving from...</span>
                                        </label>
                                        <span class="c-input-error js-trip-search-error-from-text"></span>
                                    </div>

                                    <div class="c-input c-input--half js-trip-search-error-to-container">
                                        <img src="https://d1ovtcjitiy70m.cloudfront.net/vi-1/images/homepage/2016/icon-circle.svg" alt="" aria-hidden="true" class="c-input-icon" width="20" height="20">
                                        <input type="text" id="search_to_name" name="tn" class="c-input-field u-fullWidth place-autocomplete js-trip-search-input-to" placeholder="" data-autocomplete="name" autocomplete="off" data-js="form-input-to">
                                        <label for="search_to_name" class="c-input-label">
                                            <span>Going to...</span>
                                        </label>
                                        <span class="c-input-error js-trip-search-error-to-text"></span>
                                    </div>

                                    <div class="c-input c-input--half">
                                        <img src="https://d1ovtcjitiy70m.cloudfront.net/vi-1/images/homepage/2016/icon-calendar.svg" alt="" aria-hidden="true" class="c-input-icon" width="20" height="20">
                                        <input type="text" id="search_to_date" name="db" class="c-input-field datepicker hasDatepicker" readonly="readonly">
                                        <label for="search_to_date" class="c-input-label">
                                            <span>Date</span>
                                        </label>
                                    </div>

                                    <button type="submit" class="c-input--half Home-button c-button c-button--primary c-button--wide js-trip-search-submit">Find a ride</button>

                                    <input type="hidden" name="fc" data-autocomplete="coordinates" data-autocomplete-ref="search_from_name" value="51.442724|6.060873">
                                    <input type="hidden" name="fcc" data-autocomplete="country_code" data-autocomplete-ref="search_from_name" value="NL">
                                    <input type="hidden" name="fp" data-autocomplete="is_precise" data-autocomplete-ref="search_from_name" value="0">
                                    <input type="hidden" name="tc" data-autocomplete="coordinates" data-autocomplete-ref="search_to_name">
                                    <input type="hidden" name="tcc" data-autocomplete="country_code" data-autocomplete-ref="search_to_name">
                                    <input type="hidden" name="tp" data-autocomplete="is_precise" data-autocomplete-ref="search_to_name">
                                </form>

                            </div>
                        </div>
                    </article>

                    <article class="HomeBlock u-lightestGray-bg u-darkGray" id="homepage-block-axes">
                        <div class="HomeBlock-inner">
                            <h2 class="HomeBlock-title">Thousands of departures every day. Where do you want to go?</h2>
                            <div class="HomeBlock-content u-paddingNone">
                                <a href="/ride-sharing/" class="HomeBlock-link HomeBlock-link--toggle" data-js="toggle-seo-axes" data-text-more="See our most popular rides" data-text-less="See fewer rides" aria-expanded="false" aria-controls="seo-axes" role="button">See our most popular rides</a>


                                <ul class="u-reset u-clearfix HomeColumns">
                                    <li class="HomeColumn">

                                        <a href="/search?fn=london&amp;tn=manchester" class="HomeBlock-axis">
                                            <span class="u-truncate HomeBlock-axisCity HomeBlock-axisCity--departure">London</span>
                                            <span class="u-truncate HomeBlock-axisCity HomeBlock-axisCity--arrival">Manchester</span>

                                            <span class="HomeBlock-axisPrice">prices from
                    <strong>£14</strong>
                </span>
                                        </a>
                                    </li>
                                    <li class="HomeColumn HomeColumn--middle">

                                        <a href="/search?fn=edinburgh&amp;tn=newcastle" class="HomeBlock-axis">
                                            <span class="u-truncate HomeBlock-axisCity HomeBlock-axisCity--departure">Edinburgh</span>
                                            <span class="u-truncate HomeBlock-axisCity HomeBlock-axisCity--arrival">Newcastle</span>

                                            <span class="HomeBlock-axisPrice">prices from
                    <strong>£8</strong>
                </span>
                                        </a>
                                    </li>
                                    <li class="HomeColumn">

                                        <a href="/search?fn=bristol&amp;tn=london" class="HomeBlock-axis">
                                            <span class="u-truncate HomeBlock-axisCity HomeBlock-axisCity--departure">Bristol</span>
                                            <span class="u-truncate HomeBlock-axisCity HomeBlock-axisCity--arrival">London</span>

                                            <span class="HomeBlock-axisPrice">prices from
                    <strong>£8</strong>
                </span>
                                        </a>
                                    </li>
                                </ul>



                                <section class="HomeColumns u-clearfix u-hide" data-js="seo-axes" id="seo-axes">
                                    <div class="SeoAxes HomeColumn">
                                        <ul class="u-reset">
                                            <li>
                                                <a class="HomeBlock-axis HomeBlock-axis--small" href="/ride-sharing/london/manchester/">
                                                    <span class="u-truncate u-block">London » Manchester</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a class="HomeBlock-axis HomeBlock-axis--small" href="/ride-sharing/manchester/london/">
                                                    <span class="u-truncate u-block">Manchester » London</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a class="HomeBlock-axis HomeBlock-axis--small" href="/ride-sharing/birmingham/london/">
                                                    <span class="u-truncate u-block">Birmingham » London</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a class="HomeBlock-axis HomeBlock-axis--small" href="/ride-sharing/london/birmingham/">
                                                    <span class="u-truncate u-block">London » Birmingham</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a class="HomeBlock-axis HomeBlock-axis--small" href="/ride-sharing/london/reading/">
                                                    <span class="u-truncate u-block">London » Reading</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a class="HomeBlock-axis HomeBlock-axis--small" href="/ride-sharing/bristol/london/">
                                                    <span class="u-truncate u-block">Bristol » London</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a class="HomeBlock-axis HomeBlock-axis--small" href="/ride-sharing/manchester/birmingham/">
                                                    <span class="u-truncate u-block">Manchester » Birmingham</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="SeoAxes HomeColumn HomeColumn--middle">
                                        <ul class="u-reset">
                                            <li>
                                                <a class="HomeBlock-axis HomeBlock-axis--small" href="/ride-sharing/london/paris/">
                                                    <span class="u-truncate u-block">London » Paris</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a class="HomeBlock-axis HomeBlock-axis--small" href="/ride-sharing/exeter/bristol/">
                                                    <span class="u-truncate u-block">Exeter » Bristol</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a class="HomeBlock-axis HomeBlock-axis--small" href="/ride-sharing/london/bristol/">
                                                    <span class="u-truncate u-block">London » Bristol</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a class="HomeBlock-axis HomeBlock-axis--small" href="/ride-sharing/paris/london/">
                                                    <span class="u-truncate u-block">Paris » London</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a class="HomeBlock-axis HomeBlock-axis--small" href="/ride-sharing/birmingham/manchester/">
                                                    <span class="u-truncate u-block">Birmingham » Manchester</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a class="HomeBlock-axis HomeBlock-axis--small" href="/ride-sharing/bristol/exeter/">
                                                    <span class="u-truncate u-block">Bristol » Exeter</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a class="HomeBlock-axis HomeBlock-axis--small" href="/ride-sharing/london/leeds/">
                                                    <span class="u-truncate u-block">London » Leeds</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="SeoAxes HomeColumn">
                                        <ul class="u-reset">
                                            <li>
                                                <a class="HomeBlock-axis HomeBlock-axis--small" href="/ride-sharing/london/brussels/">
                                                    <span class="u-truncate u-block">London » Brussels</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a class="HomeBlock-axis HomeBlock-axis--small" href="/ride-sharing/calais/london/">
                                                    <span class="u-truncate u-block">Calais » London</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a class="HomeBlock-axis HomeBlock-axis--small" href="/ride-sharing/london/luton/">
                                                    <span class="u-truncate u-block">London » Luton</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a class="HomeBlock-axis HomeBlock-axis--small" href="/ride-sharing/bristol/swindon/">
                                                    <span class="u-truncate u-block">Bristol » Swindon</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a class="HomeBlock-axis HomeBlock-axis--small" href="/ride-sharing/leeds/london/">
                                                    <span class="u-truncate u-block">Leeds » London</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a class="HomeBlock-axis HomeBlock-axis--small" href="/ride-sharing/bristol/birmingham/">
                                                    <span class="u-truncate u-block">Bristol » Birmingham</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a class="HomeBlock-axis HomeBlock-axis--small" href="/ride-sharing/">
                                                    <span class="u-truncate u-block">See all our rides</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </section>

                            </div>
                        </div>
                    </article>

                    <article class="HomeBlock u-lighterGray-bg u-darkGray" id="homepage-block-driver">
                        <div class="HomeBlock-inner">
                            <div class="HomeBlock-media HomeBlock-media--primary">
                                <div class="HomeBlock-image" style="background-image: url(https://d1ovtcjitiy70m.cloudfront.net/vi-1/images/homepage/2016/homeblock_driver_desktop_en_GB_v01.jpg);" aria-hidden="true">
                                </div>
                                <div class="HomeBlock-content HomeBlock-content--even">
                                    <h2 class="HomeBlock-title">Driving somewhere soon?</h2>
                                    <p class="u-marginNone u-space-4">Carpooling with BlaBlaCar means you save and others can travel.</p>
                                    <a href="/offer-seats" class="Home-button Home-button--short c-button c-button--primary c-button--wide">Offer a ride</a>
                                </div>
                            </div>
                        </div>
                    </article>

                    <article class="HomeBlock" id="homepage-block-media">
                        <div class="HomeBlock-inner">
                            <h2 class="HomeBlock-title HomeBlock-title--extraPadding">3 things you'll love about BlaBlaCar</h2>

                            <ol class="HomeColumns u-clearfix">


                                <li class="HomeColumn">
                                    <div class="HomeBlock-icon" aria-hidden="true">
                                        <svg aria-hidden="true" class="u-lightBlue-fill" style="width: 90px; height: 90px;"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#icon-user-checked"></use></svg>

                                    </div>

                                    <div class="HomeBlock-content u-padding-all">
                                        <h3 class="HomeBlock-title HomeBlock-title--secondary u-alignCenter">You're in control</h3>
                                        <p class="u-marginNone u-alignCenter u-gray">Verified member profiles and ratings mean you know exactly who you're travelling with.        </p>

                                    </div>
                                </li>



                                <li class="HomeColumn HomeColumn--middle">
                                    <div class="HomeBlock-icon" aria-hidden="true">
                                        <svg aria-hidden="true" class="u-lightBlue-fill" style="width: 90px; height: 90px;"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#icon-idcheck"></use></svg>

                                    </div>

                                    <div class="HomeBlock-content u-padding-all">
                                        <h3 class="HomeBlock-title HomeBlock-title--secondary u-alignCenter">Carpool with confidence</h3>
                                        <p class="u-marginNone u-alignCenter u-gray">ID verification adds another level of security to member profiles.        </p>

                                    </div>
                                </li>



                                <li class="HomeColumn">
                                    <div class="HomeBlock-icon" aria-hidden="true">
                                        <svg aria-hidden="true" class="u-lightBlue-fill" style="width: 90px; height: 90px;"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#icon-check-shield"></use></svg>

                                    </div>

                                    <div class="HomeBlock-content u-padding-all">
                                        <h3 class="HomeBlock-title HomeBlock-title--secondary u-alignCenter">Your ride is fully insured</h3>
                                        <p class="u-marginNone u-alignCenter u-gray">We partner with AXA to cover your ride from start to finish, absolutely free of charge.                                <a class="HomeBlock-more" href="/insurance-ridesharing">Find out more.</a>
                                        </p>

                                        <div class="PartnerLogo u-alignCenter">
                                            <img src="https://d1ovtcjitiy70m.cloudfront.net/vi-1/images/insurance/axa-logo-center-h96.png" height="48" style="height: 48px;" alt="AXA">
                                        </div>
                                    </div>
                                </li>

                            </ol>
                        </div>
                    </article>

                    <article class="HomeBlock u-lightestGray-bg u-darkGray" id="homepage-block-hiw">
                        <div class="HomeBlock-inner">
                            <h2 class="HomeBlock-title HomeBlock-title--extraPadding">How it works</h2>
                            <div class="HomeBlock-content u-paddingNone">
                                <a class="HomeBlock-link" href="/how-does-car-sharing-work">Find out more</a>
                                <ol class="HomeColumns u-clearfix">
                                    <li class="HomeColumn HomeColumn--smaller">
                                        <h3 class="HomeBlock-title HomeBlock-title--secondary">1. Going somewhere?</h3>
                                        <p class="u-gray u-marginNone">Find people who travel on the same route.</p>
                                    </li>
                                    <li class="HomeColumn HomeColumn--smaller HomeColumn--middle">
                                        <h3 class="HomeBlock-title HomeBlock-title--secondary">2. Get in touch</h3>
                                        <p class="u-gray u-marginNone">Select who you want to travel with.</p>
                                    </li>
                                    <li class="HomeColumn HomeColumn--smaller">
                                        <h3 class="HomeBlock-title HomeBlock-title--secondary">3. Off you go!</h3>
                                        <p class="u-gray u-marginNone">Travel together and give a rating after the ride.</p>
                                    </li>
                                </ol>
                            </div>
                        </div>
                    </article>

                    <article class="HomeBlock" id="homepage-block-blog">
                        <div class="HomeBlock-inner">
                            <h2 class="HomeBlock-title">Carpooling with BlaBlaCar</h2>
                            <div class="HomeBlock-content u-paddingNone">
                                <a class="HomeBlock-link" href="/blablalife/">Visit BlaBlaLife</a>
                                <ul class="HomeColumns u-clearfix">
                                    <li class="BlogThumb HomeColumn">
                                        <a href="/blablalife/going-places/tips/rideshare-football-games">
                                            <span class="BlogThumb-image u-space-4" style="background-image: url(https://s3-eu-west-1.amazonaws.com/bbcwpe-dev/wp-content/uploads/2015/11/24135613/Take-BlaBla-to-Away-Day-Football-300x300.jpg);" aria-hidden="true"></span>
                                            <h3 class="BlogThumb-title HomeBlock-title HomeBlock-title--secondary u-darkGray">Take a BlaBlaCar to your next football games!</h3>
                                            <p class="u-marginNone u-gray">
                                                Go Football mad with BlaBlaCar this season!

                                                <span class="HomeBlock-more">Read more...</span>
                                            </p>
                                        </a>
                                    </li>
                                    <li class="BlogThumb HomeColumn HomeColumn--middle">
                                        <a href="/blablalife/reinventing-travel/environment/lets-tackle-air-pollution">
                                            <span class="BlogThumb-image u-space-4" style="background-image: url(https://s3-eu-west-1.amazonaws.com/bbcwpe-dev/wp-content/uploads/2015/04/10081140/Lets-Tackle-Air-Pollution-420x8401-150x300.jpg);" aria-hidden="true"></span>
                                            <h3 class="BlogThumb-title HomeBlock-title HomeBlock-title--secondary u-darkGray">Let’s Tackle Air Pollution!</h3>
                                            <p class="u-marginNone u-gray">
                                                With devastating long-lasting effects to our atmosphere and our bodies...
                                                <span class="HomeBlock-more">Read more...</span>
                                            </p>
                                        </a>
                                    </li>
                                    <li class="BlogThumb HomeColumn">
                                        <a href="/blablalife/whats-new/no-more-booking-codes">
                                            <span class="BlogThumb-image u-space-4" style="background-image: url(https://s3-eu-west-1.amazonaws.com/bbcwpe/uploads/2017/04/27161643/No%20more%20booking%20codes-300x300.png);" aria-hidden="true"></span>
                                            <h3 class="BlogThumb-title HomeBlock-title HomeBlock-title--secondary u-darkGray">No more booking codes!</h3>
                                            <p class="u-marginNone u-gray">
                                                Can’t find your booking codes? Not to worry! We got rid of them!

                                                <span class="HomeBlock-more">Read more...</span>
                                            </p>
                                        </a>
                                    </li>
                                </ul>

                            </div>
                        </div>
                    </article>
                </div>


            </div>
        </div>
    </div>
</section>
<tags:footer></tags:footer>
<tags:basejs></tags:basejs>
</body>
</html>