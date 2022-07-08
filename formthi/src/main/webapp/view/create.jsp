<%--
  Created by IntelliJ IDEA.
  User: This PC
  Date: 7/8/2022
  Time: 8:19 AM
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
    <form method="post" action="/benhan?action=create">

        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">Ma Benh An</label>
            <input name="mabenhan" type="text" class="form-control" id="exampleInputEmail1" >
        </div>

        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">Id Benh Nhan</label>
            <input name="idbenhnhan" type="text" class="form-control" >
        </div>

        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">ten Benh Nhan</label>
            <input name="tenbenhnhan" type="text" class="form-control" >
        </div>

        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">ngay nhap vien</label>
            <input name="ngaynhapvien" type="date" class="form-control" >
        </div>

        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">ngay ra vien</label>
            <input name="ngayravien" type="date" class="form-control" >
        </div>


        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>

</body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</html>
