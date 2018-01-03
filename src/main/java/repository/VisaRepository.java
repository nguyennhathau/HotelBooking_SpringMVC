
package repository;

import entity.VisaCard;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;



@Repository
public interface VisaRepository extends CrudRepository<VisaCard, Integer>{
    
    
    public VisaCard findByNumofCard(String visaNumber);
}
