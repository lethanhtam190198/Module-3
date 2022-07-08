<%--
  Created by IntelliJ IDEA.
  User: This PC
  Date: 7/5/2022
  Time: 11:46 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><html>
<head>
    <title>Title</title>
</head>
<body>

<p>
    <a href="/employee">Back to employee list</a>
</p>
<form method="post">
    <fieldset>
        <legend>Employee information</legend>
        <table>
            <tr>
                <td>Id: </td>
                <td><input type="number" name="id" id="id" readonly value="${employee.getEmployeeId()}"></td>
            </tr>

            <tr>
                <td>Name: </td>
                <td><input type="text" name="name" id="name"  value="${employee.getEmployeeName()}"></td>
            </tr>

            <tr>
                <td>Birth Day: </td>
                <td><input type="date" name="birthday" id="birthday"  value="${employee.getEmployeeBirthDay()}"></td>
            </tr>

            <tr>
                <td>Id Card: </td>
                <td><input type="text" name="idcard" id="idcard"  value="${employee.getEmployeeIdCard()}"></td>
            </tr>
            <tr>
                <td>Salary: </td>
                <td><input type="number" name="salary" id="salary"  value="${employee.getEmployeeSalary()}"></td>
            </tr>

            <tr>
                <td>Phone: </td>
                <td><input type="number" name="phone" id="phone"  value="${employee.getEmployeePhone()}"></td>
            </tr>

            <tr>
                <td>Email: </td>
                <td><input type="text" name="email" id="email"  value="${employee.getEmployeeEmail()}"></td>
            </tr>

            <tr>
                <td>Address: </td>
                <td><input type="text" name="address" id="address"  value="${employee.getEmployeeAddress()}"></td>
            </tr>

<%--            <tr>--%>
<%--                <td>Position Id: </td>--%>
<%--                <td><input type="number" name="position" id="position"  value="${employee.getEmployeePositionId()}"></td>--%>
<%--            </tr>--%>


            <tr>
                <th>Position :</th>
                <td>
                    <select name="position" id="position">
                        <option value="">Position Type </option>
                        <c:forEach var="position" items="${positionList}">
                            <c:if test="${position.positionId == employee.employeePositionId}">
                                <option selected value="${position.positionId}">${position.positionName}</option>
                            </c:if>
                            <c:if test="${position.positionId != employee.employeePositionId}">
                                <option value="${position.positionId}">${position.positionName}</option>
                            </c:if>
                        </c:forEach>
                    </select>
                </td>
            </tr>

            <tr>
                <th>Education Degree :</th>
                <td>
                    <select name="education" id="education">
                        <option value="">Education Degree</option>
                        <c:forEach var="educationDegree" items="${educationDegreeList}">
                            <c:if test="${educationDegree.educationDegreeId == employee.employeeEducationDegreeId}">
                                <option selected value="${educationDegree.educationDegreeId}">${educationDegree.educationDegreeName}</option>
                            </c:if>
                            <c:if test="${educationDegree.educationDegreeId != employee.employeeEducationDegreeId}">
                                <option value="${educationDegree.educationDegreeId}">${educationDegree.educationDegreeName}</option>
                            </c:if>
                        </c:forEach>
                    </select>
                </td>
            </tr>

            <tr>
                <th>Division :</th>
                <td>
                    <select name="division" id="division">
                        <option value="">Education Degree</option>
                        <c:forEach var="division" items="${divisionList}">
                            <c:if test="${division.divisionId == employee.employeeDivisionId}">
                                <option selected value="${division.divisionId}">${division.divisionName}</option>
                            </c:if>
                            <c:if test="${division.divisionId != employee.employeeDivisionId}">
                                <option value="${division.divisionId}">${division.divisionName}</option>
                            </c:if>
                        </c:forEach>
                    </select>
                </td>
            </tr>



<%--            <tr>--%>
<%--                <td>Education Degree Id: </td>--%>
<%--                <td><input type="number" name="education" id="education"  value="${employee.getEmployeeEducationDegreeId()}"></td>--%>
<%--            </tr>--%>

<%--            <tr>--%>
<%--                <td>Division Id: </td>--%>
<%--                <td><input type="number" name="division" id="division"  value="${employee.getEmployeeDivisionId()}"></td>--%>
<%--            </tr>--%>

            <tr>
                <td>User name: </td>
                <td><input type="text" name="username" id="username" readonly  value="${employee.getEmployeeUserName()}"></td>
            </tr>

            <td><input type="submit" value="Update employee"></td>
            </tr>
        </table>
    </fieldset>
</form>

</body>
</html>
