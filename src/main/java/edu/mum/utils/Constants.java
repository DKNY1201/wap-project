package edu.mum.utils;

/**
 * Created by Bi on 9/24/17.
 */
public class Constants {

    public static final String SITE_NAME = "Chalo Chalo in car";

    public static final String[] SECURE_PATHS = {"/dashboard", "/logout", "/offerride"};

    // URL
    public static final String URL_LOGIN = "/login";
    public static final String URL_JSP_SIGN_UP = "/WEB-INF/views/register.jsp";
    public static final String URL_JSP_LOG_IN = "/WEB-INF/views/login.jsp";
    public static final String URL_JSP_LOG_OUT = "/WEB-INF/views/logout.jsp";
    public static final String URL_JSP_OFFER_RIDE = "/WEB-INF/views/offerride.jsp";
    public static final String URL_JSP_SEARCH = "/WEB-INF/views/search.jsp";
    public static final String URL_JSP_RIDEDETAIL = "/WEB-INF/views/ridedetail.jsp";
    public static final String HOMEPAGE = "index.jsp";

    // Error messages
    public static final String WRONG_EMAIL_PASSWORD = "Username or password is invalid";
    public static final String EMPTY_GENDER = "Gender can't be null or empty.";
    public static final String EMPTY_FIRSTNAME = "First name can't be null or empty.";
    public static final String EMPTY_LASTNAME = "Last name can't be null or empty.";
    public static final String EMPTY_EMAIL = "Email ID can't be null or empty.";
    public static final String ERROR_EMAIL_PATTERN = "Email doesn't meet the requirement.";
    public static final String EMPTY_PASSWORD = "Password can't be null or empty.";
    public static final String ERROR_PASSWORD_PATTERN = "Password doesn't meet the requirement.";
    public static final String EMPTY_PASSWORD_COMFIRM = "Password confirm can't be null or empty.";
    public static final String NOT_SAME_CONFIRM_PASSWORD = "Password and password confirm must be the same.";
    public static final String EMPTY_YEAR_OF_BIRTH = "Please select Year of birth";

    public static final String EMPTY_PICKUP = "Pick up point can't be null or empty.";
    public static final String EMPTY_DROPOFF = "Drop off point can't be null or empty.";
    public static final String EMPTY_START_DATETIME = "Start time can't be null or empty.";
    public static final String EMPTY_RETURN_DATETIME = "Return time can't be null or empty.";
    public static final String START_DATETIME_AFTER_RETURN_DATETIME = "Start time can't be after return time.";
    public static final String EMPTY_PRICE = "Price can't be null or empty.";
    public static final String EMPTY_NUM_OF_SEAT = "Number of seat can't be null or empty.";
    public static final String EMPTY_START_RIDE_DETAIL = "Start ride detail can't be null or empty.";
    public static final String EMPTY_RETURN_RIDE_DETAIL = "Return ride detail can't be null or empty.";
    public static final String EMPTY_MAX_LUGGAGE = "Max luggage can't be null or empty.";
    public static final String EMPTY_PICKUP_FLEXIBILITY = "Pickup flexibility can't be null or empty.";
}
