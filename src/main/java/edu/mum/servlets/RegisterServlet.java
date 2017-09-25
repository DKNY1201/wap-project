package edu.mum.servlets;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import edu.mum.repositories.UserRepository;
import edu.mum.models.User;
import edu.mum.utils.Constants;
import edu.mum.utils.ValidationUtils;
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
            errorMsg = Constants.EMPTY_GENDER;
        }
        if (firstName == null || firstName.equals("")) {
            errorMsg = Constants.EMPTY_FIRSTNAME;
        }
        if (lastName == null || lastName.equals("")) {
            errorMsg = Constants.EMPTY_LASTNAME;
        }
        if (email == null || email.equals("")) {
            errorMsg = Constants.EMPTY_EMAIL;
        }
        if (!ValidationUtils.verifyEmail(email)) {
            errorMsg = Constants.ERROR_EMAIL_PATTERN;
        }
        if (password == null || password.equals("")) {
            errorMsg = Constants.EMPTY_PASSWORD;
        }
        if (!ValidationUtils.verifyPassword(password)) {
            errorMsg = Constants.ERROR_PASSWORD_PATTERN;
        }
        if (passwordConfirm == null || passwordConfirm.equals("")) {
            errorMsg = Constants.EMPTY_PASSWORD_COMFIRM;
        }
        if (!passwordConfirm.equals(password)) {
            errorMsg = Constants.NOT_SAME_CONFIRM_PASSWORD;
        }
        if (yearOfBirth == null || yearOfBirth.equals("0")) {
            errorMsg = Constants.EMPTY_YEAR_OF_BIRTH;
        }

        if (errorMsg != null) {
            request.setAttribute("errorMsg", errorMsg);
            RequestDispatcher rd = getServletContext().getRequestDispatcher(Constants.URL_JSP_SIGN_UP);
            rd.forward(request, response);
        } else {
            UserRepository userRepository = new UserRepository();

            if (userRepository.createUser(firstName, lastName, email, password, yearOfBirth, gender)) {
                logger.info("Create an account with these information \n First name: " + firstName
                        + ", " + " First name: " + firstName
                        + ", " + " Last name: " + firstName
                        + ", " + " Email: " + email
                        + ", " + " Year of birth: " + yearOfBirth
                        + ", " + " Gender: " + gender
                );
                User user = userRepository.getUser(email, password);
                if (user != null) {
                    request.getSession().setAttribute("sesUser", user);
                    response.sendRedirect(request.getContextPath());
                }
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher(Constants.URL_JSP_SIGN_UP).forward(request, response);
    }
}
