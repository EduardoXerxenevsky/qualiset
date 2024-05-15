package br.com.qualiset.servlet;

import br.com.qualiset.model.Cart;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/process-checkout")
public class ProcessCheckoutServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Cart cart = (Cart) session.getAttribute("cart");


        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String address = req.getParameter("address");
        String cardName = req.getParameter("card-name");
        String cardNumber = req.getParameter("card-number");
        String cardExpiry = req.getParameter("card-expiry");
        String cardCvv = req.getParameter("card-cvv");


        session.removeAttribute("cart");

        req.setAttribute("name", name);
        req.getRequestDispatcher("pages/confirmation.jsp").forward(req, resp);
    }
}
