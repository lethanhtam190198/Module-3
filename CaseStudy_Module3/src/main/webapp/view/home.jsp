<%--
  Created by IntelliJ IDEA.
  User: This PC
  Date: 7/2/2022
  Time: 10:34 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>

<div class="container-fluid">
    <div class="row ">
        <div class="col-lg-1 text-center">
            <img style="width: 50%"  src="https://furamavietnam.com/wp-content/uploads/2018/08/logo@2x.png" alt="">
        </div>
        <div class="col-lg-9">
        </div>
        <div class="col-lg-2">Le Thanh Tam
        </div>
    </div>
    <div class="row  bg-light ">
        <div class="col-lg-1">
        </div>
        <div class="col-lg-8">
            <nav class="navbar navbar-expand-lg navbar-dark " style="background-color: #046056; position: sticky">
                <div class="container-fluid" style="margin-left: 30px">
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="#">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="#">Employee</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="view/customer/list.jsp">Customer</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="#">Service</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="#">Contract</a>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
        <div class="col-lg-3">
            <nav class="navbar navbar-light bg-light">
                <div class="container-fluid">
                    <form class="d-flex">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                </div>
            </nav>
        </div>
    </div>
    <div class="row" style="height: 500px">
        <div class="col-lg-3 bg-light " >
            <p>Item One</p>
            <p>Item Two</p>
            <p>Item Three</p>
        </div>
        <div class="col-lg-9 align-items-center bg-light ">
            <p>Body</p>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12 text-center " style="height: 50px">Footer</div>

    </div>
</div>

<script src="js/bootstrap.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>
</html>
