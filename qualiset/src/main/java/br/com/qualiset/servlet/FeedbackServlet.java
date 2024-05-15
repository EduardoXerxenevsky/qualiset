package br.com.qualiset.servlet;

import br.com.qualiset.dao.FeedbackDAO;
import br.com.qualiset.model.Feedback;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/feedback")
public class FeedbackServlet extends HttpServlet {

    private FeedbackDAO feedbackDAO;

    @Override
    public void init() throws ServletException {
        this.feedbackDAO = new FeedbackDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId = request.getParameter("productId");
        String userId = request.getParameter("userId");
        String comment = request.getParameter("comment");
        int rating = Integer.parseInt(request.getParameter("rating"));

        Feedback feedback = new Feedback();
        feedback.setProductId(productId);
        feedback.setUserId(userId);
        feedback.setComment(comment);
        feedback.setRating(rating);

        feedbackDAO.addFeedback(feedback);
        response.sendRedirect("product.jsp?id=" + productId);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId = request.getParameter("productId");
        List<Feedback> feedbackList = feedbackDAO.getFeedbackByProduct(productId);
        request.setAttribute("feedbackList", feedbackList);
        request.getRequestDispatcher("feedback.jsp").forward(request, response);
    }
}

