<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="css/styles.css">
    <title>Adicionar Produto</title>
    <style>
        body {
            background-color: #f7f7f7;
            font-family: 'Poppins', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            max-width: 600px;
            width: 100%;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        .header {
            text-align: center;
            margin-bottom: 20px;
        }
        .header img {
            width: 150px;
            margin-bottom: 10px;
        }
        .header h1 {
            font-size: 2.5rem;
            color: #333;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: 500;
            color: #333;
        }
        .form-group input[type="text"],
        .form-group input[type="number"],
        .form-group input[type="file"] {
            width: 100%;
            padding: 10px;
            font-size: 1rem;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .form-group input[type="file"] {
            padding: 3px;
        }
        .submit-btn,
        .back-btn {
            display: block;
            width: 100%;
            padding: 15px;
            font-size: 1.5rem;
            text-align: center;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            margin-top: 10px;
        }
        .submit-btn {
            background-color: #28a745;
            color: #fff;
        }
        .submit-btn:hover {
            background-color: #218838;
        }
        .back-btn {
            background-color: #007bff;
            color: #fff;
        }
        .back-btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <img src="pages/imagens/Logo.png" alt="Logo">
            <h1>Adicionar Produto</h1>
        </div>
        <form action="/create-products" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="product-name">Nome do Produto</label>
                <input type="text" id="product-name" name="product-name" value="${param.name}" required>
            </div>
            <div class="form-group">
                <label for="product-price">Preço do Produto</label>
                <input type="text" id="product-price" name="product-price" value="${param.price}" required>
            </div>
            <div class="form-group">
                <input type="hidden" id="id" name="id" value="${param.id}">
            </div>
            <div class="form-group">
                <label for="image">Escolher arquivo</label>
                <input type="file" id="image" name="image" required>
            </div>
            <button type="submit" class="submit-btn">Registrar</button>
            <a href="pages/index.html" class="back-btn">Voltar</a>
        </form>
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

        <script src="javascript/index.js"></script>
</body>
</html>