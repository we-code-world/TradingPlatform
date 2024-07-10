package com.wangdi.tradingplatform.Controller;

import com.wangdi.tradingplatform.Entity.*;
import com.wangdi.tradingplatform.Service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/Login")
public class LoginController {
    @Autowired
    @Qualifier("AdministratorServiceImpl")
    private AdministratorService administratorService;
    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;

    @RequestMapping("/show")
    public String login(){
        return "login";
    }

    @RequestMapping("/allAdmin")
    public String list(Model model) {
        List<Administrator> list = administratorService.findAll();
        model.addAttribute("list", list);
        return "allAdmin";
    }
    @RequestMapping("/user")
    @ResponseBody
    public Map<String,Object> login_user(String Account, String password) {
        Map<String,Object> map=new HashMap<String,Object>();
        User user=userService.findByAccount(Account);
        if(user!=null&&password.equals(user.getPassword())){
            map.put("role","user");
            map.put("userid",user.getId());
            map.put("result","ok");
        }
        else{
            map.put("result","error");
        }
        return map;
    }
    @RequestMapping("/admin")
    @ResponseBody
    public Map<String,Object> login_admin(String Account,String password) {
        Map<String,Object> map=new HashMap<String,Object>();
        Administrator admin=administratorService.findByAccount(Account);
        if(admin!=null&&password.equals(admin.getPassword())){
            map.put("role","admin");
            map.put("id",admin.getId());
            map.put("result","ok");
        }
        else {
            map.put("result","error");
        }
        return map;
    }
}
