<html>
<body>
<h2>Create Product</h2>

<form action="/create-products" method="post">

    <label>Product Name</label>
    <input type="text" name="product-name" id="product-name" value="${param.name}">
    <input type="text" name="product-price" id="product-price" value="${param.price}">
    <input type="hidden" id="id" name="id" value="${param.id}">
    <button type="submit">Register</button>

</form>

</body>
</html>