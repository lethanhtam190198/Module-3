<%--
  Created by IntelliJ IDEA.
  User: This PC
  Date: 7/4/2022
  Time: 10:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<h1>Customer list</h1>
<p>
    <a href="view/home.jsp">Back to home</a>
</p>

<form action="/customer?action=search">
    <select name="type" id="typeid">
        <option value=""></option>
        <option value="1">Diamond</option>
        <option value="2">Platinium</option>
        <option value="3">Gold</option>
        <option value="4">Silver</option>
        <option value="5">Member</option>
    </select>
    <input type="text" name="name" placeholder="name">
    <input type="text" name="address" placeholder="address">
    <input type="submit" name="action" value="search">
</form>

<a href="/customer?action=create"> <button type="button" class="btn btn-primary">Thêm mới Customer</button></a>
<form action="/customer">
    <table class="table">
        <tr>
            <th>Id</th>
            <th>Customer Type Id</th>
            <th>Name</th>
            <th>Birth Day</th>
            <th>Gender</th>
            <th>Id Card</th>
            <th>Phone</th>
            <th>Email</th>
            <th>Address</th>
            <td>Edit</td>
            <td>Delete</td>
        </tr>
        <c:forEach items="${customerList}" var="customer">
            <tr>
                <td>${customer.customerId}</td>

                <td>
                    <c:forEach items="${customerTypeList}" var="customerType">
                        <c:if test="${customerType.customerTypeId == customer.customerTypeId}">
                            ${customerType.customerTypeName}
                        </c:if>
                    </c:forEach>
<%--                        ${customer.customerTypeId}--%>
                </td>
                <td>${customer.customerName}</td>
                <td>${customer.customerBirthDay}</td>
                <td>
                    <c:if test="${customer.customerGender==0}">Male</c:if>
                    <c:if test="${customer.customerGender==1}">Female</c:if>
                </td>
                <td>${customer.customerIdCard}</td>
                <td>${customer.customerPhone}</td>
                <td>${customer.customerEmail}</td>
                <td>${customer.customerAddress}</td>
                <td><a href="/customer?action=edit&id=${customer.getCustomerId()}"><button type="button" class="btn btn-primary" data-bs-toggle="modal" >Edit</button></a></td>
                <td><button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal"
                            onclick="infoDelete('${customer.customerId}','${customer.customerName}')">Delete
                </button></td>

            </tr>
        </c:forEach>
    </table>
</form>


<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">

        <form action="/customer" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Xóa Customer</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <!-- name trung voi serverlet xoa-->
                    <input type="text" hidden name="id" id="idDelete">
                    <input type="text" hidden name="action" value="delete">
                    <span>Bạn có muốn xóa khách hàng: </span>
                    <span id="nameDelete"></span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Không Xóa</button>
                    <button type="submit" class="btn btn-primary">Xóa</button>
                </div>
            </div>
        </form>
    </div>
</div>

<script>
    function infoDelete(id, name) {
        document.getElementById("idDelete").value = id;
        document.getElementById("nameDelete").innerText = name;
    }
</script>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</html>
