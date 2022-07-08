package repository.impl;

import model.Customer;
import model.Employee;
import repository.BaseRepository;
import repository.IEmployeeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepository implements IEmployeeRepository {

    private static final String FIND_ALL = " SELECT * FROM employee ";
    private static final String CREATE = " INSERT INTO employee ( name  , date_of_birth , id_card , salary , phone_number , email , address ,  position_id , education_degree_id , division_id, user_name ) " + "  values (?,?,?,?,?,?,?,?,?,?,?) ";
    private static final String FIND_BY_ID = "SELECT * FROM employee where employee_id = ? ";
    private static final String UPDATE = " UPDATE employee SET  name = ? , date_of_birth = ? , id_card = ? , salary = ? , phone_number = ? , email = ? , address = ? , position_id = ? , education_degree_id = ? , division_id = ? , user_name = ? " +
            "  where employee_id = ?  ";
    private static final String DELETE = " DELETE FROM employee where employee_id = ? ";


    static List<Employee> employeeList = new ArrayList<>();

    @Override
    public List<Employee> findAll() {
        employeeList.clear();
        try {
            Connection connection = new BaseRepository().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            Employee employee = null;
            while (resultSet.next()) {
                int employeeId = resultSet.getInt("employee_id");
                String employeeName = resultSet.getString("name");
                String employeeBirthDay = resultSet.getString("date_of_birth");
                String employeeIdCard = resultSet.getString("id_card");
                double employeeSalary = resultSet.getDouble("salary");
                int employeePhone = resultSet.getInt("phone_number");
                String employeeEmail = resultSet.getString("email");
                String employeeAddress = resultSet.getString("address");
                int employeePositionId = resultSet.getInt("position_id");
                int employeeEducationDegreeId = resultSet.getInt("education_degree_id");
                int employeeDivisionId = resultSet.getInt("division_id");
                String employeeUserName = resultSet.getString("user_name");
                employee = new Employee(employeeId, employeeName,
                        employeeBirthDay, employeeIdCard, employeeSalary,
                        employeePhone, employeeEmail, employeeAddress,
                        employeePositionId, employeeEducationDegreeId,
                        employeeDivisionId, employeeUserName);
                employeeList.add(employee);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return employeeList;
    }


    @Override
    public void create(Employee employee) {
        try {
            Connection connection = new BaseRepository().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(CREATE);

            preparedStatement.setString(1, employee.getEmployeeName());
            preparedStatement.setString(2, employee.getEmployeeBirthDay());
            preparedStatement.setString(3, employee.getEmployeeIdCard());
            preparedStatement.setDouble(4, employee.getEmployeeSalary());
            preparedStatement.setInt(5, employee.getEmployeePhone());
            preparedStatement.setString(6, employee.getEmployeeEmail());
            preparedStatement.setString(7, employee.getEmployeeAddress());
            preparedStatement.setInt(8, employee.getEmployeePositionId());
            preparedStatement.setInt(9, employee.getEmployeeEducationDegreeId());
            preparedStatement.setInt(10, employee.getEmployeeDivisionId());
            preparedStatement.setString(11, employee.getEmployeeUserName());

            preparedStatement.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void delete(int employeeId) {
        try {
            Connection connection = new BaseRepository().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE);
            preparedStatement.setInt(1, employeeId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    public void edit( Employee employee) {
        try {
            Connection connection = new BaseRepository().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE);

            preparedStatement.setString(1, employee.getEmployeeName());
            preparedStatement.setString(2, employee.getEmployeeBirthDay());
            preparedStatement.setString(3, employee.getEmployeeIdCard());
            preparedStatement.setDouble(4, employee.getEmployeeSalary());
            preparedStatement.setInt(5, employee.getEmployeePhone());
            preparedStatement.setString(6, employee.getEmployeeEmail());
            preparedStatement.setString(7, employee.getEmployeeAddress());
            preparedStatement.setInt(8, employee.getEmployeePositionId());
            preparedStatement.setInt(9, employee.getEmployeeEducationDegreeId());
            preparedStatement.setInt(10, employee.getEmployeeDivisionId());
            preparedStatement.setString(11, employee.getEmployeeUserName());
            preparedStatement.setInt(12, employee.getEmployeeId());

            preparedStatement.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }

    @Override
    public Employee findById(int employeeId) {
        Employee employee = null;
        try {
            Connection connection = new BaseRepository().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_ID);
            preparedStatement.setInt(1, employeeId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int ids = resultSet.getInt("employee_id");
                String employeeName = resultSet.getString("name");
                String employeeBirthDay = resultSet.getString("date_of_birth");
                String employeeIdCard = resultSet.getString("id_card");
                double employeeSalary = resultSet.getInt("salary");
                int employeePhone = resultSet.getInt("phone_number");
                String employeeEmail = resultSet.getString("email");
                String employeeAddress = resultSet.getString("address");
                int employeePositionId = resultSet.getInt("position_id");
                int employeeEducationDegreeId = resultSet.getInt("education_degree_id");
                int employeeDivisionId = resultSet.getInt("division_id");
                String employeeUserName = resultSet.getString("user_name");

                employee = new Employee(ids, employeeName, employeeBirthDay, employeeIdCard,
                        employeeSalary, employeePhone, employeeEmail, employeeAddress,
                        employeePositionId, employeeEducationDegreeId, employeeDivisionId,
                        employeeUserName);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return employee;
    }
}

