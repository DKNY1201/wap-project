package edu.mum.utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by Bi on 9/25/17.
 */
public class ValidationUtils {
    private static final String PASSWORD_PATTERN = ".{8,}";
    private static final String EMAIL_PATTERN = "[a-zA-Z0-9_\\-]+@(([a-zA-Z_\\-])+\\.)+[a-zA-Z]{2,4}";

    public static boolean verifyPassword(String password) {
        Pattern pattern = Pattern.compile(PASSWORD_PATTERN);
        Matcher matcher = pattern.matcher(password);
        return matcher.matches();
    }

    public static boolean verifyEmail(String email) {
        Pattern pattern = Pattern.compile(EMAIL_PATTERN);
        Matcher matcher = pattern.matcher(email);
        return matcher.matches();
    }
}
