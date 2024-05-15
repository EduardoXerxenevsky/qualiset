<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<%@ page import="java.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="../css/produto.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@48,400,1,0" />
    <link rel="shortcut icon" type="image/png" href="imagens/qualisetfavicon.png">
    <title>Qualiset - Produto</title>
</head>
<body>
    <header class="content">
        <div class="logo">
            <img src="imagens/Logo.png">
        </div>
        <nav>
            <ul class="lista-menu">
                <li><a href="index.html">Home</a></li>
                <li><a href="../find-all-products">Loja</a></li>
                <li><a href="afiliado.jsp">Afilie-se</a></li>
                <li><a href="login.html">Login</a></li>
                <li><a href=""><i class="bi bi-facebook"></i></a></li>
                <li><a href="https://www.instagram.com/_qualiset_/"><i class="bi bi-instagram"></i></a></li>
                <li><a href="../view-cart"><i class="bi bi-cart"></i></a></li>
            </ul>
        </nav>
    </header>
    <section class="desc" id="desc">
        <div>
            <h1>MARCA TOP 1 EM QUALIDADE DE PROTEÍNA 4X MELHOR MARCA EM ATENDIMENTO AO CLIENTE</h1>
        </div>
    </section>

<%
    String id = request.getParameter("id");
    String productName = "";
    String productImage = "";
    String productPrice = "";

    String jdbcUrl = "jdbc:h2:~/test";
    String jdbcUser = "sa";
    String jdbcPassword = "sa";

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    try {
        Class.forName("org.h2.Driver");
        conn = DriverManager.getConnection(jdbcUrl, jdbcUser, jdbcPassword);
        String sql = "SELECT NAME, IMAGEM, PRICE FROM PRODUCT WHERE ID = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setInt(1, Integer.parseInt(id));
        rs = stmt.executeQuery();

        if (rs.next()) {
            productName = rs.getString("name");
            productImage = rs.getString("imagem");
            productPrice = rs.getString("price");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
        if (stmt != null) try { stmt.close(); } catch (SQLException ignore) {}
        if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
    }
%>

    <section class="produto-detalhe">
        <div class="produto">
            <div class="imagem">
                <img src="../../<%= productImage %>" alt="<%= productName %>" />
            </div>
            <div class="info">
                <h2><%= productName %></h2>
                <h1>R$<%= productPrice %>,00</h1>
                <form action="../add-to-cart" method="post">
                    <input type="hidden" name="productId" value="<%= id %>">
                    <input type="number" name="quantity" value="1" min="1">
                    <button type="submit" class="pedir">Adicionar ao Carrinho</button>
                </form>
            </div>
        </div>
    </section>

    <div class="feedback-section">
        <h3>Avaliações do Produto</h3>
        <%
            try {
                conn = DriverManager.getConnection(jdbcUrl, jdbcUser, jdbcPassword);

                String feedbackSql = "SELECT rating, comment FROM Feedback WHERE product_id = ?";
                stmt = conn.prepareStatement(feedbackSql);
                stmt.setInt(1, Integer.parseInt(id));
                rs = stmt.executeQuery();

                while (rs.next()) {
                    int rating = rs.getInt("rating");
                    String comment = rs.getString("comment");
        %>
                    <div class="feedback">
                        <div class="rating">Nota: <%= rating %>/5</div>
                        <div class="comment"><%= comment %></div>
                    </div>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
                if (stmt != null) try { stmt.close(); } catch (SQLException ignore) {}
                if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
            }
        %>
        <div class="feedback-form">
            <form action="../add-feedback" method="post">
                <input type="hidden" name="product_id" value="<%= id %>">
                <label for="rating">Nota</label>
                <input type="number" id="rating" name="rating" min="1" max="5" required>
                <label for="comment">Comentário</label>
                <textarea id="comment" name="comment" rows="4" required></textarea>
                <button type="submit">Enviar Avaliação</button>
            </form>
        </div>
    </div>
    <button class="chatbot-toggler">
        <span class="material-symbols-rounded">mode_comment</span>
        <span class="material-symbols-outlined">close</span>
    </button>
    <div class="chatbot">
        <header>
            <h2>Chatbot</h2>
            <span class="close-btn material-symbols-outlined">close</span>
        </header>
        <ul class="chatbox">
            <li class="chat incoming">
                <span class="material-symbols-outlined">smart_toy</span>
                <p>Olá 👋<br>Como posso te ajudar?</p>
            </li>
        </ul>
        <div class="chat-input">
            <textarea placeholder="Envie uma mensagem..." spellcheck="false" required></textarea>
            <span id="send-btn" class="material-symbols-rounded">send</span>
        </div>
    </div>

    <script src="../javascript/index.js"></script>
</body>
</html>
