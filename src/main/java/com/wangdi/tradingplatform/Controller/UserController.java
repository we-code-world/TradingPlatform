package com.wangdi.tradingplatform.Controller;

import com.wangdi.tradingplatform.Annotation.AccessLimit;
import com.wangdi.tradingplatform.Entity.*;
import com.wangdi.tradingplatform.Service.*;
import lombok.RequiredArgsConstructor;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/personal")
@AccessLimit()
public class UserController {
    private final ManageService manageService;
    private final CartService cartService;

    @RequestMapping("/show")
    public String personalPage(Model model,int userid){
        User user= manageService.findUserByID(userid);
        model.addAttribute("user",user);
        model.addAttribute("user_cart", cartService.getByUser(user.getId()));
        return "personal/data";
    }
    // 更新用户信息，如果基础信息未更改则直接修改，否则放入审核表
    @RequestMapping("/update")
    public String updateInfo(Model model, User user){
        int id=user.getId();
        User user1= manageService.findUserByID(id);
        model.addAttribute("user",user);
        model.addAttribute("user_cart", cartService.getByUser(user.getId()));
        return "personaldata";
    }
}
