package repository;

import entity.Pictures;
import entity.Room;
import java.time.LocalDate;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface RoomRepository extends CrudRepository<Room, Integer>{
    
    
     public Room findByRoomID(int id);
    @Query("select p from Pictures p where picID = :picID")
    public List<Pictures> listPic (@Param("picID") int Id);
    
    
    @Query("select r From Room r Where r.roomID = :id")
        public List<Room> searchRoom(@Param("id") int id);
//    @Query(value="select r from room r  left join bookingDetail b on r.roomID=b.roomID \n" +
//"where dateTo <= ?1 or dateTo is null)",nativeQuery = true)
//     public List<Room> searchRoom(LocalDate dateTo);
}