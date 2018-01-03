/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repository;


import entity.PromotionDetail;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;


@Repository
public interface PromotionDetailRepository extends CrudRepository<PromotionDetail, Integer>{
    

    @Query("select r from PromotionDetail r where roomID = :roomID")
    public List<PromotionDetail> findProDetail (@Param("roomID") int roomID);
}
