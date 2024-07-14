package com.wangdi.tradingplatform.Controller;

import com.alibaba.fastjson.JSONObject;
import com.wangdi.tradingplatform.Entity.*;
import com.wangdi.tradingplatform.Service.*;
import com.wangdi.tradingplatform.Tools.CommonUtils;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.*;

@Controller
@RequiredArgsConstructor
@RequestMapping("/Sell")
public class SellController {
    private final ManageService manageService;
    private final CartService cartService;
    @Autowired
    @Qualifier("GoodsServiceImpl")
    private GoodsService goodsService;
    @RequestMapping("/show")
    public String show(int userid,Model model){
        User user= manageService.findByID(userid);
        Cart user_cart=cartService.findByUser(user.getId());
        model.addAttribute("userid",userid);
        model.addAttribute("user_cart",user_cart);
        return "wts";
    }
    @RequestMapping("/index")
    public String show_index(Model model,int userid){
        List<Goods> list1;
        List<Goods> list2;
        User user= manageService.findByID(userid);
        list1=goodsService.findSellsByUser(userid);
        list2=goodsService.findBuysByUser(userid);
        Cart user_cart = new Cart();
        if(cartService.findByUser(user.getId())==null){
            user_cart.setUserId(user.getId());
            cartService.create(user_cart);
        }else user_cart=cartService.findByUser(user.getId());
        model.addAttribute("userid",userid);
        model.addAttribute("goods_list",list1);
        model.addAttribute("buy_list",list2);
        model.addAttribute("user_cart",user_cart);
        model.addAttribute("username",user.getAccount());
        return "index";
    }
    @RequestMapping("/goodsdetail")
    public String goodsdetail(int id,int userid,Model model){
        Goods good=goodsService.findByID(id);
        User user= manageService.findByID(userid);
        Cart user_cart=cartService.findByUser(user.getId());
        model.addAttribute("goods",good);
        model.addAttribute("userid",userid);
        model.addAttribute("user_cart",user_cart);
        return "goodsdetail";
    }
    @RequestMapping("/upload/img")
    @ResponseBody
    public JSONObject upload(@RequestParam(value = "myfile",required=false) MultipartFile file){
        Map<String,Object> map=new HashMap<String,Object>();
        if (!file.isEmpty()) {
            String originalFilename = file.getOriginalFilename();
            long size = file.getSize();
            System.out.println("上传文件名为" + originalFilename + ",上传大小为" + size);
            //uuid是机器码，是唯一的
            String uuid = UUID.randomUUID().toString();
            //获取后缀名
            int lastIndexOf = originalFilename.lastIndexOf(".");
            String substring = originalFilename.substring(lastIndexOf);
            //设置保存路径
            String filenames = "D:/intelliJ/Xianyu_In_School/src/main/webapp/img/" + uuid + substring;
            String url="/img/"+uuid+substring;
            File files = new File(filenames);
            try {
                //以绝对路径保存重名命后的图片
                file.transferTo(files);
                map.put("imgurl",url);
                map.put("result","ok");
            } catch (IllegalStateException e) {
                map.put("result","error");
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
                map.put("result","error");
            }
        }
        return new JSONObject(map);
    }
    @RequestMapping("/submit")
    @ResponseBody
    public Map<String,Object> sub(Goods wts){
        Map<String,Object> map=new HashMap<String,Object>();
        if(wts.getName()!=null&&wts.getRealPrice()!=0.0&&wts.getPictureUrl()!=null&&wts.getPictureUrl().length()>=10&&wts.getOwnerId()!=0){
            goodsService.save(wts);
            map.put("result","ok");
        }else map.put("result","error");
        return map;
    }
    @RequestMapping("/serch")
    public String serch(String descript,int userid,Model model){
        List<Goods> sells=goodsService.findSellsByUser(userid);
        List<Goods> buys=goodsService.findBuysByUser(userid);
        if (descript.equals("")){
            model.addAttribute("sells_list",sells);
            model.addAttribute("buys_list",buys);
            model.addAttribute("userid",userid);
            return "index_show";
        }
        List<Goods> rtn_sells=new ArrayList<Goods>();
        List<Goods> rtn_buys =new ArrayList<Goods>();
        for (Goods g:sells) {
            if (CommonUtils.kmpStringMatch(g.getName(),descript)!=-1){
                rtn_sells.add(g);
            }else if (CommonUtils.kmpStringMatch(g.getDescribe(),descript)!=-1){
                rtn_sells.add(g);
            }
        }
        for (Goods b:buys) {
            if (CommonUtils.kmpStringMatch(b.getName(),descript)!=-1){
                rtn_buys.add(b);
            }else if (CommonUtils.kmpStringMatch(b.getDescribe(),descript)!=-1){
                rtn_buys.add(b);
            }
        }
        model.addAttribute("goods_list",rtn_sells);
        model.addAttribute("buy_list", rtn_buys);
        model.addAttribute("userid",userid);
        return "index_show";
    }
    @RequestMapping("/classes")
    public String serchcatelogId(int catelogId,int userid,Model model){
        Goods sell=new Goods();
        sell.setOwnerId(userid);
        sell.setCatalogId(catelogId);
        List<Goods> goods=goodsService.findByGoods(sell);
        model.addAttribute("goods_list",goods);
        return "index_show";
    }
}
