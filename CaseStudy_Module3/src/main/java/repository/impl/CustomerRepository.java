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

    List<Customer> customerList= new ArrayList<>();
    private static final String FINDALL="SELECT * FROM customer";

    @Override
    public List<Customer> findAll() {
        customerList.clear();
        try {
            Connection connection = new BaseRepository().getConnection();
            PreparedStatement preparedStatement =
                    connection.prepareStatement(FINDALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            Customer customer = null;
            while (resultSet.next()) {

                int customer_id = resultSet.getInt("customer_id");
                int customer_type_id= resultSet.getInt("customer_type_id");
                String customerName=resultSet.getString("customer_name");
                String customerBirthDay=resultSet.getString("customer_birthday");
                String customerGender=resultSet.getString("customer_gender");
                String customer_id_card=resultSet.getString("customer_id_card");
                String customer_Phone=resultSet.getString("customer_phone");
                String customer_email=resultSet.getString("customer_email");
                String customer_address=resultSet.getString("customer_address");
                //    private int customer_id;
                //    private int customer_type_id;
                //    private String customerName;
                //    private String customerBirthDay;
                //    private String customerGender;
                //    private String customer_id_card;
                //    private String customer_Phone;
                //    private String customer_email;
                //    private String customer_address;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return customerList;
    }

    @Override
    public void create(Customer customer) {

    }

    @Override
    public void edit(int customer_id, Customer customer) {

    }
}
