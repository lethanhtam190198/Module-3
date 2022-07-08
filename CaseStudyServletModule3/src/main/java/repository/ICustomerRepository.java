package repository;

import model.Customer;

import java.sql.SQLException;
import java.util.List;

public interface ICustomerRepository {
    List<Customer> findAll();

    void create(Customer customer);

    void delete(int customerId );

    void edit( Customer customer);

    Customer findById(int customerId);

    List<Customer> searchCustomer(String customerName, String customerAddress,String type) throws SQLException;

}
