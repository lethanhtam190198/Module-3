<%--
  Created by IntelliJ IDEA.
  User: This PC
  Date: 7/4/2022
  Time: 3:21 PM
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
    <a href="/customer">Back to customer list</a>
</p>
<form method="post">
    <fieldset>
        <legend>Customer information</legend>
        <table>
            <tr>
                <td>Id: </td>
                <td><input type="number" name="id" id="id" readonly value="${customer.getCustomerId()}"></td>
            </tr>
            <tr>
                <td>Name: </td>
                <td><input type="text" name="name" id="name"  value="${customer.getCustomerName()}"></td>
            </tr>
            <tr>
                <td>Birth Day: </td>
                <td><input type="date" name="birthday" id="birthday"  value="${customer.getCustomerBirthDay()}"></td>
            </tr>


            <tr>
                <td>Gender :</td>
                <td>
                    <select name="gender" id="gender">
                        <c:if test="${customer.getCustomerGender() == '1'}">
                            <option value="1" selected> Male</option>
                            <option value="0"> Female</option>
                        </c:if>
                        <c:if test="${customer.getCustomerGender() == '0'}">
                            <option value="1" > Male</option>
                            <option value="0" selected> Female</option>
                        </c:if>
                    </select>
                </td>
            </tr>

            <tr>
                <td>Id Card: </td>
                <td><input type="text" name="idcard" id="idcard"  value="${customer.getCustomerGender()}"></td>
            </tr>
            <tr>
                <td>Phone: </td>
                <td><input type="text" name="phone" id="phone"  value="${customer.getCustomerPhone()}"></td>
            </tr>
            <tr>
                <td>Email: </td>
                <td><input type="text" name="email" id="email"  value="${customer.getCustomerEmail()}"></td>
            </tr>
<%--            <tr>--%>
<%--                <td>Customer Type: </td>--%>
<%--                <td><input type="text" name="typeid" id="typeid"  value="${customer.getCustomerTypeId()}"></td>--%>
<%--            </tr>--%>


            <tr>
                <td>Customer Type</td>
                <td>
                    <select name="typeid" id="typeid">
                        <option value="">Chọn kiểu khách</option>
                        <c:forEach  items="${customerTypeList}" var="customerType">
                            <c:if test="${customerType.customerTypeId == customer.customerTypeId}">
                                <option selected value="${customerType.customerTypeId}">
                                        ${customerType.customerTypeName}
                                </option>
                            </c:if>
                            <c:if test="${customerType.customerTypeId != customer.customerTypeId}">
                                <option value="${customerType.customerTypeId}">
                                        ${customerType.customerTypeName}
                                </option>
                            </c:if>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>



            <tr>
                <td>Address: </td>
                <td><input type="text" name="address" id="address"  value="${customer.getCustomerAddress()}"></td>
            </tr>

                <td></td>
                <td><input type="submit" value="Update customer"></td>
            </tr>
        </table>
    </fieldset>
</form>

</body>
</html>
