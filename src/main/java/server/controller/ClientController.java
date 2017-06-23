package server.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import server.model.Client;
import server.repository.ClientRepository;
import server.service.ClientService;

import java.util.Date;
import java.util.concurrent.ThreadLocalRandom;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/client")
public class ClientController {

    @Autowired
    ClientRepository clientRepository;

    @Autowired
    ClientService clientService;


    @RequestMapping(method = POST, value = "/new")
    public boolean addNewClient(@RequestBody Client client){

        Client checkClientExist = clientRepository.findClientByEmailAndPassword(client.getEmail(), client.getPassword());
        if(checkClientExist == null){
            client.setTimestamp(new Date(new Date().getTime()+1000*60));
            Client res = clientRepository.save(client);
            if(res != null)
                return true;
        }
        return false;
    }



    @RequestMapping(method = POST, value = "/log")
    public boolean loginClient(@RequestBody Client clientInput){
        Client client = clientRepository.findClientByEmailAndPassword(clientInput.getEmail(), clientInput.getPassword());
        if(client != null)
            return true;
        else
            return false;

    }


    @RequestMapping(method = POST, value = "sync")
    public int syncClient(@RequestBody Client clientInput){

        Client client = clientRepository.findFirstByEmail(clientInput.getEmail());
        int randomNum = ThreadLocalRandom.current().nextInt(0, 65536 + 1);
        client.setNb1(clientInput.getNb1());
        client.setNb2(randomNum);
        clientRepository.save(client);
        return randomNum;
    }


    
    @RequestMapping(method = GET, value="/getResult")
    public boolean resultSyncWithClient(@RequestParam(value = "email") String email,
                                        @RequestParam(value = "resultClient") int resultClient){

        Client client = clientRepository.findFirstByEmail(email);
        int result = clientService.calculate(client.getNb1(), client.getEquation(), client.getNb2());
        boolean finalResult = client.getTimestamp().before(new Date()) && resultClient == result;
        if(finalResult) {
            client.setTimestamp(new Date());
            client.setNb1(0);
            client.setNb2(0);
            clientRepository.save(client);
        }
        return finalResult;
    }
}