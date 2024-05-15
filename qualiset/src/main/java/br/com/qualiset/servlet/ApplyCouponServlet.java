package br.com.qualiset.servlet;

import br.com.qualiset.dao.AffiliateDao;
import br.com.qualiset.model.Affiliate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/apply-coupon")
public class ApplyCouponServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String coupon = req.getParameter("coupon");
        HttpSession session = req.getSession();

        try {
            Affiliate affiliate = new AffiliateDao().getAffiliateByCoupon(coupon);
            if (affiliate != null) {
                session.setAttribute("affiliateCoupon", coupon);
                session.setAttribute("discount", affiliate.getDiscount());
                session.removeAttribute("discountError");
            } else {
                session.setAttribute("discountError", "Cupom inválido ou não encontrado.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            session.setAttribute("discountError", "Erro ao aplicar o cupom: " + e.getMessage());
        }

        resp.sendRedirect("view-cart");
    }
}
