package com.example.proyectojava.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.StringTokenizer;

@Controller
public class WordCountController {

    @PostMapping("/count")
    public String countWords(@RequestParam("text") String text, Model model) {
        StringTokenizer tokenizer = new StringTokenizer(text);
        int wordCount = tokenizer.countTokens();
        model.addAttribute("wordCount", wordCount);
        return "index";
    }
}
