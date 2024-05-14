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

    private UserDAO userDAO; // Adicionamos uma instância do UserDAO

    @Override
    public void init() throws ServletException {
        // Inicializamos o UserDAO aqui
        userDAO = new UserDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Criamos um objeto User com os dados recebidos
        User user = new User(username, password);

        // Chamamos o método do DAO para salvar o usuário no banco de dados

            userDAO.cadastro(user);
            System.out.println("Usuário salvo com sucesso!");


        // Redirecionamos para a página de tabela
        request.getRequestDispatcher("pages/login.html").forward(request, response);

    }
}