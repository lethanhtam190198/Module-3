package service.impl;

import dto.EducationDegree;
import repository.IEducationDegreeRepository;
import repository.IPositionRepository;
import repository.impl.EducationDegreeRepository;
import repository.impl.PositionRepository;
import service.IEducationDegreService;

import java.util.List;

public class EducationDegreeService implements IEducationDegreService {

    static IEducationDegreeRepository educationDegreeRepository = new EducationDegreeRepository();

    @Override
    public List<EducationDegree> findAll() {
        return educationDegreeRepository.findAll();
    }
}
