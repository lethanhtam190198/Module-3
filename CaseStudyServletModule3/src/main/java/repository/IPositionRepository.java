package repository;

import dto.Position;

import java.util.List;

public interface IPositionRepository {
    List<Position> findAll();
}
