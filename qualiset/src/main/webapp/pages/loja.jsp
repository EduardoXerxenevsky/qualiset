<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="../css/loja.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@48,400,1,0" />
    <link rel="shortcut icon" type="image/png" href="imagens/qualisetfavicon.png">
    <title>Loja</title>
</head>

<body>
    <header class="content">
        <div class="logo">
            <img src="pages/imagens/Logo.png">
        </div>
        <nav>
            <ul class="lista-menu">
                <li><a href="pages/index.html">Home</a></li>
                <li><a href="find-all-products">Loja</a></li>
                <li><a href="pages/afiliado.jsp">Afilie-se</a></li>
                <li><a href="pages/login.html">Login</a></li>
                <li><a href=""><i class="bi bi-facebook"></i></a></li>
                <li><a href="https://www.instagram.com/_qualiset_/"><i class="bi bi-instagram"></i></a></li>
                <li><a href="view-cart"><i class="bi bi-cart"></i></a></li>
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
            <c:forEach var="product" items="${products}">
                <div class="produto shortjogger">
                    <img src="../../${product.imagem}" alt="${product.name}" />
                    <div class="info">
                        <h1>R$${product.price}</h1>
                        <h2>${product.name}</h2>
                        <a href="<c:url value='pages/produtos.jsp?id=${product.id}'/>">
                            <button class="pedir">Pedir agora</button>
                        </a>
                    </div>
                </div>
            </c:forEach>
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
