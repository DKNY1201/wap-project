package edu.mum.controllers;

import edu.mum.models.Booking;
import edu.mum.models.Ride;
import edu.mum.repositories.BookingRepository;
import edu.mum.repositories.RideRepository;
import edu.mum.utils.Constants;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by Bi on 9/26/17.
 */
@WebServlet(name = "RideDetailController", urlPatterns = {"/ridedetail"})
public class RideDetailController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String rideID = request.getParameter("rideID");

        RideRepository rideRepository = new RideRepository();
        Ride ride = rideRepository.getRideById(rideID);

        request.setAttribute("ride", ride);

        BookingRepository bookingRepository = new BookingRepository();
        List<Booking> bookings = bookingRepository.getBookingByRideID(rideID);

        int numOfBookedSeat = 0;

        for (Booking booking: bookings) {
            numOfBookedSeat += booking.getNumOfSeat();
        }

        int numOfAvailableSeat = ride.getNumOfSeat() - numOfBookedSeat;

        request.setAttribute("numOfAvailableSeat", numOfAvailableSeat);

        request.getRequestDispatcher(Constants.URL_JSP_RIDEDETAIL).forward(request, response);
    }
}
