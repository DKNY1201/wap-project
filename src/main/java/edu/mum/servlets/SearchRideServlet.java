package edu.mum.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


import edu.mum.models.Ride;
import edu.mum.repositories.RideRepository;
import edu.mum.repositories.UserRepository;
import edu.mum.utils.Constants;
import org.apache.log4j.Logger;

/**
 * Created by Bi on 9/26/17.
 */
@WebServlet(name = "SearchRideServlet", urlPatterns = {"/search"})
public class SearchRideServlet extends HttpServlet {

    static Logger logger = Logger.getLogger(SearchRideServlet.class);

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RideRepository rideRepository = new RideRepository();

        List<Ride> rides = rideRepository.getRides("fa");

        request.setAttribute("rides", rides);
        request.getRequestDispatcher(Constants.URL_JSP_SEARCH).forward(request, response);
//        for (Ride ride: rides) {
//            logger.info("Got ride: Pick up point: " + ride.getPickupPoint());
//        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       doGet(request, response);
    }
}
