package edu.mum.servlets;

import edu.mum.models.User;
import edu.mum.repositories.RideRepository;
import edu.mum.utils.Constants;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

import edu.mum.utils.ValidationUtils;
import org.apache.log4j.Logger;

/**
 * Created by Bi on 9/25/17.
 */
@WebServlet(name = "OfferRideServlet", urlPatterns = {"/offerride"})
public class OfferRideServlet extends HttpServlet {
    static Logger logger = Logger.getLogger(RegisterServlet.class);

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pickupPoint = request.getParameter("pickupPoint");
        String dropoffPoint = request.getParameter("dropoffPoint");
        String startDatetime = request.getParameter("startDatetime");
        String price = request.getParameter("price");
        String numOfSeat = request.getParameter("numOfSeat");
        String startRideDetail = request.getParameter("startRideDetail");
        String maxLuggage = request.getParameter("maxLuggage");
        String pickupFlexibility = request.getParameter("pickupFlexibility");

        String errorMsg = "";

        if (pickupPoint == null || pickupPoint.equals("")) {
            errorMsg = Constants.EMPTY_PICKUP;
        }
        if (dropoffPoint == null || dropoffPoint.equals("")) {
            errorMsg += "<br/>" + Constants.EMPTY_DROPOFF;
        }

        if (startDatetime == null || startDatetime.equals("")) {
            errorMsg += "<br/>" +  Constants.EMPTY_START_DATETIME;
        } else {
            startDatetime = startDatetime.replace("/", "-");
            startDatetime += ":00";
            logger.info("startLocalDateTime:" + startDatetime);
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            LocalDateTime date = LocalDateTime.parse(startDatetime, formatter);
            if (LocalDateTime.now().isAfter(date)) {
                errorMsg += "<br/>" +  Constants.START_DATETIME_IN_PAST;
            }
        }

        if (price == null || price.equals("")) {
            errorMsg += "<br/>" +  Constants.EMPTY_PRICE;
        }
        if (!ValidationUtils.verifyNumber(price)) {
            errorMsg += "<br/>" +  Constants.PRICE_NOT_A_NUMBER;
        }
        if (numOfSeat == null || numOfSeat.equals("") || numOfSeat.equals("0")) {
            errorMsg += "<br/>" +  Constants.EMPTY_NUM_OF_SEAT;
        }
        if (!ValidationUtils.verifyNumber(numOfSeat)) {
            errorMsg += "<br/>" +  Constants.NUM_OF_SEAT_NOT_A_NUMBER;
        }
        if (startRideDetail == null || startRideDetail.equals("")) {
            errorMsg += "<br/>" +  Constants.EMPTY_START_RIDE_DETAIL;
        }
        if (maxLuggage == null || maxLuggage.equals("")) {
            errorMsg += "<br/>" +  Constants.EMPTY_MAX_LUGGAGE;
        }
        if (pickupFlexibility == null || pickupFlexibility.equals("")) {
            errorMsg += "<br/>" +  Constants.EMPTY_PICKUP_FLEXIBILITY;
        }

        if (!errorMsg.equals("")) {
            request.setAttribute("errorMsg", errorMsg);
            RequestDispatcher rd = getServletContext().getRequestDispatcher(Constants.URL_JSP_OFFER_RIDE);
            rd.forward(request, response);
        } else {
            RideRepository rideRepository = new RideRepository();

            User user = (User) request.getSession().getAttribute("sesUser");
            String email = user.getEmail();

            if (rideRepository.createRide(pickupPoint, dropoffPoint,"0", startDatetime, null, price,
                    numOfSeat, startRideDetail, "null", maxLuggage, pickupFlexibility, email)) {
                logger.info("Create a ride with these information \n Pickup point: " + pickupPoint
                        + ", " + " dropoffPoint: " + dropoffPoint
                        + ", " + " isRoundTrip: " + "null"
                        + ", " + " startDatetime: " + startDatetime
                        + ", " + " returnDatetime: " + "null"
                        + ", " + " price: " + price
                        + ", " + " numOfSeat: " + numOfSeat
                        + ", " + " startRideDetail: " + startRideDetail
                        + ", " + " returnRideDetail: " + "null"
                        + ", " + " maxLuggage: " + maxLuggage
                        + ", " + " pickupFlexibility: " + pickupFlexibility
                        + ", " + " email: " + email
                );

                response.sendRedirect(request.getContextPath() + Constants.URL_RIDE_OFFER_HISTORY);
            }

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("currentPage", "offerride");
        request.getRequestDispatcher(Constants.URL_JSP_OFFER_RIDE).forward(request, response);
    }
}
