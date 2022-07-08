package repository;


import model.Employee;

import java.util.List;

public interface IEmployeeRepository {
    List<Employee> findAll();

    void create(Employee employee);

    void delete(int employeeId );

    void edit( Employee employee);

    Employee findById (int employeeId);
}
