package com.utimes.study.web;

/**
 * Created by nevernew on 12/19/13.
 */

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller

public class SearchController {


    @RequestMapping("/admin/search")
    public String search(@RequestParam(value="name", required=false, defaultValue="World") String name, Model model) {
        model.addAttribute("name", name);
        return "search";
    }

}
