package repository.impl;

import dto.CustomerType;
import dto.Position;
import repository.BaseRepository;
import repository.IPositionRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PositionRepository implements IPositionRepository {

    private static final String FIND_ALL = " Select * From position ";


    @Override
    public List<Position> findAll() {
        List<Position> positionList = new ArrayList<>();
        try {
            Connection connection = new BaseRepository().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            Position position = null;
            while (resultSet.next()) {
                int positionId = resultSet.getInt("position_id");
                String positionName = resultSet.getString("name");
                position = new Position(positionId, positionName);
                positionList.add(position);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();

        }
        return positionList;
    }
}
