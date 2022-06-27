import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "product_discount_calculator", urlPatterns = "/product_discount_calculator")
public class product_discount_calculator extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float price=Float.parseFloat(request.getParameter("price"));
        float percent=Float.parseFloat(request.getParameter("percent"));
        String description =request.getParameter("description");
        float result= price*(percent/100);
        float discount=price-result;
        request.setAttribute("result",result);
        request.setAttribute("price",price);
        request.setAttribute("percent",percent);
        request.setAttribute("description",description);
        request.setAttribute("discount",discount);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("ketqua.jsp");
        requestDispatcher.forward(request,response);
    }
}
