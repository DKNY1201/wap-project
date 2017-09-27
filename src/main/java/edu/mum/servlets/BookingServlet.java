package edu.mum.servlets;

import edu.mum.models.User;
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
        int userID;

        String rideID = request.getParameter("rideID");

        if (user == null) {
            logger.error("Must log in for book a ride");
            request.setAttribute("backURL", request.getHeader("Referer"));

            request.getRequestDispatcher(Constants.URL_JSP_LOG_IN).forward(request, response);
        } else {
            userID = user.getId();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
