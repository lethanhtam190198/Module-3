package reponsitory;

import model.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductReponsitoryImpl implements IProductReponsitory {
    static List<Product> productList = new ArrayList<>();

    static {
        productList.add(new Product(1, "iphone", 150000, "USA"));
        productList.add(new Product(2, "samsung", 200000, "Korea"));
        productList.add(new Product(3, "Xiaomi", 170000, "China"));
    }

    @Override
    public List<Product> findAll() {
        return productList;
    }

    @Override
    public void create(Product product) {
        productList.add(product);
    }

    @Override
    public void edit(int id, Product product) {
        productList.set(id-1, product);
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
        return productList.get(id - 1);
    }

    @Override
    public List<Product> findByName(String name) {
        List<Product> searchList = new ArrayList<>();
        for (Product item :
                productList) {
            if (item.getName().contains(name)) {
                searchList.add(item);
            }
        }
        return searchList;
    }
}
