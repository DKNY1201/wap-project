package edu.mum.controllers;

import edu.mum.utils.Constants;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Bi on 9/27/17.
 */
@WebServlet(name = "BookingHistoryController", urlPatterns = {"/booking_history"})
public class BookingHistoryController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher(Constants.URL_JSP_BOOKING_HISTORY).include(request, response);
    }
}
