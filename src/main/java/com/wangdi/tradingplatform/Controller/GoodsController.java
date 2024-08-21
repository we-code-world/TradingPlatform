package com.wangdi.tradingplatform.Controller;

import com.alibaba.fastjson.JSONObject;
import com.wangdi.tradingplatform.Annotation.AccessLimit;
import com.wangdi.tradingplatform.Entity.*;
import com.wangdi.tradingplatform.Service.*;
import com.wangdi.tradingplatform.Tools.CommonUtils;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
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
@RequestMapping("/goods")
@AccessLimit()
public class GoodsController {
    private final LoginService loginService;
    private final CartService cartService;
    private final GoodsService goodsService;
    @RequestMapping("/index")
    public String show_index(Model model, HttpServletRequest request){
        List<Goods> list1;
        List<Goods> list2;
        Cookie[] cookies = request.getCookies();
        String token = null;
        for (Cookie cookie: cookies) if ("token".equals(cookie.getName())) token = cookie.getValue();
        User user = loginService.getUser(token);
        list1=goodsService.findSellsByUser(user.getId());
        list2=goodsService.findBuysByUser(user.getId());
        model.addAttribute("goods_list", list1);
        model.addAttribute("buy_list", list2);
        model.addAttribute("user_cart", cartService.getByUser(user.getId()));
        model.addAttribute("username", user.getAccount());
        return "index";
    }
    @RequestMapping("/show")
    public String show(Model model, HttpServletRequest request){
        Cookie[] cookies = request.getCookies();
        String token = null;
        for (Cookie cookie: cookies) if ("token".equals(cookie.getName())) token = cookie.getValue();
        User user = loginService.getUser(token);
        model.addAttribute("userid", user.getAccount());
        model.addAttribute("user_cart", cartService.getByUser(user.getId()));
        return "wts";
    }
    @RequestMapping("/detail")
    public String goodsDetail(Model model, HttpServletRequest request, int id){
        Cookie[] cookies = request.getCookies();
        String token = null;
        for (Cookie cookie: cookies) if ("token".equals(cookie.getName())) token = cookie.getValue();
        Goods good=goodsService.findByID(id);
        User user= loginService.getUser(token);
        model.addAttribute("goods",good);
        model.addAttribute("userid", user.getAccount());
        model.addAttribute("user_cart", cartService.getByUser(user.getId()));
        return "goodsdetail";
    }

    @RequestMapping("/submit")
    @ResponseBody
    public Map<String,Object> submitGoods(Goods wts){
        Map<String,Object> map=new HashMap<String,Object>();
        if(wts.getName()!=null&&wts.getRealPrice()!=0.0&&wts.getPictureUrl()!=null&&wts.getPictureUrl().length()>=10&&wts.getOwnerId()!=0){
            goodsService.save(wts);
            map.put("result","ok");
        }else map.put("result","error");
        return map;
    }
    // 搜索功能可以用ES实现，学习一下！！！！
    @RequestMapping("/search")
    public String search(String description, HttpServletRequest request,Model model){
        Cookie[] cookies = request.getCookies();
        String token = null;
        for (Cookie cookie: cookies) if ("token".equals(cookie.getName())) token = cookie.getValue();
        User user= loginService.getUser(token);
        List<Goods> sells=goodsService.findSellsByUser(user.getId());
        List<Goods> buys=goodsService.findBuysByUser(user.getId());
        if (description.isEmpty()){
            model.addAttribute("sells_list",sells);
            model.addAttribute("buys_list",buys);
            model.addAttribute("userid",user.getId());
            return "index_show";
        }
        List<Goods> rtn_sells=new ArrayList<Goods>();
        List<Goods> rtn_buys =new ArrayList<Goods>();
        for (Goods g:sells) {
            if (CommonUtils.kmpStringMatch(g.getName(),description)!=-1){
                rtn_sells.add(g);
            }else if (CommonUtils.kmpStringMatch(g.getDescribe(),description)!=-1){
                rtn_sells.add(g);
            }
        }
        for (Goods b:buys) {
            if (CommonUtils.kmpStringMatch(b.getName(),description)!=-1){
                rtn_buys.add(b);
            }else if (CommonUtils.kmpStringMatch(b.getDescribe(),description)!=-1){
                rtn_buys.add(b);
            }
        }
        model.addAttribute("goods_list",rtn_sells);
        model.addAttribute("buy_list", rtn_buys);
        model.addAttribute("userid", user.getId());
        return "index_show";
    }
    @RequestMapping("/classes")
    public String searchCatalogId(Model model, HttpServletRequest request, int catalogId){
        Cookie[] cookies = request.getCookies();
        String token = null;
        for (Cookie cookie: cookies) if ("token".equals(cookie.getName())) token = cookie.getValue();
        Goods sell=new Goods();
        User user = loginService.getUser(token);
        sell.setOwnerId(user.getId());
        sell.setCatalogId(catalogId);
        List<Goods> goods=goodsService.findByGoods(sell);
        model.addAttribute("goods_list",goods);
        return "index_show";
    }
    @RequestMapping("/need/show")
    public String needShow(Model model, HttpServletRequest request){
        Cookie[] cookies = request.getCookies();
        String token = null;
        for (Cookie cookie: cookies) if ("token".equals(cookie.getName())) token = cookie.getValue();
        User user= loginService.getUser(token);
        model.addAttribute("user",user);
        model.addAttribute("user_cart", cartService.getByUser(user.getId()));
        return "wtb";
    }
    @RequestMapping("/need/submit")
    @ResponseBody
    public Map<String,Object> submitNeed(Goods goods){
        Map<String,Object> map=new HashMap<String,Object>();
        if(goods.getName()!=null&&goods.getRealPrice()!=0.0&&goods.getOwnerId()!=0){
            map.put("result","ok");
        }else map.put("result","error");
        return map;
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
}
