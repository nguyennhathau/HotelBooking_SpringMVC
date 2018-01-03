/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repository;

import entity.BookingDetail;
import java.time.LocalDate;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface BookingDetailRepository extends CrudRepository<BookingDetail, Integer>{
       @Query("select r from BookingDetail r where roomID = :roomID")
    public List<BookingDetail> findbookingRoom (@Param("roomID") int roomID);
   
     @Query("select r from BookingDetail r where bookingID = :bookingID")
    public List<BookingDetail> findDetailBook (@Param("bookingID") int bookingID);
    
    @Query("select r from BookingDetail r where ?1 between ?2 and ?3")
    public List<BookingDetail> listBooking(LocalDate date,LocalDate dateFrom,LocalDate dateTo);
    
//    @Query(value = "Select f from FlightEntity f inner join fetch f.route r where (r.addressFrom like %?1%) and (r.addressTo like %?2%) and (f.date =?3)")
//    public List<FlightEntity> searchFlight(String addressFrom, String addressTo, LocalDate depart);
   
}
