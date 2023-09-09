package com.cafe.megacoffee.menu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/menu")
public class MenuController {

    @GetMapping("/menuView")
    public String menuView() {
        return "menu/menu";
    }

    @GetMapping("/drinkView")
    public String drinkView() {
        return "menu/drink";
    }

    @GetMapping("/foodView")
    public String foodView() {
        return "menu/food";
    }

    @GetMapping("/productView")
    public String productView() {
        return "menu/product";
    }

    @GetMapping("/saveMenu")
    public String saveMenuView() {
        return "menu/saveMenu";
    }
}
