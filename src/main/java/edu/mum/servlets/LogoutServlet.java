package edu.mum.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

import edu.mum.utils.Constants;
import org.apache.log4j.Logger;

/**
 * Created by Bi on 9/22/17.
 */
@WebServlet(name = "LogoutServlet", urlPatterns = {"/logout"})
public class LogoutServlet extends HttpServlet {
    static Logger logger = Logger.getLogger(LogoutServlet.class);

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("JSESSIONID")) {
                    logger.info("User logout with JSESSIONID: " + cookie.getValue());
                    break;
                }
            }
        }

        //invalidate the session if exists
        HttpSession session = request.getSession(false);
        logger.info("User logout: " + session.getAttribute("sesUser"));
        if (session != null) {
            session.invalidate();
        }
        response.sendRedirect(Constants.HOMEPAGE);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
