package edu.mum.filters;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import org.apache.log4j.Logger;

/**
 * Created by Bi on 9/23/17.
 */
@WebFilter(filterName = "AuthenticationFilter", urlPatterns = { "/*" })
public class AuthenticationFilter implements Filter {
    private ServletContext context;

    private Logger logger = Logger.getLogger(AuthenticationFilter.class);

    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;

        String uri = request.getRequestURI();
        logger.info("Requested Resource::" + uri);

        HttpSession session = request.getSession(false);

        if (session == null && !(uri.endsWith("html") || uri.endsWith("login") || uri.endsWith("register"))) {
            logger.error("Unauthorized access request");
            response.sendRedirect("login.html");
        } else {
            // pass the request along the filter chain
            chain.doFilter(request, response);
        }
    }

    public void init(FilterConfig config) throws ServletException {
        logger.info("AuthenticationFilter initialized");
    }

}
