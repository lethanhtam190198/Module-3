package service.impl;

import dto.Divison;
import repository.IDivisionRepository;
import repository.IPositionRepository;
import repository.impl.DivisionRepository;
import repository.impl.PositionRepository;
import service.IDivisionService;

import java.util.List;

public class DivisionService implements IDivisionService {

    static IDivisionRepository divisionRepository = new DivisionRepository();

    @Override
    public List<Divison> findAll() {
        return divisionRepository.findAll();
    }
}
