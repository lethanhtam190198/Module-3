package service.impl;

import model.Customer;
import repository.ICustomerRepository;
import repository.impl.CustomerRepository;
import service.ICustomerService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerService implements ICustomerService {

    private ICustomerRepository customerRepository = new CustomerRepository();

    @Override
    public List<Customer> findAll() {
        return customerRepository.findAll();
    }

    @Override
    public void create(Customer customer) {
        customerRepository.create(customer);
    }

    @Override
    public void delete(int customerId) {
        customerRepository.delete(customerId);
    }

    @Override
    public void edit( Customer customer) {
        customerRepository.edit( customer);
    }

    @Override
    public Customer findById(int customerId) {
        return customerRepository.findById(customerId);
    }

    @Override
    public List<Customer> searchCustomer(String customerName, String customerAddress,String type) throws SQLException {
        return customerRepository.searchCustomer(customerName,customerAddress,type);
    }

    @Override
    public Map<String, String> validate(HttpServletRequest request, HttpServletResponse response) {
        String REGEX_NAME = "^([A-Z]{1}[a-z]{1,}\\s{1}){1,}([A-Z]{1}[a-z]{1,})$";
        String REGEX_PHONE_NUMBER = "^(091|090|\\(\\+84\\)90|\\(\\+84\\)91)\\d{7}$";
        String ID_CARD_REGEX = "^\\d{9}$";
        String REGEX_ADDRESS = "^((\\d{1,})?[//]?)+((\\s)?([A-Z]{1}[a-z]{1,}))+$";

        Map<String, String> error = new HashMap<>();


        String name = request.getParameter("name");
        if (!name.matches(REGEX_NAME)) {
            error.put("customer_name", "Wrong format name");
        }
        String birthday = request.getParameter("birthday");
        int gender = Integer.parseInt(request.getParameter("gender"));
        String idCard = request.getParameter("idcard");

        int phone = Integer.parseInt(request.getParameter("phone"));


        String email = request.getParameter("email");

        int customerTypeId = Integer.parseInt(request.getParameter("typeid"));

        String address = request.getParameter("address");
        if (error.isEmpty()) {

//    public Customer(String customerName, String customerBirthDay, int customerGender,
//    String customerIdCard, int customerPhone, String customerEmail,
//    int customerTypeId, String customerAddress) {


            Customer customer = new Customer(name,birthday,gender,idCard,phone,email,customerTypeId,address );
            create(customer);
        }
        return error;
    }
}
