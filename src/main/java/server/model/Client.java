package server.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.util.Date;
import java.util.Timer;

@Entity
public class Client {


    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int idClient;
    private String email;
    private String password;
    private String equation;
    private int nb1;
    private int nb2;
    private Date timestamp;


    public Client() {
    }

    public Client(String email, String password, String equation) {
        this.email = email;
        this.password = password;
        this.equation = equation;
    }

    public Client(String email, String password, String equation, Date timestamp) {
        this.email = email;
        this.password = password;
        this.equation = equation;
        this.timestamp = timestamp;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEquation() {
        return equation;
    }

    public void setEquation(String equation) {
        this.equation = equation;
    }

    public int getNb1() {
        return nb1;
    }

    public void setNb1(int nb1) {
        this.nb1 = nb1;
    }

    public int getNb2() {
        return nb2;
    }

    public void setNb2(int nb2) {
        this.nb2 = nb2;
    }

    public Date getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Date timestamp) {
        this.timestamp = timestamp;
    }


}
