package server.exception;


import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

/**
 * Created by ileossa on 11/04/2017.
 */
@ResponseStatus(value= HttpStatus.NOT_FOUND, reason="Invalide argument")
public class UserOrTokenException extends RuntimeException {
}
