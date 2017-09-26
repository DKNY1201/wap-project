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
        String isRoundTrip = request.getParameter("isRoundTrip");
        String startDatetime = request.getParameter("startDatetime");
        String returnDatetime = request.getParameter("returnDatetime");
        String price = request.getParameter("price");
        String numOfSeat = request.getParameter("numOfSeat");
        String startRideDetail = request.getParameter("startRideDetail");
        String returnRideDetail = request.getParameter("returnRideDetail");
        String maxLuggage = request.getParameter("maxLuggage");
        String pickupFlexibility = request.getParameter("pickupFlexibility");

        String errorMsg = "";

        if (pickupPoint == null || pickupPoint.equals("")) {
            errorMsg = Constants.EMPTY_PICKUP;
        }
        if (dropoffPoint == null || dropoffPoint.equals("")) {
            errorMsg += "<br/>" + Constants.EMPTY_DROPOFF;
        }
        if (isRoundTrip != null && isRoundTrip.equals("on")) {
            isRoundTrip = "1";
        } else {
            isRoundTrip = "0";
        }

        if (startDatetime == null || startDatetime.equals("")) {
            errorMsg += "<br/>" +  Constants.EMPTY_START_DATETIME;
        }
        if (returnDatetime == null || returnDatetime.equals("")) {
            errorMsg += "<br/>" +  Constants.EMPTY_RETURN_DATETIME;
        }

        LocalDateTime startLocalDateTime = LocalDateTime.parse(startDatetime);
        LocalDateTime returnLocalDateTime = LocalDateTime.parse(returnDatetime);
        logger.info("startLocalDateTime:" + startLocalDateTime);
        logger.info("returnLocalDateTime:" + returnLocalDateTime);
        if (startLocalDateTime.isAfter(returnLocalDateTime)) {
            errorMsg += "<br/>" +  Constants.START_DATETIME_AFTER_RETURN_DATETIME;
        }


        if (price == null || price.equals("")) {
            errorMsg += "<br/>" +  Constants.EMPTY_PRICE;
        }
        if (numOfSeat == null || numOfSeat.equals("") || numOfSeat.equals("0")) {
            errorMsg += "<br/>" +  Constants.EMPTY_NUM_OF_SEAT;
        }
        if (startRideDetail == null || startRideDetail.equals("")) {
            errorMsg += "<br/>" +  Constants.EMPTY_START_RIDE_DETAIL;
        }
        if (returnRideDetail == null || returnRideDetail.equals("")) {
            errorMsg += "<br/>" +  Constants.EMPTY_RETURN_RIDE_DETAIL;
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

            if (rideRepository.createRide(pickupPoint, dropoffPoint, isRoundTrip, startDatetime, returnDatetime, price,
                    numOfSeat, startRideDetail, returnRideDetail, maxLuggage, pickupFlexibility, email)) {
                logger.info("Create a ride with these information \n Pickup point: " + pickupPoint
                        + ", " + " dropoffPoint: " + dropoffPoint
                        + ", " + " isRoundTrip: " + isRoundTrip
                        + ", " + " startDatetime: " + startDatetime
                        + ", " + " returnDatetime: " + returnDatetime
                        + ", " + " price: " + price
                        + ", " + " numOfSeat: " + numOfSeat
                        + ", " + " startRideDetail: " + startRideDetail
                        + ", " + " returnRideDetail: " + returnRideDetail
                        + ", " + " maxLuggage: " + maxLuggage
                        + ", " + " pickupFlexibility: " + pickupFlexibility
                        + ", " + " email: " + email
                );
                response.sendRedirect(request.getContextPath());
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher(Constants.URL_JSP_OFFER_RIDE).forward(request, response);
    }
}
