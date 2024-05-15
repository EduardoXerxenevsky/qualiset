package br.com.qualiset.servlet;

import br.com.qualiset.dao.ProductDao;
import br.com.qualiset.dao.FeedbackDAO;
import br.com.qualiset.model.Product;
import br.com.qualiset.model.Feedback;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/product")
public class ProductServlet extends HttpServlet {

    private ProductDao productDAO;
    private FeedbackDAO feedbackDAO;

    @Override
    public void init() throws ServletException {
        this.productDAO = new ProductDao();
        this.feedbackDAO = new FeedbackDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId = request.getParameter("id");
        Product product = productDAO.getProductById(productId);
        List<Feedback> feedbackList = feedbackDAO.getFeedbackByProduct(productId);

        request.setAttribute("product", product);
        request.setAttribute("feedbackList", feedbackList);
        request.getRequestDispatcher("product.jsp").forward(request, response);
    }
}