package br.com.qualiset.servlet;

import br.com.qualiset.dao.AffiliateDao;
import br.com.qualiset.model.Affiliate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/process-affiliate")
public class ProcessAffiliateServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        int followers = Integer.parseInt(req.getParameter("followers"));
        String coupon = req.getParameter("coupon");

        if (followers >= 15000) {
            Affiliate affiliate = new Affiliate(name, email, phone, followers, coupon, 0.15);
            try {
                new AffiliateDao().createAffiliate(affiliate);
                req.getSession().setAttribute("affiliateCoupon", coupon);
                req.getSession().setAttribute("discount", 0.15); // 15% discount
                req.getRequestDispatcher("pages/confirmacao-afiliado.jsp").forward(req, resp);
            } catch (SQLException e) {
                req.setAttribute("message", "Erro ao criar o afiliado: " + e.getMessage());
                req.getRequestDispatcher("pages/afiliado.jsp").forward(req, resp);
            }
        } else {
            req.setAttribute("message", "Desculpe, você não tem seguidores suficientes para se tornar um afiliado.");
            req.getRequestDispatcher("pages/rejeicao-afiliado.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "GET method is not supported.");
    }
}
