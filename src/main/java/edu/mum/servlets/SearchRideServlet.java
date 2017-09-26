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

        String pickupPoint = request.getParameter("pickupPoint") != null ? request.getParameter("pickupPoint") : "";
        String dropoffPoint = request.getParameter("dropoffPoint") != null ? request.getParameter("dropoffPoint") : "";

        RideRepository rideRepository = new RideRepository();
        List<Ride> rides = rideRepository.getRides(pickupPoint, dropoffPoint);

        request.setAttribute("rides", rides);
        request.getRequestDispatcher(Constants.URL_JSP_SEARCH).forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       doPost(request, response);
    }
}
