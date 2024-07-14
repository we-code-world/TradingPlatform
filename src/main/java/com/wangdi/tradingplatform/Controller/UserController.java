package com.wangdi.tradingplatform.Controller;

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
@RequestMapping("/Personal")
public class UserController {
    private final ManageService manageService;
    private final TransactionService transactionService;
    private final GoodsService goodsService;
    private final CartService cartService;

    @RequestMapping("/index")
    public String personal(Model model,int userid){
        User user= manageService.findByID(userid);
        Cart user_cart=cartService.findByUser(user.getId());
        model.addAttribute("user",user);
        model.addAttribute("user_cart",user_cart);
        return "personal";
    }
    @RequestMapping("/show")
    public String personalpage(Model model,int userid){
        User user= manageService.findByID(userid);
        Cart user_cart=cartService.findByUser(user.getId());
        model.addAttribute("user",user);
        model.addAttribute("user_cart",user_cart);
        return "personaldata";
    }
    @RequestMapping("/record")
    public String personalrecord(int userid,Model model){
        User user= manageService.findByID(userid);
        Cart user_cart=cartService.findByUser(user.getId());
        List<Transaction> t_s=transactionService.findBySeller(userid);
        List<Transaction> t_b=transactionService.findByBuyer(userid);
        List<Goods> list_s=new ArrayList<Goods>();
        List<Goods> list_b=new ArrayList<Goods>();
        for (Transaction t:t_s) {
            list_s.add(goodsService.findByID(t.getGoodsId()));
        }
        for (Transaction t:t_b) {
            list_b.add(goodsService.findByID(t.getGoodsId()));
        }
        model.addAttribute("user",user);
        model.addAttribute("user_cart",user_cart);
        model.addAttribute("Sells",list_s);
        model.addAttribute("Buys",list_b);
        return "personalrecord";
    }
    @RequestMapping("/Buy/show")
    public String personalwtb(int userid,Model model){
        Goods goods = new Goods();
        goods.setOwnerId(userid);
        goods.setType(0);
        List<Goods> list_b=goodsService.findByGoods(goods);
        User user= manageService.findByID(userid);
        Cart user_cart=cartService.findByUser(user.getId());
        model.addAttribute("user",user);
        model.addAttribute("Buys",list_b);
        model.addAttribute("user_cart",user_cart);
        return "personalwtb";
    }
    @RequestMapping("/Sell/show")
    public String personalwts(int userid,Model model){
        Goods goods = new Goods();
        goods.setOwnerId(userid);
        goods.setType(0);
        List<Goods> list_s= goodsService.findByGoods(goods);
        User user= manageService.findByID(userid);
        Cart user_cart=cartService.findByUser(user.getId());
        model.addAttribute("user",user);
        model.addAttribute("Sells",list_s);
        model.addAttribute("user_cart",user_cart);
        return "personalwts";
    }
    @RequestMapping("/Sell/delete")
    public String del(int id,int userid){
        goodsService.delete(id);
        return "forward:/Personal/Sell/show?userid="+userid;
    }
    // 更新用户信息，如果基础信息未更改则直接修改，否则放入审核表
    @RequestMapping("/update")
    public String updateINFO(User user,Model model){
        int id=user.getId();
        User user1= manageService.findByID(id);
        // 实现一下User的equals函数
        // 放入消息队列让管理员审核
        Cart user_cart=cartService.findByUser(user.getId());
        model.addAttribute("user",user);
        model.addAttribute("user_cart",user_cart);
        return "personaldata";
    }
}
