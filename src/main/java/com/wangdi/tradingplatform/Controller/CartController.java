package com.wangdi.tradingplatform.Controller;

import com.wangdi.tradingplatform.Annotation.AccessLimit;
import com.wangdi.tradingplatform.Entity.Cart;
import com.wangdi.tradingplatform.Entity.Goods;
import com.wangdi.tradingplatform.Entity.Transaction;
import com.wangdi.tradingplatform.Entity.User;
import com.wangdi.tradingplatform.Service.*;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

@Controller
@RequiredArgsConstructor
@RequestMapping("/cart")
@AccessLimit()
public class CartController {
    private final CartService cartService;
    private final LoginService loginService;
    private final TransactionService transactionService;

    @RequestMapping("/show")
    public String showCart(Model model, HttpServletRequest request){
        Cookie[] cookies = request.getCookies();
        String token = null;
        for (Cookie cookie: cookies) if ("token".equals(cookie.getName())) token = cookie.getValue();
        User user = loginService.getUser(token);
        model.addAttribute("user_cart", cartService.getByUser(user.getId()));
        model.addAttribute("goods_list", cartService.getGoods(user.getId()));
        return "cart";
    }
    @RequestMapping("/add")
    @ResponseBody
    public Map<String,Object> addCart(HttpServletRequest request, int goods_id){
        Cookie[] cookies = request.getCookies();
        String token = null;
        for (Cookie cookie: cookies) if ("token".equals(cookie.getName())) token = cookie.getValue();
        User user = loginService.getUser(token);
        Map<String,Object> map=new HashMap<>();
        cartService.add(user.getId(), goods_id);
        map.put("user_cart", cartService.getByUser(user.getId()));
        map.put("result","ok");
        return map;
    }
    @RequestMapping("/delete/one")
    @ResponseBody
    public Map<String,Object> deleteOne(HttpServletRequest request, int goods_id){
        Cookie[] cookies = request.getCookies();
        String token = null;
        for (Cookie cookie: cookies) if ("token".equals(cookie.getName())) token = cookie.getValue();
        User user = loginService.getUser(token);
        Map<String,Object> map=new HashMap<>();
        cartService.delete(user.getId(), goods_id);
        map.put("result","ok");
        map.put("user_cart", cartService.getByUser(user.getId()));
        return map;
    }
    @RequestMapping("/delete/all")
    @ResponseBody
    public Map<String,Object> delete(HttpServletRequest request){
        Cookie[] cookies = request.getCookies();
        String token = null;
        for (Cookie cookie: cookies) if ("token".equals(cookie.getName())) token = cookie.getValue();
        User user = loginService.getUser(token);
        Map<String,Object> map=new HashMap<String,Object>();
        cartService.delete(user.getId());
        map.put("result","ok");
        return map;
    }
    // 交易逻辑
    @RequestMapping("/pay/all")
    @ResponseBody
    public Map<String,Object> pay(HttpServletRequest request){
        Cookie[] cookies = request.getCookies();
        String token = null;
        for (Cookie cookie: cookies) if ("token".equals(cookie.getName())) token = cookie.getValue();
        User user = loginService.getUser(token);
        Map<String,Object> map=new HashMap<String,Object>();
        List<Goods> goods =  cartService.getGoods(user.getId());
        transactionService.add(user, goods);
        Cart user_cart = new Cart();
        user_cart.setGoodsNum(0);
        user_cart.setPriceSum(0.0);
        map.put("user_cart", user_cart);
        map.put("goods_list",null);
        return map;
    }
}
