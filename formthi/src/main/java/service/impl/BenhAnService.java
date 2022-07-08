package service.impl;

import model.BenhAn;
import repository.IRepository;
import repository.impl.BenhAnRepository;
import service.IService;

import java.util.List;

public class BenhAnService implements IService {

    private IRepository benhAnrepository = new BenhAnRepository();

    @Override
    public List<BenhAn> findAll() {
        return benhAnrepository.findAll();
    }

    @Override
    public void create(BenhAn benhAn) {
        benhAnrepository.create(benhAn);
    }

    @Override
    public void delete(int id) {
        benhAnrepository.delete(id);
    }

    @Override
    public void edit(BenhAn benhAn) {
        benhAnrepository.edit(benhAn);
    }

    @Override
    public BenhAn findById(int id) {
        return benhAnrepository.findById(id);
    }
}
