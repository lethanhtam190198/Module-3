package repository.impl;

import model.BenhAn;
import repository.BaseRepository;
import repository.IRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BenhAnRepository implements IRepository {

    private static final String FIND_ALL = " SELECT * FROM benh_an ";

    private static final String CREATE = " INSERT INTO benh_an ( ma_benh_an , id_benh_nhan , ten_benh_nhan , ngay_nhap_vien , ngay_ra_vien  ) " + "  values (?,?,?,?,?) ";

    private static final String FIND_BY_ID = "SELECT * FROM benh_an where id = ? ";

    private static final String UPDATE = " UPDATE benh_an SET  ma_benh_an = ? , id_benh_nhan = ? , ten_benh_nhan = ? , ngay_nhap_vien = ? , ngay_ra_vien = ? " + "  where id = ?  ";

    private static final String DELETE = " DELETE FROM benh_an where id = ? ";


    static List<BenhAn> benhAnList = new ArrayList<>();

    @Override
    public List<BenhAn> findAll() {
        benhAnList.clear();
        try {
            Connection connection = new BaseRepository().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            BenhAn benhAn = null;
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String ma_benh_an = resultSet.getString("ma_benh_an");
                int id_benh_nhan = resultSet.getInt("id_benh_nhan");
                String ten_benh_nhan = resultSet.getString("ten_benh_nhan");
                String ngay_nhap_vien = resultSet.getString("ngay_nhap_vien");
                String ngay_ra_vien = resultSet.getString("ngay_ra_vien");
                benhAn = new BenhAn(id, ma_benh_an, id_benh_nhan, ten_benh_nhan, ngay_nhap_vien, ngay_ra_vien);
                benhAnList.add(benhAn);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return benhAnList;
    }

    @Override
    public void create(BenhAn benhAn) {
        try {
            Connection connection = new BaseRepository().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(CREATE);

            preparedStatement.setString(1, benhAn.getMaBenhAn());
            preparedStatement.setInt(2, benhAn.getIdBenhNhan());
            preparedStatement.setString(3, benhAn.getTenBenhNhan());
            preparedStatement.setString(4, benhAn.getNgayNhapVien());
            preparedStatement.setString(5, benhAn.getNgayRaVien());
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void delete(int id) {
        try {
            Connection connection = new BaseRepository().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    public void edit(BenhAn benhAn) {
        try {
            Connection connection = new BaseRepository().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE);
            preparedStatement.setString(1, benhAn.getMaBenhAn());
            preparedStatement.setInt(2, benhAn.getIdBenhNhan());
            preparedStatement.setString(3, benhAn.getTenBenhNhan());
            preparedStatement.setString(4, benhAn.getNgayNhapVien());
            preparedStatement.setString(5, benhAn.getNgayRaVien());
            preparedStatement.setInt(6, benhAn.getIdBenhAn());

            preparedStatement.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }

    @Override
    public BenhAn findById(int id) {
        BenhAn benhAn = null;
        try {
            Connection connection = new BaseRepository().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int ids = resultSet.getInt("id");
                String ma_benh_an = resultSet.getString("ma_benh_an");
                int id_benh_nhan = resultSet.getInt("id_benh_nhan");
                String ten_benh_nhan = resultSet.getString("ten_benh_nhan");
                String ngay_nhap_vien = resultSet.getString("ngay_nhap_vien");
                String ngay_ra_vien = resultSet.getString("ngay_ra_vien");
                benhAn = new BenhAn(ids, ma_benh_an, id_benh_nhan, ten_benh_nhan, ngay_nhap_vien, ngay_ra_vien);
                benhAnList.add(benhAn);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return benhAn;
    }
}
