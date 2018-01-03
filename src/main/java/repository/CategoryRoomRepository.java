/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repository;

import entity.CategoryRoom;
import entity.Room;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;



@Repository
public interface CategoryRoomRepository extends CrudRepository<CategoryRoom, Integer>{
    @Query("select r from Room r where categoryID = :categoryID")
    public List<Room> listRoo (@Param("categoryID") int categoryID);
    
    
    
    
}
