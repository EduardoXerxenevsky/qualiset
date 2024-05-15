<%@ page import="java.util.List" %>
<%@ page import="br.com.qualiset.model.Product" %>
<%@ page import="br.com.qualiset.dao.ProductDao" %>

<%
    // Carregar a lista de produtos a partir do DAO
    ProductDao productDao = new ProductDao();
    List<Product> productList = productDao.findAllProducts();
    request.setAttribute("productList", productList);
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="../css/loja.css">
    <link rel="stylesheet" href="../css/index.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
    <link rel="shortcut icon" type="image/png" href="imagens/qualisetfavicon.png">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@48,400,1,0" />
    <title>Loja</title>
</head>
<body>
    <header class="content">
        <div class="logo">
            <a href="index.html"><img src="../imagens/Logo.png" alt="Logo"></a>
        </div>
        <nav>
            <ul class="lista-menu">
                <li><a href="index.html">Home</a></li>
                <li><a href="lojatudo.jsp">Loja</a></li>
                <li><a href="afiliado.html">Afilie-se</a></li>
                <li><a href="login.html">Login</a></li>
                <li><a href="#"><i class="bi bi-facebook"></i></a></li>
                <li><a href="https://www.instagram.com/_qualiset_/"><i class="bi bi-instagram"></i></a></li>
                <li><a href="checkout.html"><i class="bi bi-cart"></i></a></li>
            </ul>
        </nav>
    </header>

    <section class="desc" id="desc">
        <div>
            <h1>MARCA TOP 1 EM QUALIDADE DE PROTEÍNA 4X MELHOR MARCA EM ATENDIMENTO AO CLIENTE</h1>
        </div>
    </section>
    <section class="produtos" id="produtos">
        <div class="itensproduto">
            <div class="menuvertical">
                <a href="lojatudo.jsp">Tudo</a>
                <a href="lojasuplementos.html">Suplementos</a>
                <a href="lojaroupas.html">Roupas</a>
                <a href="lojasacessorios.html">Acessórios</a>
                <a href="lojaequipamentos.html">Equipamentos</a>
            </div>

            <c:forEach var="product" items="${productList}">
                <div class="produto">
                    <img src="../${product.imagem}" alt="${product.name}">
                    <div class="info">
                        <h1>R$${product.price}</h1>
                        <h2>${product.name}</h2>
                        <a href="product?id=${product.id}"><button class="pedir">Pedir agora</button></a>
                    </div>
                </div>
            </c:forEach>

            <p>Número de produtos: ${productList.size()}</p>
        </div>
    </section>

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