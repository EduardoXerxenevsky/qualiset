<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="../css/styles.css">
    <title>Rejeição de Afiliado</title>
    <style>
        .rejection-container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            text-align: center;
        }
        .rejection-title {
            font-size: 2.5rem;
            margin-bottom: 20px;
        }
        .rejection-message {
            font-size: 1.5rem;
            margin-bottom: 20px;
        }
        .back-btn {
            padding: 15px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            font-size: 1.5rem;
            cursor: pointer;
            text-decoration: none;
        }
        .back-btn:hover {
            background-color: #0056b3;
        }
    </style>
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
                        <h1> MARCA TOP 1 EM QUALIDADE DE PROTEÍNA 4X MELHOR MARCA EM ATENDIMENTO AO CLIENTE </h1>
                    </div>
                </section>

    <div class="rejection-container">
        <h1 class="rejection-title">Requisitos Não Atendidos</h1>
        <p class="rejection-message">Desculpe, você não atendeu aos requisitos para se tornar um afiliado.</p>
        <a href="pages/afiliado.jsp" class="back-btn">Voltar</a>
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
