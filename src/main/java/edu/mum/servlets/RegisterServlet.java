package edu.mum.servlets;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import edu.mum.util.Constants;
import org.apache.log4j.Logger;

/**
 * Created by Bi on 9/24/17.
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/register"})
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    static Logger logger = Logger.getLogger(RegisterServlet.class);

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String gender = request.getParameter("gender");
        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String passwordConfirm = request.getParameter("confirm-password");
        String yearOfBirth = request.getParameter("year-of-birth");
        String errorMsg = null;
        if (gender == null) {
            errorMsg = "Gender can't be null or empty.";
        }
        if (firstName == null || firstName.equals("")) {
            errorMsg = "First name can't be null or empty.";
        }
        if (lastName == null || lastName.equals("")) {
            errorMsg = "Last name can't be null or empty.";
        }
        if (email == null || email.equals("")) {
            errorMsg = "Email ID can't be null or empty.";
        }
        if (password == null || password.equals("")) {
            errorMsg = "Password can't be null or empty.";
        }
        if (passwordConfirm == null || passwordConfirm.equals("")) {
            errorMsg = "Password confirm can't be null or empty.";
        }
        if (!passwordConfirm.equals(password)) {
            errorMsg = "Password and password confirm must be the same.";
        }
        if (yearOfBirth == null || yearOfBirth.equals("0")) {
            errorMsg = "Please select Year of birth";
        }

        if (errorMsg != null) {
            request.setAttribute("errorMsg", errorMsg);
            RequestDispatcher rd = getServletContext().getRequestDispatcher(Constants.URL_JSP_SIGN_UP);
            rd.forward(request, response);
        } else {
            Connection con = (Connection) getServletContext().getAttribute("DBConnection");
            PreparedStatement ps = null;
            try {
                ps = con.prepareStatement("insert into Users(firstName, lastName, email, password, yearOfBirth, gender) values (?,?,?,?,?,?)");
                ps.setString(1, firstName);
                ps.setString(2, lastName);
                ps.setString(3, email);
                ps.setString(4, password);
                ps.setString(5, yearOfBirth);
                ps.setString(6, gender);

                ps.execute();

                logger.info("User registered with email=" + email);

                //forward to login page to login
                RequestDispatcher rd = getServletContext().getRequestDispatcher(Constants.URL_JSP_LOG_IN);
                PrintWriter out = response.getWriter();
                out.println("<font color=green>Registration successful, please login below.</font>");
                rd.include(request, response);
            } catch (SQLException e) {
                e.printStackTrace();
                logger.error("Database connection problem");
                throw new ServletException("DB Connection problem.");
            } finally {
//                try {
//                    ps.close();
//                } catch (SQLException e) {
//                    logger.error("SQLException in closing PreparedStatement");
//                }
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher(Constants.URL_JSP_SIGN_UP).forward(request, response);
    }
}
