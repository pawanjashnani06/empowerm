/**
 * Info about this package doing something for package-info.java file.
 */
package com.info.rm;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Application class.
 */
@SpringBootApplication
@RestController
public class EmpowermApplication {

    /**
     * Main method.
     *
     * @param args arguments given.
     */
    public static void main(final String[] args) {
        SpringApplication.run(EmpowermApplication.class, args);
    }
	
	@RequestMapping("/")
    public String home() {
        return "Initial startup page updated part 10...!!!";
    }

    @RequestMapping("/home")
    public String HomePage() {
        return "Home page updated part 10...!!!";
    }
}
