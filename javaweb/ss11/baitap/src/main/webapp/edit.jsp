<%--
  Created by IntelliJ IDEA.
  User: This PC
  Date: 6/29/2022
  Time: 3:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<p>
    <a href="/product">Back to customer list</a>
</p>
<form method="post">
    <fieldset>
        <legend>Customer information</legend>
        <table>

            <tr>
                <td>Name: </td>
                <td><input type="text" name="name" id="name" readonly value="${product.getName()}"></td>
            </tr>
            <tr>
                <td>Price: </td>
                <td><input type="number" name="price" id="price" readonly value="${product.getPrice()}"></td>
            </tr>
            <tr>
                <td>Producer: </td>
                <td><input type="text" name="producer" id="producer" readonly value="${product.getProducer()}"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Update customer"></td>
            </tr>
        </table>
    </fieldset>
</form>

</body>
</html>
