package edu.mum.controllers;

import edu.mum.models.*;
import edu.mum.repositories.BookingRepository;
import edu.mum.repositories.RideRepository;
import edu.mum.utils.Constants;

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
@WebServlet(name = "RideOfferHistoryController", urlPatterns = {"/ride_offer_history"})
public class RideOfferHistoryController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RideRepository rideRepository = new RideRepository();
        User user = (User) request.getSession().getAttribute("sesUser");
        List<Ride> rides = rideRepository.getRidesByUserEmail(user.getEmail());

        List<RideBookingSeat> rideBookingSeats = new ArrayList<>();
        for (Ride ride: rides) {
            String rideID = "" +ride.getId();
            BookingRepository bookingRepository = new BookingRepository();
            List<Booking> bookings = bookingRepository.getBookingByRideID(rideID);

            int numOfBookedSeat = 0;

            for (Booking booking: bookings) {
                numOfBookedSeat += booking.getNumOfSeat();
            }

            int numOfAvailableSeat = ride.getNumOfSeat() - numOfBookedSeat;

            RideBookingSeat rideBookingSeat = new RideBookingSeat(ride, numOfAvailableSeat);
            if (numOfAvailableSeat > 0) {
                rideBookingSeats.add(rideBookingSeat);
            }
        }

        request.setAttribute("rideBookingSeats", rideBookingSeats);

        request.getRequestDispatcher(Constants.URL_JSP_RIDE_OFFER_HISTORY).include(request, response);
    }
}
