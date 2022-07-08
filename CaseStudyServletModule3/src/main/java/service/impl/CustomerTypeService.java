package service.impl;

import repository.impl.CustomerTypeRepository;
import repository.ICustomerTypeRepository;
import service.ICustomerTypeService;

import java.util.List;

public class CustomerTypeService implements ICustomerTypeService {

    static ICustomerTypeRepository customerTypeRepository = new CustomerTypeRepository();
    @Override
    public List<dto.CustomerType> findAll() {
        return customerTypeRepository.findAll();
    }
}
