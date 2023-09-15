package com.cafe.megacoffee.item.controller;

import com.cafe.megacoffee.item.type.ItemType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/item")
public class ItemController {

    @GetMapping("/menuView")
    public String menuView() {
        return "item/menu";
    }

    @GetMapping("/itemList")
    public String drinkView(@RequestParam("itemType")ItemType itemType) {
        return "item/drink";
    }

    @GetMapping("/saveMenu")
    public String saveMenuView() {
        return "item/saveMenu";
    }
}
