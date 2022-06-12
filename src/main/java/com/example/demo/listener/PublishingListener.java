package com.example.demo.listener;

import org.springframework.stereotype.Component;

@Component
public class PublishingListener {

    public void receiveMessage(String message) {
        System.out.println("received " + message);
    }
}
