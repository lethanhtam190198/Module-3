<%--
  Created by IntelliJ IDEA.
  User: This PC
  Date: 7/2/2022
  Time: 10:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Customer list</title>
</head>
<body>
<h1>Trang customer list</h1>
<form >
<table>
    <tr>
        <th>id</th>
        <th>customer_type_id</th>
        <th>customerName</th>
        <th>customerBirthDay</th>
        <th>customerGender</th>
        <th>customerBirthDay</th>
        <th>customer_id_card</th>
        <th>customer_Phone</th>
        <th>customer_email</th>
        <th>customer_address</th>
    </tr>
    <c:forEach items="${customerlist}" var="customer">
        <tr>
            <td>${customer.customer_id}</td>
            <td>${customer.customer_type_id}</td>
            <td>${customer.customerName}</td>
            <td>${customer.customerBirthDay}</td>
            <td>${customer.customerGender}</td>
            <td>${customer.customer_id_card}</td>
            <td>${customer.customer_Phone}</td>
            <td>${customer.customer_email}</td>
            <td>${customer.customer_address}</td>
        </tr>
    </c:forEach>

</table>
</form>
</body>
</html>
