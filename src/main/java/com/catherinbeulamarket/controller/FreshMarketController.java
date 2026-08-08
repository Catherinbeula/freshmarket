package com.catherinbeulamarket.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/freshmarket")
public class FreshMarketController {

    @GetMapping("/status")
    public String status() {
        return "FreshMarket API is running";
    }
}
