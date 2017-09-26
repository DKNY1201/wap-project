package edu.mum.controllers;

import edu.mum.models.Ride;
import edu.mum.repositories.RideRepository;
import edu.mum.utils.Constants;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

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

        request.getRequestDispatcher(Constants.URL_JSP_RIDEDETAIL).forward(request, response);
    }
}
