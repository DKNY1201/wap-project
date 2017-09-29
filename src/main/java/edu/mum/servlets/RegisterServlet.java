package edu.mum.servlets;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;

import edu.mum.repositories.UserRepository;
import edu.mum.models.User;
import edu.mum.utils.Constants;
import edu.mum.utils.FileUtils;
import edu.mum.utils.ValidationUtils;
import org.apache.log4j.Logger;

/**
 * Created by Bi on 9/24/17.
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/register"})
@MultipartConfig(fileSizeThreshold=1024*1024*10,
        maxFileSize=1024*1024*50,
        maxRequestSize=1024*1024*100,
        location="/")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    static Logger logger = Logger.getLogger(RegisterServlet.class);
    private static final String UPLOAD_DIR = "uploads/profile_picture";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String gender = request.getParameter("gender");
        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String passwordConfirm = request.getParameter("confirm-password");
        String yearOfBirth = request.getParameter("yearOfBirth");

        boolean isError = false;
        if (gender == null) {
            isError = true;
            request.setAttribute("errGender",Constants.EMPTY_GENDER );
        }
        if (firstName == null || firstName.equals("")) {
            isError = true;
            request.setAttribute("errFirstname",Constants.EMPTY_FIRSTNAME );
        }
        if (lastName == null || lastName.equals("")) {
            isError = true;
            request.setAttribute("errLastname",Constants.EMPTY_LASTNAME);
        }
        logger.info("email123: " + email);
        if (email == null || email.equals("")) {
            isError = true;
            request.setAttribute("errEmail",Constants.EMPTY_EMAIL);
        } else {
            if (!ValidationUtils.verifyEmail(email)) {
                isError = true;
                request.setAttribute("errEmailVerify",Constants.ERROR_EMAIL_PATTERN);
            }
        }

        if (password == null || password.equals("")) {
            isError = true;
            request.setAttribute("errPassword",Constants.EMPTY_PASSWORD);
        }
        if (!ValidationUtils.verifyPassword(password)) {
            isError = true;
            request.setAttribute("errPasswordPattern",Constants.ERROR_PASSWORD_PATTERN);
        }
        if (passwordConfirm == null || passwordConfirm.equals("")) {
            isError = true;
            request.setAttribute("errConfirmPassword",Constants.EMPTY_PASSWORD);
        }
        if (!passwordConfirm.equals(password)) {
            isError = true;
            request.setAttribute("errPasswordNotEqual",Constants.NOT_SAME_CONFIRM_PASSWORD);
        }

        // Profile Picture
        // gets absolute path of the web application
        String applicationPath = request.getServletContext().getRealPath("");
        // constructs path of the directory to save uploaded file
        String uploadFilePath = applicationPath + File.separator + UPLOAD_DIR;

        // creates the save directory if it does not exists
        File fileSaveDir = new File(uploadFilePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdirs();
        }

        String fileName = null;
        String profilePicturePath = null;
        //Get all the parts from request and write it to the file on server
        System.out.println("request.getParts().size = " + request.getParts().size());
        for (Part part : request.getParts()) {
            if (part.getName().equals("profile_picture")) {
                fileName = FileUtils.getFileName(part);
                String pathToWriteFile = uploadFilePath + File.separator + fileName;
                part.write(pathToWriteFile);
                profilePicturePath = UPLOAD_DIR + File.separator + fileName;
            }
        }

        if (profilePicturePath == null || profilePicturePath.equals("")) {
            isError = true;
            request.setAttribute("errProfilePicture", Constants.ERROR_PROFILE_PICTURE);
        }
        // End Profile Picture


        if (yearOfBirth == null || yearOfBirth.equals("0")) {
            isError = true;
            request.setAttribute("errYearOfBirth",Constants.EMPTY_PASSWORD);
        }

        UserRepository userRepository = new UserRepository();

        if(userRepository.getUserByEmail(email)!=null) {
            isError = true;
            request.setAttribute("errEmail", Constants.ERROR_EMAIL_EXISTS);
        }

        if (isError){
            RequestDispatcher rd = getServletContext().getRequestDispatcher(Constants.URL_JSP_SIGN_UP);
            rd.forward(request, response);
        } else {
                if (userRepository.createUser(firstName, lastName, email, password, yearOfBirth, gender, profilePicturePath)) {
                    logger.info("Create an account with these information \n First name: " + firstName
                            + ", " + " Last name: " + lastName
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
        request.setAttribute("currentPage", "signup");
        request.getRequestDispatcher(Constants.URL_JSP_SIGN_UP).forward(request, response);
    }
}
