/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repository;

import entity.Account;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AccountRepository extends CrudRepository<Account, Integer>{
    List<Account> findByUserNameAndPassword(String userName, String password);
    List<Account> findByUserName(String userName);
    
     public List<Account> findAllByOrderByAccountIDAsc();
     public List<Account> findAllByOrderByAccountIDDesc();
     
     @Query(value = " select * from account a order by a.status", nativeQuery = true)
     
     //status
     List<Account> sortAccountBystatus();
     List<Account> findAllByOrderByStatusDesc();
     
     //role
     @Query(value = " select * from account a inner join role r on a.roleID = r.roleID order by a.roleID", nativeQuery = true)
     List<Account> sortbyrole();
     
     @Query(value = " select * from account a inner join role r on a.roleID = r.roleID order by a.roleID desc", nativeQuery = true)
     List<Account> sortbyroleDesc();
}
