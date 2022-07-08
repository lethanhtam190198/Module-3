package service;

import model.Customer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface ICustomerService {
    List<Customer> findAll();

    void create(Customer customer);

    void delete(int customerId );

    void edit(Customer customer);

    Customer findById(int customerId);

    List<Customer> searchCustomer(String customerName, String customerAddress,String type) throws SQLException;

    Map<String, String> validate (HttpServletRequest request, HttpServletResponse response);
}
