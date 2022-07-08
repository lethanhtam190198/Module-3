package service.impl;

import dto.Position;
import repository.ICustomerTypeRepository;
import repository.IPositionRepository;
import repository.impl.CustomerTypeRepository;
import repository.impl.PositionRepository;
import service.IPositionService;

import java.util.List;

public class PositionService implements IPositionService {

    static IPositionRepository positionRepository = new PositionRepository();

    @Override
    public List<Position> findAll() {
        return positionRepository.findAll();
    }
}
