<!DOCTYPE html>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
</head>
<body>
  <div>

    <c:if test="${sessionScope.loggedUser != null}">
        <span>${sessionScope.loggedUser}</span>
        <a href="pages/login.html">Logout</a>
    </c:if>

    <h1>Products</h1>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <c:if test="${sessionScope.loggedUser != null}">
                <th>Actions</th>
            </c:if>
        </tr>
        <c:forEach var="products" items="${productList}">
            <tr>
                <td>${products.id}</td>
                <td>${products.name}</td>
                <td>${products.price}</td>
                <td>
                    <c:if test="${sessionScope.loggedUser != null}">
                        <form action="/delete-products" method="post">
                            <input type="hidden" id="id" name="id" value="${products.id}">
                            <button type="submit">Delete</button>
                            <span> | </span>
                            <a href="pages/criarproduto.jsp?id=${products.id}&name=${products.name}&price=${products.price}">Update</a>
                            <img src="${products.imagem}">
                        </form>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
    </table>

  </div>
  <div>
  <br><br>
  <a href="pages/criarproduto.jsp">Cadastrar Produto</button>
  </div>
</body>
</html>