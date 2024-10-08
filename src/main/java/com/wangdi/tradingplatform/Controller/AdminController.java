package com.wangdi.tradingplatform.Controller;

import com.wangdi.tradingplatform.Annotation.AccessLimit;
import com.wangdi.tradingplatform.Entity.*;
import com.wangdi.tradingplatform.Service.*;
import com.github.pagehelper.PageInfo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/Admin")
@AccessLimit(maxCount = 10, seconds = 5, role = "admin")
public class AdminController {
    private final ManageService manageService;
    private final GoodsService goodsService;
    private final TransactionService transactionService;

    @RequestMapping("/index")
    public String showIndexPage(Model model){
        Administrator administrator = manageService.findAdminByID(1);
        model.addAttribute("admin",administrator);
        return "administrator";
    }
    @RequestMapping("/userinfo")
    public String user(@RequestParam("id") int id, Model model){
        Administrator administrator=manageService.findAdminByID(id);
        List<User> list= manageService.findAllUsers();
        model.addAttribute("admin",administrator);
        model.addAttribute("users",list);
        return "ad_info";
    }
    @RequestMapping("/pageuserinfo")
    public String pageuser(int id,int pageNum,int pageSize ,Model model){
        Administrator administrator=manageService.findAdminByID(id);
        PageInfo<User> list= manageService.pageAllUsers(pageNum,pageSize);
        //PageInfo<User> pagelist=userService.pageByChangeSign();
        model.addAttribute("admin",administrator);
        model.addAttribute("users",list);
        //model.addAttribute("page",pagelist);
        return "ad_info";
    }
    @RequestMapping("/wtb")
    public String wtb(int id, Model model){
        Administrator administrator=manageService.findAdminByID(id);
        List<Goods> list=goodsService.findAll();
        //PageInfo<WTB> pagelist=wtbService.pageAll();
        model.addAttribute("admin",administrator);
        model.addAttribute("wtbs",list);
        //model.addAttribute("pagewtbs",pagelist);
        return "ad_wtb";
    }
    @RequestMapping("/pagewtb")
    public String pagewtb(int id,int pageNum,int pageSize , Model model){
        Administrator administrator=manageService.findAdminByID(id);
        PageInfo<Goods> list=goodsService.pageAll(pageNum,pageSize);
        model.addAttribute("admin",administrator);
        model.addAttribute("wtbs",list);
        //model.addAttribute("pagewtbs",pagelist);
        return "ad_wtb";
    }
    @RequestMapping("/wts")
    public String wts(int id, Model model){
        Administrator administrator=manageService.findAdminByID(id);
        Goods sell_goods = new Goods();
        List<Goods> list=goodsService.findByGoods(sell_goods);
        //PageInfo<WTS> pagelist=wtsService.pageAll();
        model.addAttribute("admin",administrator);
        model.addAttribute("wtss",list);
        //model.addAttribute("pagewtss",pagelist);
        return "ad_wts";
    }
    @RequestMapping("/pagewts")
    public String pagewts(int id, int pageNum,int pageSize ,Model model){
        Administrator administrator=manageService.findAdminByID(id);
        PageInfo<Goods> list=goodsService.pageAll(pageNum, pageSize);
        model.addAttribute("admin",administrator);
        model.addAttribute("wtss",list);
        return "ad_wts";
    }
    @RequestMapping("/deal")
    public String deal(int id, Model model){
        Administrator administrator=manageService.findAdminByID(id);
        List<Transaction> list=manageService.findAll();
        model.addAttribute("admin",administrator);
        model.addAttribute("deals",list);
        return "ad_deal";
    }
    @RequestMapping("/pagedeal")
    public String pagedeal(int id, int pageNum,int pageSize,Model model){
        Administrator administrator=manageService.findAdminByID(id);
        PageInfo<Transaction> list=manageService.pagefindAll(pageNum,pageSize);
        model.addAttribute("admin",administrator);
        model.addAttribute("deals",list);
        //model.addAttribute("pagedeals",pagelist);
        return "ad_deal";
    }
    @RequestMapping("/getWTB")
    @ResponseBody
    public Map<String,Object> getwtb(int id){
        Map<String,Object> map=new HashMap<String,Object>();
        try{
            Goods wtb=goodsService.findByID(id);
            map.put("wtb",wtb);
            map.put("result","ok");
        }catch (Exception e){
            map.put("result","error");
        }
        return map;
    }
    @RequestMapping("/getWTS")
    @ResponseBody
    public Map<String,Object> getwts(int id){
        Map<String,Object> map=new HashMap<String,Object>();
        try{
            Goods wts=goodsService.findByID(id);
            map.put("wts",wts);
            map.put("result","ok");
        }catch (Exception e){
            map.put("result","error");
        }
        return map;
    }
    @RequestMapping("/getUSER")
    @ResponseBody
    public Map<String,Object> getuser(int id){
        Map<String,Object> map=new HashMap<String,Object>();
        try{
            User user= manageService.findUserByID(id);
            map.put("user",user);
            map.put("result","ok");
        }catch (Exception e){
            map.put("result","error");
        }
        return map;
    }
    @RequestMapping("/getDEAL")
    @ResponseBody
    public Map<String,Object> getdeal(int id){
        Map<String,Object> map=new HashMap<String,Object>();
        try{
            Transaction deal=manageService.findByID(id);
            map.put("deal",deal);
            map.put("result","ok");
        }catch (Exception e){
            map.put("result","error");
        }
        return map;
    }
    // 审核通过
    @RequestMapping("/updateWTBpass")
    @ResponseBody
    public Map<String,Object> wtbpass(int id){
        Map<String,Object> map=new HashMap<String,Object>();
        try{
            // 审核
            map.put("result","ok");
        }catch (Exception e){
            map.put("result","error");
        }
        return map;
    }
    @RequestMapping("/updateWTSpass")
    @ResponseBody
    public Map<String,Object> wtspass(int id){
        Map<String,Object> map=new HashMap<>();
        try{
            // 审核
            map.put("result","ok");
        }catch (Exception e){
            map.put("result","error");
        }
        return map;
    }
    @RequestMapping("/updateUSERpass")
    @ResponseBody
    public Map<String,Object> USERpass(int id){
        Map<String,Object> map=new HashMap<>();
        try{
            User user= manageService.findUserByID(id);
            // 消费消息队列中的待审核信息
            // User user1 = kafka.getMessage();
            // 保存用户信息到数据库
            manageService.changeUser(user);
            map.put("result","ok");
        }catch (Exception e){
            map.put("result","error");
        }
        return map;
    }
    @RequestMapping("/updateDEALpass")
    @ResponseBody
    public Map<String,Object> dealpass(int id){
        Map<String,Object> map=new HashMap<>();
        try{
            Transaction deal=manageService.findByID(id);
            manageService.updateByid(deal);
            map.put("result","ok");
        }catch (Exception e){
            map.put("result","error");
        }
        return map;
    }
    @RequestMapping("/updateWTBRefuse")
    @ResponseBody
    public Map<String,Object> wtbRefuse(int id){
        Map<String,Object> map=new HashMap<>();
        try{
            map.put("result","ok");
        }catch (Exception e){
            map.put("result","error");
        }
        return map;
    }
    @RequestMapping("/updateWTSRefuse")
    @ResponseBody
    public Map<String,Object> wtsRefuse(int id){
        Map<String,Object> map=new HashMap<>();
        try{
            map.put("result","ok");
        }catch (Exception e){
            map.put("result","error");
        }
        return map;
    }
    @RequestMapping("/updateUSERRefuse")
    @ResponseBody
    public Map<String,Object> userRefuse(int id){
        Map<String,Object> map=new HashMap<>();
        try{
            User user= manageService.findUserByID(id);
            manageService.changeUser(user);
            map.put("result","ok");
        }catch (Exception e){
            map.put("result","error");
        }
        return map;
    }
    @RequestMapping("/updateDEALRefuse")
    @ResponseBody
    public Map<String,Object> dealRefuse(int id){
        Map<String,Object> map=new HashMap<>();
        try{
            Transaction deal=manageService.findByID(id);
            manageService.updateByid(deal);
            map.put("result","ok");
        }catch (Exception e){
            map.put("result","error");
        }
        return map;
    }
}
