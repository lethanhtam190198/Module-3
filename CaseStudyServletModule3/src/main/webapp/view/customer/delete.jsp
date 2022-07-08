<%--
  Created by IntelliJ IDEA.
  User: This PC
  Date: 7/4/2022
  Time: 8:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<h2>Delete Product</h2>

<p>
    <a href="/customer">Back to customer list</a>
</p>

<form  method="post">
    <h3>Are you sure</h3>
    <fieldset>
        <legend>Product information</legend>
        <table>
            <tr>
                <td>ID:</td>
                <td>${customer.getCustomerId()}</td>
            </tr>
            <tr>
                <td>Type Id:</td>
                <td>${customer.getCustomerTypeId()}</td>
            </tr>
            <tr>
                <td>Name:</td>
                <td>${customer.getCustomerName()}</td>
            </tr>
            <tr>
                <td>Birth Day:</td>
                <td>${customer.getCustomerBirthDay()}</td>
            </tr>
            <tr>
                <td>Gender:</td>
                <td>${customer.getCustomerGender()}</td>
            </tr>
            <tr>
                <td>Id Card:</td>
                <td>${customer.getCustomerIdCard()}</td>
            </tr>
            <tr>
                <td>Phone:</td>
                <td>${customer.getCustomerPhone()}</td>
            </tr>
            <tr>
                <td>Email:</td>
                <td>${customer.getCustomerEmail()}</td>
            </tr>
            <tr>
                <td>Address:</td>
                <td>${customer.getCustomerAddress()}</td>
            </tr>

            <tr>
                <td><input type="submit" value="Delete Customer"></td>
                <td><a href="/customer">Back to Product</a></td>
            </tr>

        </table>
    </fieldset>
</form>
</body>
</html>
