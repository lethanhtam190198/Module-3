<%--
  Created by IntelliJ IDEA.
  User: This PC
  Date: 7/4/2022
  Time: 1:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <form method="post" action="/customer?action=create">
        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">Name</label>
            <input name="name" type="text" class="form-control" id="exampleInputEmail1" placeholder="Nhap ten  Ex:Nguyen Van A">
            <c:if  test="${validate.size() > 0}"><label class="text-danger">
                    ${validate.get('customer_name')}</label></c:if>

        </div>
        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">Birthday</label>
            <input name="birthday" type="date" class="form-control">
        </div>
        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">Gender</label>
            <div>  <select name="gender" id="gender">
                <option value="1">Male</option>
                <option value="0">Female</option>
            </select>
            </div>
        </div>
        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">Id Card</label>
            <input name="idcard" type="number" class="form-control">
        </div>
        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">phone</label>
            <input name="phone" type="number" class="form-control">
        </div>

        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">Email</label>
            <input class="form-control" name="email" type="email" title="The domain portion of the email address is invalid (the portion after the @)."
                   pattern="^([^\x00-\x20\x22\x28\x29\x2c\x2e\x3a-\x3c\x3e\x40\x5b-\x5d\x7f-\xff]+|\x22([^\x0d\x22\x5c\
       x80-\xff]|\x5c[\x00-\x7f])*\x22)(\x2e([^\x00-\x20\x22\x28\x29\x2c\x2e\x3a-\x3c\x3e\x40\x5b-\x5d\x7f-\
       xff]+|\x22([^\x0d\x22\x5c\x80-\xff]|\x5c[\x00-\x7f])*\x22))*\x40([^\x00-\x20\x22\x28\x29\x2c\x2e\x3a-
       \x3c\x3e\x40\x5b-\x5d\x7f-\xff]+|\x5b([^\x0d\x5b-\x5d\x80-\xff]|\x5c[\x00-\x7f])*\x5d)(\x2e([^\x00-\
       x20\x22\x28\x29\x2c\x2e\x3a-\x3c\x3e\x40\x5b-\x5d\x7f-\xff]+|\x5b([^\x0d\x5b-\x5d\x80-\xff]|\x5c[\x00-
       \x7f])*\x5d))*(\.\w{2,})+$" placeholder="abc123@gmail.com/ @yahoo.com">
        </div>


        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">Customer Type</label>
            <div>  <select name="typeid" id="typeid">
                <option value="1">Diamond</option>
                <option value="2">Platinium</option>
                <option value="3">Gold</option>
                <option value="4">Silver</option>
                <option value="5">Member</option>
            </select>
            </div>
        </div>


<%--        <div class="mb-3">--%>
<%--            <label for="exampleInputEmail1" class="form-label">Customer Type</label>--%>
<%--            <input name="typeid" type="text" class="form-control">--%>
<%--        </div>--%>

        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">Address</label>
            <input name="address" type="text" class="form-control">
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</html>
