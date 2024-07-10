package com.wangdi.tradingplatform.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {
    @RequestMapping("/idx")
    public String index(){
        String s = new String();
        StringBuilder a = new StringBuilder();
        a.append(s);
        a.indexOf(s);
        a.insert(1, s);
        return "static_index";
    }
}
