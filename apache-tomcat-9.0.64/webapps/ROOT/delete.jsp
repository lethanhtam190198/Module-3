<%--
  Created by IntelliJ IDEA.
  User: This PC
  Date: 6/29/2022
  Time: 1:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Prodcut</title>
</head>
<body>
<h2>Delete Product</h2>

<form  method="post">
    <h3>Are you sure</h3>
    <fieldset>
        <legend>Product information</legend>
        <table>
            <tr>
                <td>ID:</td>
                <td>${product.getId()}</td>
            </tr>
            <tr>
                <td>Name</td>
                <td>${product.getName()}</td>
            </tr>
            <tr>
                <td>Price</td>
                <td>${product.getPrice()}</td>
            </tr>
            <tr>
                <td>Producer</td>
                <td>${product.getProducer()}</td>
            </tr>
            <tr>
                <td><input type="submit" value="Delete Product"></td>
                <td><a href="/product">Back to Product</a></td>
            </tr>

        </table>
    </fieldset>
</form>


</body>
</html>
