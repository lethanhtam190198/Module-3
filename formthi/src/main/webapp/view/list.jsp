
<%--
  Created by IntelliJ IDEA.
  User: This PC
  Date: 7/8/2022
  Time: 8:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>


<h1>Customer list</h1>
<p>
    <a href="home.jsp">Back to home</a>
</p>


<a href="/benhan?action=create">
    <button type="button" class="btn btn-primary">Thêm mới Benh An</button>
</a>
<form action="/benhan">
    <table class="table">
        <tr>
            <th>Id</th>
            <th>Ma Benh An</th>
            <th>Id Benh Nhan</th>
            <th>Ten Benh Nhan</th>
            <th>Ngay Nhap Vien</th>
            <th>Ngay Ra Vien</th>
            <td>Edit</td>
            <td>Delete</td>
        </tr>
        <c:forEach items="${benhAnList}" var="benhan">
            <tr>
                <td>${benhan.idBenhAn}</td>
                <td>${benhan.maBenhAn}</td>
                <td>${benhan.idBenhNhan}</td>
                <td>${benhan.tenBenhNhan}</td>
                <td>${benhan.ngayNhapVien}</td>
                <td>${benhan.ngayRaVien}</td>

                <td>
                    <a href="/benhan?action=edit&id=${benhan.getIdBenhAn()}">
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal">Edit</button>
                    </a>
                </td>
                <td>
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal"
                            onclick="infoDelete('${benhan.idBenhAn}','${benhan.tenBenhNhan}')">Delete
                    </button>
                </td>
            </tr>
        </c:forEach>
    </table>
</form>

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">

        <form action="/benhan" method="post">
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>

</body>
</html>
