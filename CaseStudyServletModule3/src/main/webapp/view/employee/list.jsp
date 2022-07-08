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
    <title>Employee List</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
    <link rel="stylesheet" href="/boostrap/bootstrap413/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/boostrap/datatables/css/dataTables.bootstrap4.min.css" />
</head>
<body>

<h1>Employee list</h1>
<p>
    <a href="view/home.jsp">Back to home</a>
</p>

</p>
<a href="/employee?action=create">
    <button type="button" class="btn btn-primary">Thêm mới Employee</button>
</a>

<form action="/employee">
    <table class="table text-center table-striped" id="table">
        <thead>
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Birth Day</th>
            <th>Id Card</th>
            <th>Salary</th>
            <th>Phone</th>
            <th>Email</th>
            <th>Address</th>
            <th>Position Id</th>
            <th>Education Degree Id</th>
            <th>Divison Id</th>
            <th>User Name</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${employeeList}" var="employee">
            <tr>
                <td>${employee.employeeId}</td>
                <td>${employee.employeeName}</td>
                <td>${employee.employeeBirthDay}</td>
                <td>${employee.employeeIdCard}</td>
                <td>${employee.employeeSalary}</td>
                <td>${employee.employeePhone}</td>
                <td>${employee.employeeEmail}</td>
                <td>${employee.employeeAddress}</td>

                <c:forEach items="${positionList}" var="position">
                    <c:if test="${position.positionId==employee.employeePositionId}">
                        <td>${position.positionName}</td>
                    </c:if>
                </c:forEach>

                <c:forEach items="${educationDegreeList}" var="education">
                    <c:if test="${education.educationDegreeId==employee.employeeEducationDegreeId}">
                        <td>${education.educationDegreeName}</td>
                    </c:if>
                </c:forEach>

                <c:forEach items="${divisionList}" var="division">
                    <c:if test="${division.divisionId==employee.employeeDivisionId}">
                        <td>${division.divisionName}</td>
                    </c:if>
                </c:forEach>


                <td>${employee.employeeUserName}</td>

                <td><a href="/employee?action=edit&id=${employee.getEmployeeId()}">
                    <button type="button" class="btn btn-primary" data-toggle="modal">Edit</button>
                </a></td>
                <td>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal"
                            onclick="infoDelete('${employee.employeeId}','${employee.employeeName}')">Delete
                    </button>
                </td>

            </tr>
        </c:forEach>
        </tbody>
    </table>
</form>

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">

        <form action="/employee" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Xóa Employee</h5>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">x</button>
                </div>
                <div class="modal-body">

                    <input type="number" hidden name="id" id="idDelete">
                    <input type="text" hidden name="action" value="delete">
                    <span>Bạn có muốn employee: </span>
                    <span id="nameDelete"></span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Không Xóa</button>
                    <button type="submit" class="btn btn-primary">Xóa</button>
                </div>
            </div>
        </form>
    </div>
</div>


<script src="/boostrap/jquery/jquery-3.5.1.min.js"></script>
<script src="/boostrap/datatables/js/jquery.dataTables.min.js"></script>
<script src="/boostrap/datatables/js/dataTables.bootstrap4.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="/boostrap/bootstrap413/js/bootstrap.bundle.min.js"></script>


<script>
    $(document).ready(function () {
        $('#table').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 4
        });
    })
</script>


<script>
    function infoDelete(id, name) {
        document.getElementById("idDelete").value = id;
        document.getElementById("nameDelete").innerText = name;
    }
</script>

</body>

</html>
