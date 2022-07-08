package repository.impl;

import dto.Divison;
import dto.EducationDegree;
import repository.BaseRepository;
import repository.IEducationDegreeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EducationDegreeRepository implements IEducationDegreeRepository {

    private static final String FIND_ALL = " Select * From education_degree ";

    @Override
    public List<EducationDegree> findAll() {
        List<EducationDegree> educationDegreeList = new ArrayList<>();
        try {
            Connection connection = new BaseRepository().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            EducationDegree educationDegree = null;
            while (resultSet.next()) {
                int educationDegreeId = resultSet.getInt("education_degree_id");
                String educationDegreeName = resultSet.getString("name");
                educationDegree = new EducationDegree(educationDegreeId, educationDegreeName);
                educationDegreeList.add(educationDegree);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();

        }
        return educationDegreeList;
    }
}
