package service.impl;

import model.Customer;
import model.Employee;
import repository.IEmployeeRepository;
import repository.impl.EmployeeRepository;
import service.IEmployeeService;

import java.util.List;

public class EmployeeService implements IEmployeeService {

    private IEmployeeRepository employeeRepository = new EmployeeRepository();


    @Override
    public List<Employee> findAll() {
        return employeeRepository.findAll();
    }

    @Override
    public void create(Employee employee) {
        employeeRepository.create(employee);
    }

    @Override
    public void delete(int employeeId) {
        employeeRepository.delete(employeeId);
    }

    @Override
    public void edit( Employee employee) {
        employeeRepository.edit( employee);
    }

    @Override
    public Employee findById(int employeeId) {
        return employeeRepository.findById(employeeId);
    }
}
