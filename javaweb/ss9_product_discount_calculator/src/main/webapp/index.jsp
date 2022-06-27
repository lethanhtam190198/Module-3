<%--
  Created by IntelliJ IDEA.
  User: This PC
  Date: 6/27/2022
  Time: 2:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <form action="/product_discount_calculator" method="post">
  <h1>Ứng dụng Product Discount Calculator</h1>
  <input type="text" name="description" placeholder="Mô tả của sản phẩm">
  <input type="text" name="price" placeholder="Giá niêm yết của sản phẩm">
  <input type="text" name="percent" placeholder="Tỷ lệ chiết khấu (%)">
  <button type="submit">Calculate Discount</button>
  </form>
  </body>
</html>
