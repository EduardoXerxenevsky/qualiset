<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="../css/styles.css">
    <title>Confirmação de Pedido</title>
    <style>
        .confirmation-container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            text-align: center;
        }
        .confirmation-title {
            font-size: 2.5rem;
            margin-bottom: 20px;
        }
        .confirmation-message {
            font-size: 1.5rem;
            margin-bottom: 20px;
        }
        .confirmation-btn {
            padding: 15px;
            background-color: #28a745;
            color: #fff;
            border: none;
            border-radius: 5px;
            font-size: 1.5rem;
            cursor: pointer;
            text-decoration: none;
        }
        .confirmation-btn:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <div class="confirmation-container">
        <h1 class="confirmation-title">Pedido Confirmado!</h1>
        <p class="confirmation-message">Obrigado, ${name}! Seu pedido foi processado com sucesso.</p>
        <a href="pages/index.html" class="confirmation-btn">Voltar para a Home</a>
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
