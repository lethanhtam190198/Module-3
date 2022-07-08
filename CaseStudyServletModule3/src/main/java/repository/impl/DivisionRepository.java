package repository.impl;

import dto.Divison;
import dto.Position;
import repository.BaseRepository;
import repository.IDivisionRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DivisionRepository implements IDivisionRepository {

    private static final String FIND_ALL = " Select * From division ";

    @Override
    public List<Divison> findAll() {
        List<Divison> divisonList = new ArrayList<>();
        try {
            Connection connection = new BaseRepository().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            Divison divison = null;
            while (resultSet.next()) {
                int divisionId = resultSet.getInt("division_id");
                String divisionName = resultSet.getString("name");
                divison = new Divison(divisionId, divisionName);
                divisonList.add(divison);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();

        }
        return divisonList;
    }
}
