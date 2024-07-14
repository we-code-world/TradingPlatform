package com.wangdi.tradingplatform.Controller;

import com.wangdi.tradingplatform.Entity.Cart;
import com.wangdi.tradingplatform.Entity.Goods;
import com.wangdi.tradingplatform.Entity.Transaction;
import com.wangdi.tradingplatform.Entity.User;
import com.wangdi.tradingplatform.Service.CartService;
import com.wangdi.tradingplatform.Service.GoodsService;
import com.wangdi.tradingplatform.Service.TransactionService;
import com.wangdi.tradingplatform.Service.ManageService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

@Controller
@RequiredArgsConstructor
@RequestMapping("/Cart")
public class CartController {
    private final CartService cartService;
    private final ManageService manageService;
    private final GoodsService goodsService;
    private final TransactionService transactionService;

    @RequestMapping("/show")
    public String showCart(int userid,Model model){
        List<Goods> list=new ArrayList<Goods>();
        Cart user_cart=new Cart();
        if(cartService.findByUser(userid)==null){
            user_cart.setUserId(userid);
            cartService.create(user_cart);
        }else user_cart=cartService.findByUser(userid);
        int []goods=user_cart.showGoods();
        for (int g:goods) {
            list.add(goodsService.findByID(g));
        }
        model.addAttribute("user_cart",user_cart);
        model.addAttribute("userid",userid);
        model.addAttribute("goods_list",list);
        return "cart";
    }
    @RequestMapping("/add")
    @ResponseBody
    public Map<String,Object> addCart(int goodsid,int userid){
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("userid",userid);
        Cart user_cart=new Cart();
        if(cartService.findByUser(userid)==null){
            user_cart.setUserId(userid);
            cartService.create(user_cart);
        }else user_cart=cartService.findByUser(userid);
        for (int gid:user_cart.showGoods()) {
            if(gid==goodsid){
                map.put("result","error");
                map.put("user_cart",user_cart);
                return map;
            }
        }
        user_cart.setUserId(userid);
        String goods=user_cart.getGoodsId();
        goods=goods+goodsid+",";
        user_cart.setGoodsId(goods);
        double price=user_cart.getPriceSum();
        Goods good=goodsService.findByID(goodsid);
        price=price+good.getPrice();
        user_cart.setPriceSum(price);
        int number=user_cart.getGoodsNum()+1;
        user_cart.setGoodsNum(number);
        cartService.change(user_cart);
        map.put("user_cart",user_cart);
        map.put("result","ok");
        return map;
    }
    @RequestMapping("/delete/one")
    @ResponseBody
    public Map<String,Object> delone(int id,int gid){
        Map<String,Object> map=new HashMap<String,Object>();
        Cart cart=cartService.findByUser(id);
        Goods goods=goodsService.findByID(gid);
        cart.setGoodsNum(cart.getGoodsNum()-1);
        cart.setPriceSum(cart.getPriceSum()-goods.getPrice());
        String g=cart.getGoodsId();
        cart.setGoodsId(g.replaceAll(gid+",",""));
        cartService.change(cart);
        map.put("result","ok");
        map.put("user_cart",cart);
        return map;
    }
    @RequestMapping("/delete/all")
    @ResponseBody
    public Map<String,Object> del(int id){
        Map<String,Object> map=new HashMap<String,Object>();
        Cart cart=cartService.findByUser(id);
        cart.setGoodsNum(0);
        cart.setPriceSum(0.0);
        cart.setGoodsId("");
        cartService.change(cart);
        map.put("result","ok");
        return map;
    }
    // 交易逻辑
    @RequestMapping("/pay/all")
    @ResponseBody
    public Map<String,Object> pay(int cartid){
        Map<String,Object> map=new HashMap<String,Object>();
        Cart user_cart=cartService.findByID(cartid);
        int userid=user_cart.getUserId();
        User user= manageService.findByID(userid);
        user.setCharge(user.getCharge()-user_cart.getPriceSum());
        manageService.change(user);
        int []goods=user_cart.showGoods();
        for (int good:goods) {
            Goods sell=goodsService.findByID(good);
            Transaction ta=new Transaction();
            transactionService.save(ta);
        }
        user_cart.setGoodsNum(0);
        user_cart.setPriceSum(0.0);
        user_cart.setGoodsId("");
        cartService.change(user_cart);
        map.put("user_cart",user_cart);
        map.put("userid",userid);
        map.put("goods_list",null);
        return map;
    }
}
