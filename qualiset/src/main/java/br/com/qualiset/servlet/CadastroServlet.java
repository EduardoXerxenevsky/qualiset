package br.com.qualiset.servlet;

import br.com.qualiset.dao.UserDAO;

import br.com.qualiset.dao.UserDAO;
import br.com.qualiset.model.User;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/cadastro")
public class CadastroServlet extends HttpServlet {

    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {

        userDAO = new UserDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = new User(username, password);

            userDAO.cadastro(user);
            System.out.println("Usuário salvo com sucesso!");

        request.getRequestDispatcher("pages/login.html").forward(request, response);

    }
}