<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="../css/styles.css">
    <title>Checkout</title>
    <style>
        .checkout-container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        .checkout-title {
            text-align: center;
            margin-bottom: 20px;
            font-size: 2.5rem;
        }
        .checkout-form {
            display: flex;
            flex-direction: column;
        }
        .checkout-form label {
            margin-bottom: 10px;
            font-size: 1.2rem;
        }
        .checkout-form input {
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1rem;
        }
        .checkout-btn {
            padding: 15px;
            background-color: #28a745;
            color: #fff;
            border: none;
            border-radius: 5px;
            font-size: 1.5rem;
            cursor: pointer;
            text-align: center;
        }
        .checkout-btn:hover {
            background-color: #218838;
        }
    </style>
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
                <li><a href="checkout.jsp"><i class="bi bi-cart"></i></a></li>
            </ul>
        </nav>
    </header>

    <div class="checkout-container">
        <h1 class="checkout-title">Checkout</h1>
        <form class="checkout-form" action="../process-checkout" method="post">
            <label for="name">Nome Completo</label>
            <input type="text" id="name" name="name" required>

            <label for="email">Email</label>
            <input type="email" id="email" name="email" required>

            <label for="address">Endereço</label>
            <input type="text" id="address" name="address" required>

            <label for="card-name">Nome no Cartão</label>
            <input type="text" id="card-name" name="card-name" required>

            <label for="card-number">Número do Cartão</label>
            <input type="text" id="card-number" name="card-number" required>

            <label for="card-expiry">Data de Expiração</label>
            <input type="text" id="card-expiry" name="card-expiry" placeholder="MM/AA" required>

            <label for="card-cvv">CVV</label>
            <input type="text" id="card-cvv" name="card-cvv" required>

            <button type="submit" class="checkout-btn">Finalizar Compra</button>
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

        <script src="../javascript/index.js"></script>
</body>
</html>
