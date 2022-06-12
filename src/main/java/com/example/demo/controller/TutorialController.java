package com.example.demo.controller;

import com.example.demo.model.Tutorial;
import com.example.demo.repository.TutorialRepository;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import static com.example.demo.DemoApplication.DEMO_MESSAGE_QUEUE;

@RestController
public class TutorialController {

    @Autowired
    private RabbitTemplate rabbitTemplate;
    @Autowired
    private TutorialRepository tutorialRepository;

    @GetMapping
    public String something(){
        return "asdfasdfsadfsdaf";
    }

    @GetMapping("/v1/api/tutorials")
    public List<Tutorial> getTutorials(){
        return tutorialRepository.findAll();
    }

    @GetMapping("/v1/api/tutorials/{id}")
    public Tutorial getTutorialById(@PathVariable long id){
        return tutorialRepository.findById(id).orElse(null);
    }

    @PostMapping("/v1/api/tutorials")
    public void addNewTutorial(@RequestBody Tutorial tutorial){
        tutorialRepository.save(tutorial);
        rabbitTemplate.convertAndSend(DEMO_MESSAGE_QUEUE, tutorial.toString());
    }

    @DeleteMapping("/v1/api/tutorials")
    public void deleteAllTutorials(){
        tutorialRepository.deleteAll();
    }

    @DeleteMapping("/v1/api/tutorials/{id}")
    public void deleteTutorialById(@PathVariable long id){
        tutorialRepository.deleteById(id);
    }

}
