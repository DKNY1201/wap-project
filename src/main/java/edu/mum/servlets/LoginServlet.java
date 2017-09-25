package edu.mum.servlets;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import edu.mum.repositories.UserRepository;
import edu.mum.utils.Constants;
import org.apache.log4j.Logger;
import edu.mum.models.*;

/**
 * Created by Quy on 9/22/17.
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {
    static Logger logger = Logger.getLogger(LoginServlet.class);

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String errorMsg = null;
        if (email == null || email.equals("")) {
            errorMsg = "User Email can't be null or empty";
        }
        if (password == null || password.equals("")) {
            errorMsg = "Password can't be null or empty";
        }

        if (errorMsg != null) {
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/login.html");
            PrintWriter out = response.getWriter();
            out.println("<font color=red>" + errorMsg + "</font>");
            rd.include(request, response);
        } else {
            UserRepository userRepository = new UserRepository();
            User user = userRepository.getUser(email, password);
            if (user != null) {
                request.getSession().setAttribute("sesUser", user);
                response.sendRedirect(request.getContextPath());
                return;
            }

            RequestDispatcher rd = request.getRequestDispatcher(Constants.URL_JSP_LOG_IN);
            errorMsg = Constants.WRONG_EMAIL_PASSWORD;
            request.setAttribute("errorMsg", errorMsg);
            rd.forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
    }
}

