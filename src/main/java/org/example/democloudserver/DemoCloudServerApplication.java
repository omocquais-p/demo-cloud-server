package org.example.democloudserver;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.config.server.EnableConfigServer;

@SpringBootApplication
@EnableConfigServer
public class DemoCloudServerApplication {

    public static void main(String[] args) {
        SpringApplication.run(DemoCloudServerApplication.class, args);
    }

}
