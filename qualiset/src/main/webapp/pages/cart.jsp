<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="../css/styles.css">
    <title>Carrinho</title>
    <style>
        .carrinho-title {
            text-align: center;
            margin: 20px 0;
            font-size: 2.5rem;
        }
        .carrinho-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        .carrinho-tabela {
            width: 100%;
            border-collapse: collapse;
        }
        .carrinho-tabela th, .carrinho-tabela td {
            padding: 15px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }
        .carrinho-tabela th {
            background-color: #f8f8f8;
        }
        .carrinho-tabela td {
            vertical-align: middle;
        }
        .carrinho-tabela .remove-btn {
            background-color: #ff4d4d;
            color: #fff;
            border: none;
            padding: 8px 12px;
            border-radius: 5px;
            cursor: pointer;
        }
        .carrinho-tabela .remove-btn:hover {
            background-color: #e60000;
        }
        .total-price, .discount-price {
            text-align: right;
            font-size: 1.5rem;
            margin-top: 20px;
        }
        .checkout-btn {
            display: block;
            margin: 20px 0;
            padding: 15px;
            background-color: #28a745;
            color: #fff;
            text-align: center;
            border: none;
            border-radius: 5px;
            font-size: 1.5rem;
            cursor: pointer;
            text-decoration: none;
        }
        .checkout-btn:hover {
            background-color: #218838;
        }
        .empty-cart {
            text-align: center;
            font-size: 1.5rem;
            margin: 50px 0;
        }
        .apply-coupon {
            display: flex;
            justify-content: flex-end;
            margin-top: 20px;
        }
        .apply-coupon input[type="text"] {
            padding: 10px;
            font-size: 1rem;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-right: 10px;
        }
        .apply-coupon button {
            padding: 10px 15px;
            font-size: 1rem;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .apply-coupon button:hover {
            background-color: #0056b3;
        }
        .message {
            color: red;
            text-align: center;
            margin-top: 20px;
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

    <h1 class="carrinho-title">Carrinho de Compras</h1>
    <div class="carrinho-container">
        <c:if test="${not empty cart.items}">
            <table class="carrinho-tabela">
                <thead>
                    <tr>
                        <th>Produto</th>
                        <th>Quantidade</th>
                        <th>Preço</th>
                        <th>Total</th>
                        <th>Ações</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${cart.items}">
                        <tr>
                            <td>${item.product.name}</td>
                            <td>${item.quantity}</td>
                            <td>R$${item.product.price}</td>
                            <td>R$${item.totalPrice}</td>
                            <td>
                                <form action="remove-from-cart" method="post">
                                    <input type="hidden" name="productId" value="${item.product.id}">
                                    <button type="submit" class="remove-btn">Remover</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div class="total-price">
                <h3>Preço Total: R$${cart.totalPrice}</h3>
            </div>
            <c:if test="${not empty sessionScope.affiliateCoupon}">
                            <div class="discount-price">
                                <h3>Desconto de Afiliado (15%): -R$${cart.totalPrice * sessionScope.discount}</h3>
                            </div>
                            <div class="total-price">
                                <h3>Preço Final: R$${cart.totalPrice * (1 - sessionScope.discount)}</h3>
                            </div>
                            <form action="remove-coupon" method="post">
                                <button type="submit" class="remove-coupon-btn">Remover Cupom</button>
                            </form>
                        </c:if>
                        <div class="apply-coupon">
                            <form action="apply-coupon" method="post">
                                <input type="text" name="coupon" placeholder="Cupom de desconto">
                                <button type="submit">Aplicar</button>
                            </form>
                        </div>
                        <c:if test="${not empty sessionScope.discountError}">
                            <div class="message">${sessionScope.discountError}</div>
                        </c:if>
                        <a href="pages/checkout.jsp" class="checkout-btn">Comprar</a>
                    </c:if>
                    <c:if test="${empty cart.items}">
                        <p class="empty-cart">Seu carrinho está vazio.</p>
                    </c:if>
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