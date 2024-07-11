package com.wangdi.tradingplatform.Controller;

import com.wangdi.tradingplatform.Entity.User;
import com.wangdi.tradingplatform.Service.AdministratorService;
import com.wangdi.tradingplatform.Service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/Register")
public class RegisterConttroller {
    private final UserService userService;
    @RequestMapping("/show")
    public String page(){
        return "register";
    }
    @RequestMapping("/user/submit")
    @ResponseBody
    public Map<String,Object> register(String pw_info,User user){
        Map<String,Object> map=new HashMap<String,Object>();
        if(pw_info.equals("ok") && userService.register(user)){
            map.put("result","ok");
        }else {
            map.put("result","error");
        }
        return map;
    }
    @RequestMapping("/user/check/account")
    @ResponseBody
    public Map<String,Object> acc(String Account){
        Map<String,Object> map=new HashMap<String,Object>();
        if(userService.hasAccount(Account)){
            map.put("result","error");
        }else {
            map.put("result","ok");
        }
        return map;
    }
}
