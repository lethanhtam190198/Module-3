package service;

import model.BenhAn;

import java.util.List;

public interface IService {

    List<BenhAn> findAll();

    void create(BenhAn benhAn);

    void delete(int id );

    void edit( BenhAn benhAn);

    BenhAn findById(int id);
}
