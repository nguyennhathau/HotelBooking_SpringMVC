/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repository;

import entity.ServicesDetail;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ServicesDetailRepo extends CrudRepository<ServicesDetail, Integer>{
//    List<ServicesDetailEntity> findByBookDetailID(int id); 
    
//    @Query("select s From ServicesDetail s Where s.bookDetailID = %?1%)")
//     public List<ServicesDetail> getServiceRoom(BookingDetail bookDetailID);
    
    @Query("select s from ServicesDetail s where bookDetailID = :bookDetailID")
    public List<ServicesDetail> getServiceRoom (@Param("bookDetailID") int bookDetailID);
}
