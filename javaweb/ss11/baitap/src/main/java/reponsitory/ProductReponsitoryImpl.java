package reponsitory;

import model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductReponsitoryImpl implements IProductReponsitory {
    static List<Product> productList = new ArrayList<>();

    private static final String FIND_ALL = " SELECT * FROM product ";
    private static final String FIND_BY_NAME = " SELECT * FROM product where name like ? ";
    private static final String INSERT = " INSERT INTO product ( name , price , producer ) " + "  values( ?, ?, ?) ";
    private static final String FIND_BY_ID = "SELECT * FROM product where id = ? ";
    private static final String UPDATE = " UPDATE product SET name = ? , price = ? , " +
            " producer = ? where id = ?  " ;



    @Override
    public List<Product> findAll() {
        productList.clear();
        try {
            Connection connection = new BaseReponsitory().getConnection();
            PreparedStatement preparedStatement =
                    connection.prepareStatement(FIND_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            Product product = null;
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                float frice = resultSet.getFloat("price");
                String producer = resultSet.getString("producer");
                product = new Product(id, name, frice, producer);
                productList.add(product);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return productList;
    }

    @Override
    public void create(Product product) {
        try {
            Connection connection = new BaseReponsitory().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT);
            preparedStatement.setString(1, product.getName());
            preparedStatement.setFloat(2, product.getPrice());
            preparedStatement.setString(3, product.getProducer());
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void edit(int id, Product product) {
        try{
            Connection connection= new BaseReponsitory().getConnection();
            PreparedStatement preparedStatement =connection.prepareStatement(UPDATE);
            preparedStatement.setString(1,product.getName());
            preparedStatement.setFloat(2,product.getPrice());
            preparedStatement.setString(3,product.getProducer());
            preparedStatement.setInt(4,product.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void delete(int id) {
        productList.remove(id - 1);
    }

    @Override
    public void seeDetails() {

    }

    @Override
    public Product findById(int id) {
        Product product=null;
        try{
            Connection connection = new BaseReponsitory().getConnection();
            PreparedStatement preparedStatement= connection.prepareStatement(FIND_BY_ID);
            preparedStatement.setInt(1,id);
            ResultSet resultSet= preparedStatement.executeQuery();
            while (resultSet.next()){
                int ids=resultSet.getInt("id");
                String name= resultSet.getString("name");
                float price= resultSet.getFloat("price");
                String producer= resultSet.getString("producer");
                product=new Product(ids,name,price,producer);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return product;
    }

    @Override
    public List<Product> findByName(String name1) {
        productList.clear();
        try{
            Connection connection= new BaseReponsitory().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_NAME);
            preparedStatement.setString(1,"%" + name1 + "%");
            ResultSet resultSet= preparedStatement.executeQuery();
            Product product = null;
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                float price = resultSet.getFloat("price");
                String producer = resultSet.getString("producer");
                product = new Product(id, name, price, producer);
                productList.add(product);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return productList;
    }
}
