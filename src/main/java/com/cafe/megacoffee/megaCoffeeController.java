package com.cafe.megacoffee;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class megaCoffeeController {

    @GetMapping("/index")
    public String getIndePage() {
        return "/index";
    }
}
