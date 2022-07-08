package controller;

import dto.CustomerType;
import model.Customer;
import repository.ICustomerRepository;
import service.ICustomerService;
import service.ICustomerTypeService;
import service.impl.CustomerService;
import service.impl.CustomerTypeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebServlet(name = "CustomerServlet", urlPatterns = "/customer")
public class CustomerServlet extends HttpServlet {

    static List<Customer> customerList = new ArrayList<>();
    private ICustomerService customerService = new CustomerService();

    static List<CustomerType> customerTypeList = new ArrayList<>();
    private ICustomerTypeService customerTypeService = new CustomerTypeService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try{
            switch (action) {
                case "create":
                    request.getRequestDispatcher("view/customer/create.jsp").forward(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "search":
                    searchCustomer(request,response);
                    break;
                default:
                    findAll(request, response);
                    break;
            }
        }catch (SQLException e){
            throw  new ServletException(e);
        }

    }




    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createCustomer(request, response);
                break;
            case "edit":
                editCustomer(request, response);
                break;
            case "delete":
                deleteCustomer(request, response);
                break;
            default:
                findAll(request, response);
                break;
        }
    }


    private void findAll(HttpServletRequest request, HttpServletResponse response) {
        customerList = customerService.findAll();
        request.setAttribute("customerList", customerList);
        customerTypeList = customerTypeService.findAll();
        request.setAttribute("customerTypeList", customerTypeList);
        try {
            request.getRequestDispatcher("view/customer/list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void createCustomer(HttpServletRequest request, HttpServletResponse response) throws IOException {
//        customerList = customerService.findAll();
//        int max = 0;
//        for (Customer item : customerList) {
//            if (item.getCustomerId() > max) {
//                max = item.getCustomerId();
//            }
//        }
//        int id = max + 1;
//
//        String customerName = request.getParameter("name");
//        String customerBirthDay = request.getParameter("birthday");
//        int customerGender = Integer.parseInt(request.getParameter("gender"));
//        String customerIdCard = request.getParameter("idcard");
//        int customerPhone = Integer.parseInt(request.getParameter("phone"));
//        String customerEmail = request.getParameter("email");
//        int customerTypeId = Integer.parseInt(request.getParameter("typeid"));
//        String customerAddress = request.getParameter("address");
//
//        Customer customer = new Customer(id, customerTypeId, customerName, customerBirthDay, customerGender, customerIdCard
//                , customerPhone, customerEmail, customerAddress);
//        customerService.create(customer);
//        response.sendRedirect("/customer");


        Map<String, String> validate = customerService.validate(request, response);
        if (validate.isEmpty()){
            List<CustomerType> customerTypeList = customerTypeService.findAll();
            request.setAttribute("customerTypeList", customerTypeList);

            customerList = customerService.findAll();
            request.setAttribute("customerList", customerList);
            request.setAttribute("msg", "Add new successful");
            try {
                request.getRequestDispatcher("view/customer/list.jsp").forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        }else {
            try {
                request.setAttribute("validate", validate);
                request.getRequestDispatcher("view/customer/create.jsp").forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {

        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = this.customerService.findById(id);

        customerTypeList= customerTypeService.findAll();
        request.setAttribute("customerTypeList",customerTypeList);

        RequestDispatcher dispatcher;
        request.setAttribute("customer", customer);
        dispatcher = request.getRequestDispatcher("view/customer/edit.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }

    }

    private void editCustomer(HttpServletRequest request, HttpServletResponse response) {

        int id = Integer.parseInt(request.getParameter("id"));
        String customerName = request.getParameter("name");
        String customerBirthDay = request.getParameter("birthday");
        int customerGender = Integer.parseInt(request.getParameter("gender"));
        String customerIdCard = request.getParameter("idcard");
        int customerPhone = Integer.parseInt(request.getParameter("phone"));
        String customerEmail = request.getParameter("email");
        int customerTypeId = Integer.parseInt(request.getParameter("typeid"));
        String customerAddress = request.getParameter("address");

        Customer customer = new Customer(id,customerTypeId,customerName,customerBirthDay,customerGender,customerIdCard,
                customerPhone,customerEmail,customerAddress);

        customerService.edit(customer);

        try {
            response.sendRedirect("/customer");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }



    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = this.customerService.findById(id);
        RequestDispatcher dispatcher;
            this.customerService.delete(id);
            try {
                response.sendRedirect("/customer");
            } catch (IOException e) {
                e.printStackTrace();
            }
    }



    private void searchCustomer(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String name = request.getParameter("name");
        String addres= request.getParameter("address");
        String type=request.getParameter("type");
        List<Customer> customerList=customerService.searchCustomer(name,addres,type);
        List<CustomerType>customerTypeList= customerTypeService.findAll();
        request.setAttribute("customerList",customerList);
        request.setAttribute("customerTypeList",customerTypeList);
        request.getRequestDispatcher("view/customer/list.jsp").forward(request,response);

    }
}
