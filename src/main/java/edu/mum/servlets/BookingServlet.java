package edu.mum.servlets;

import edu.mum.models.User;
import edu.mum.repositories.BookingRepository;
import edu.mum.utils.Constants;
import org.apache.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Bi on 9/26/17.
 */
@WebServlet(name = "BookingServlet", urlPatterns = {"/booking"})
public class BookingServlet extends HttpServlet {

    static Logger logger = Logger.getLogger(LoginServlet.class);

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String numOfSeat = request.getParameter("numOfSeat");
        User user = (User) request.getSession().getAttribute("sesUser");
        String rideID = request.getParameter("rideID");

        if (user == null) {
            logger.error("Must log in for book a ride");
            request.setAttribute("backURL", request.getHeader("Referer"));
            request.getRequestDispatcher(Constants.URL_JSP_LOG_IN).forward(request, response);
            return;
        } else {
            String userID = "" + user.getId();
            if (numOfSeat == null || numOfSeat.isEmpty()) {
                logger.error("We need num of seat to book a ride");
            }

            if (rideID == null || rideID.isEmpty()) {
                logger.error("We need ride ID to book a ride");
            }

            BookingRepository bookingRepository = new BookingRepository();
            bookingRepository.createBooking(userID, rideID, numOfSeat);
            logger.info("Booking successful: userID: " + userID + ", rideID: " + rideID + ", numOfSeat:" + numOfSeat);


            request.getRequestDispatcher(Constants.URL_JSP_BOOKING_SUCCESS).forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
