package edu.mum.controllers;

import edu.mum.models.Booking;
import edu.mum.models.Ride;
import edu.mum.models.RideBooking;
import edu.mum.repositories.BookingRepository;
import edu.mum.utils.Constants;
import edu.mum.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Bi on 9/27/17.
 */
@WebServlet(name = "BookingHistoryController", urlPatterns = {"/booking_history"})
public class BookingHistoryController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BookingRepository bookingRepository = new BookingRepository();
        User user = (User) request.getSession().getAttribute("sesUser");
        List<Booking> bookings = bookingRepository.getBookingByUserID("" + user.getId());

        List<RideBooking> rideBookings = new ArrayList<>();

        for (Booking booking: bookings) {
            Ride ride = booking.getRide();
            RideBooking rideBooking = new RideBooking(ride, booking);
            rideBookings.add(rideBooking);
        }

        request.setAttribute("rideBookings", rideBookings);

        request.getRequestDispatcher(Constants.URL_JSP_BOOKING_HISTORY).include(request, response);
    }
}
