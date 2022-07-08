package repository.impl;

import model.Customer;
import repository.BaseRepository;
import repository.ICustomerRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {

    private static final String FIND_ALL = " SELECT * FROM customer ";
    private static final String CREATE = " INSERT INTO customer ( customer_type_id , customer_name , customer_birthday , customer_gender , customer_id_card , customer_phone , customer_email , customer_address ) " + "  values (?,?,?,?,?,?,?,?) ";
    private static final String FIND_BY_ID = "SELECT * FROM customer where customer_id = ? ";
    private static final String UPDATE = " UPDATE customer SET customer_type_id = ? , customer_name = ? , customer_birthday = ? , customer_gender = ? , customer_id_card = ? , customer_phone = ? , customer_email = ? , customer_address = ? " +
            "  where customer_id = ?  ";
    private static final String DELETE = " DELETE FROM customer where customer_id = ? ";

    private static final String SEARCH_CUSTOMER = "SELECT * FROM customer where  customer_name like ? and customer_address like ? and customer_type_id like ?";
    static List<Customer> customerList = new ArrayList<>();

    @Override
    public List<Customer> findAll() {
        customerList.clear();
        try {
            Connection connection = new BaseRepository().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            Customer customer = null;
            while (resultSet.next()) {
                int customerId = resultSet.getInt("customer_id");
                int customerTypeId = resultSet.getInt("customer_type_id");
                String customerName = resultSet.getString("customer_name");
                String customerBirthDay = resultSet.getString("customer_birthday");
                int customerGender = resultSet.getInt("customer_gender");
                String customerIdCard = resultSet.getString("customer_id_card");
                int customerPhone = resultSet.getInt("customer_phone");
                String customerEmail = resultSet.getString("customer_email");
                String customerAddress = resultSet.getString("customer_address");
                customer = new Customer(customerId, customerTypeId, customerName, customerBirthDay, customerGender, customerIdCard,
                        customerPhone, customerEmail, customerAddress);
                customerList.add(customer);

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return customerList;
    }

    @Override
    public void create(Customer customer) {
        try {
            Connection connection = new BaseRepository().getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(CREATE);
            preparedStatement.setInt(1, customer.getCustomerTypeId());
            preparedStatement.setString(2, customer.getCustomerName());
            preparedStatement.setString(3, customer.getCustomerBirthDay());
            preparedStatement.setInt(4, customer.getCustomerGender());
            preparedStatement.setString(5, customer.getCustomerIdCard());
            preparedStatement.setInt(6, customer.getCustomerPhone());
            preparedStatement.setString(7, customer.getCustomerEmail());
            preparedStatement.setString(8, customer.getCustomerAddress());

            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void delete(int customerId) {
        try {
            Connection connection = new BaseRepository().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE);
            preparedStatement.setInt(1, customerId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    public void edit(Customer customer) {
        try {
            Connection connection = new BaseRepository().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE);
            preparedStatement.setInt(1, customer.getCustomerTypeId());
            preparedStatement.setString(2, customer.getCustomerName());
            preparedStatement.setString(3, customer.getCustomerBirthDay());
            preparedStatement.setInt(4, customer.getCustomerGender());
            preparedStatement.setString(5, customer.getCustomerIdCard());
            preparedStatement.setInt(6, customer.getCustomerPhone());
            preparedStatement.setString(7, customer.getCustomerEmail());
            preparedStatement.setString(8, customer.getCustomerAddress());
            preparedStatement.setInt(9, customer.getCustomerId());
            preparedStatement.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }

    @Override
    public Customer findById(int customerId) {
        Customer customer = null;
        try {
            Connection connection = new BaseRepository().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_ID);
            preparedStatement.setInt(1, customerId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int ids = resultSet.getInt("customer_id");
                int customer_type_id = resultSet.getInt("customer_type_id");
                String customer_name = resultSet.getString("customer_name");
                String customer_birthday = resultSet.getString("customer_birthday");
                int customer_gender = resultSet.getInt("customer_gender");
                String customer_id_card = resultSet.getString("customer_id_card");
                int customer_phone = resultSet.getInt("customer_phone");
                String customer_email = resultSet.getString("customer_email");
                String customer_address = resultSet.getString("customer_address");

                customer = new Customer(ids, customer_type_id, customer_name, customer_birthday, customer_gender, customer_id_card,
                        customer_phone, customer_email, customer_address);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return customer;
    }

    @Override
    public List<Customer> searchCustomer(String customerName, String customerAddress,String type) throws SQLException {

        List<Customer> listSearch = new ArrayList<>();
        Connection connection = new BaseRepository().getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_CUSTOMER);
        preparedStatement.setString(1, "%" + customerName + "%");
        preparedStatement.setString(2, "%" + customerAddress + "%");
        preparedStatement.setString(3,"%" + type + "%");
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            int ids = resultSet.getInt("customer_id");
            int customer_type_id = resultSet.getInt("customer_type_id");
            String customer_name = resultSet.getString("customer_name");
            String customer_birthday = resultSet.getString("customer_birthday");
            int customer_gender = resultSet.getInt("customer_gender");
            String customer_id_card = resultSet.getString("customer_id_card");
            int customer_phone = resultSet.getInt("customer_phone");
            String customer_email = resultSet.getString("customer_email");
            String customer_address = resultSet.getString("customer_address");
            listSearch.add(new Customer(ids, customer_type_id, customer_name, customer_birthday, customer_gender, customer_id_card,
                    customer_phone, customer_email, customer_address));
        }
        return listSearch;
    }
}
