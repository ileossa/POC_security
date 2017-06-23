package server.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import server.model.Client;

import java.util.Date;
import java.util.List;

@Repository
public interface ClientRepository  extends JpaRepository<Client, Integer> {

    Client findClientByEmailAndPassword(String email, String password);

    Client findFirstByEmail(String email);


}