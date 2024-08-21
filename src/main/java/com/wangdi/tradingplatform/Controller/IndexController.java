package com.wangdi.tradingplatform.Controller;

import com.wangdi.tradingplatform.Annotation.AccessLimit;
import com.wangdi.tradingplatform.Entity.Administrator;
import com.wangdi.tradingplatform.Entity.Cart;
import com.wangdi.tradingplatform.Entity.User;
import com.wangdi.tradingplatform.Service.CartService;
import com.wangdi.tradingplatform.Service.LoginService;
import com.wangdi.tradingplatform.Service.ManageService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequiredArgsConstructor
@Controller
public class IndexController {
    private final LoginService loginService;
    private final CartService cartService;
    @RequestMapping("/")
    public String index(){
        return "static_index";
    }
    @AccessLimit()
    @RequestMapping("/admin")
    public String showIndexPage(Model model, String token){
        Administrator administrator = loginService.getAdmin(token);
        model.addAttribute("admin", administrator);
        return "administrator";
    }
    @AccessLimit()
    @RequestMapping("/index")
    public String personal(Model model, String token){
        User user= loginService.getUser(token);
        model.addAttribute("user", user);
        model.addAttribute("user_cart", cartService.getByUser(user.getId()));
        return "personal";
    }
}
