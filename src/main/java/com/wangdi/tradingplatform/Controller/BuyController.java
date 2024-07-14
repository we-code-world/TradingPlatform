package com.wangdi.tradingplatform.Controller;

import com.wangdi.tradingplatform.Entity.Cart;
import com.wangdi.tradingplatform.Entity.Goods;
import com.wangdi.tradingplatform.Entity.User;
import com.wangdi.tradingplatform.Service.CartService;
import com.wangdi.tradingplatform.Service.ManageService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/Buy")
public class BuyController {
    private final ManageService manageService;
    private final CartService cartService;

    @RequestMapping("/show")
    public String SHOW(Model model,int userid){
        User user= manageService.findByID(userid);
        Cart user_cart=cartService.findByUser(user.getId());
        model.addAttribute("user",user);
        model.addAttribute("user_cart",user_cart);
        return "wtb";
    }
    @RequestMapping("/submit")
    @ResponseBody
    public Map<String,Object> sub(Goods goods){
        Map<String,Object> map=new HashMap<String,Object>();
        if(goods.getName()!=null&&goods.getRealPrice()!=0.0&&goods.getOwnerId()!=0){
            map.put("result","ok");
        }else map.put("result","error");
        return map;
    }
}
