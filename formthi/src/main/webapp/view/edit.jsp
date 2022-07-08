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
    <title>Form Edit</title>
</head>
<body>
<p>
    <a href="/benhan">Back to customer list</a>
</p>
<form method="post">
    <fieldset>
        <legend>Customer information</legend>
        <table>
            <tr>
                <td>Id:</td>
                <td><input type="number" name="id" id="id" readonly value="${benhAn.getIdBenhAn()}"></td>
            </tr>

            <tr>
                <td>Ma Banh An:</td>
                <td><input type="text" name="mabenhan" id="mabenhan" value="${benhAn.getMaBenhAn()}"></td>
            </tr>

            <tr>
                <td>id_benh_nhan:</td>
                <td><input type="number" name="idbenhnhan" id="idbenhnhan" value="${benhAn.getIdBenhNhan()}"></td>
            </tr>

            <tr>
                <td>ten benh nhan:</td>
                <td><input type="text" name="tenbenhnhan" id="tenbenhnhan" value="${benhAn.getTenBenhNhan()}"></td>
            </tr>

            <tr>
                <td>ngay vao vien:</td>
                <td><input type="date" name="ngayvaovien" id="ngayvaovien" value="${benhAn.getNgayNhapVien()}"></td>
            </tr>

            <tr>
                <td>ngay ra vien:</td>
                <td><input type="date" name="ngayravien" id="ngayravien" value="${benhAn.getNgayRaVien()}"></td>
            </tr>
            </tr>

            <td>
                <input type="submit" value="Update ">
            </td>
            </tr>

        </table>
    </fieldset>
</form>

</body>
</html>
