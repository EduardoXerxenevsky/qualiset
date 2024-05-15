package br.com.qualiset.servlet;

import br.com.qualiset.dao.UserDAO;
import br.com.qualiset.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.getRequestDispatcher("/pages/login.html").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String username = req.getParameter("usernam");
        String password = req.getParameter("passwor");

        User user = new User(username, password);

        boolean isValidUser = new UserDAO().verifyCredentials(user);
        System.out.println(username);
        System.out.println(password);
        System.out.println(user.getUsername());
        System.out.println(user.getPassword());
        System.out.println(isValidUser);
        if (isValidUser) {
        System.out.println("logado");
            req.getSession().setAttribute("loggedUser", username);

            resp.sendRedirect("create-products");

        } else {

            req.setAttribute("message", "Invalid credentials!");

            req.getRequestDispatcher("pages/login.html").forward(req, resp);

        }

    }

}