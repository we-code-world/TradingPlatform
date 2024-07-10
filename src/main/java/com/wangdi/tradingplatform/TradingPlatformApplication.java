package com.wangdi.tradingplatform;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(scanBasePackages = "com.wangdi.tradingplatform")
public class TradingPlatformApplication {

    public static void main(String[] args) {
        SpringApplication.run(TradingPlatformApplication.class, args);
    }

}
