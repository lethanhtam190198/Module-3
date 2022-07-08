<%--
  Created by IntelliJ IDEA.
  User: This PC
  Date: 7/5/2022
  Time: 9:17 AM
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
    <form method="post" action="/employee?action=create">

        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">Name</label>
            <input name="name" type="text" class="form-control" id="exampleInputEmail1">
        </div>

        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">Birthday</label>
            <input name="birthday" type="date" class="form-control">
        </div>

        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">Id Card</label>
            <input name="idcard" type="text" class="form-control">
        </div>

        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">Salary</label>
            <input name="salary" type="number" class="form-control">
        </div>

        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">Phone Number</label>
            <input name="phone" type="number" class="form-control">
        </div>

        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">Email</label>
            <input name="email" type="text" class="form-control">
        </div>

        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">Address</label>
            <input name="address" type="text" class="form-control">
        </div>

        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">Position Id</label>
            <input name="position" type="number" class="form-control">
        </div>

        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">Education Degree Id</label>
            <input name="education_degree" type="number" class="form-control">
        </div>

        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">Division Id</label>
            <input name="division" type="number" class="form-control">
        </div>

        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">User Name</label>
            <input name="username" type="text" class="form-control">
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>

</body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</html>
