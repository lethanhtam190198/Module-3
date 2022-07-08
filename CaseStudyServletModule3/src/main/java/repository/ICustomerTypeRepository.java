package repository;

import dto.CustomerType;

import java.util.List;

public interface ICustomerTypeRepository {

    List<CustomerType> findAll();
}
