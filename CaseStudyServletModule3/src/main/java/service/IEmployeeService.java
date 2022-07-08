package service;

import model.Customer;
import model.Employee;

import java.util.List;

public interface IEmployeeService {
    List<Employee> findAll();

    void create(Employee employee);

    void delete(int employeeId );

    void edit( Employee employee);

    Employee findById(int employeeId);

}
