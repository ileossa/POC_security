package server.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

/**
 * Created by ileossa on 22/05/2017.
 */
@RestController
@RequestMapping("/")
public class HelloController {

    @RequestMapping(method = GET)
    public String hello(){
        return "hello api";
    }
}
