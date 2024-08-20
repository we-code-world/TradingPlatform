package com.wangdi.tradingplatform.Controller;

import com.wangdi.tradingplatform.Annotation.AccessLimit;
import com.wangdi.tradingplatform.Entity.*;
import com.wangdi.tradingplatform.Service.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class LoginController {
    private final LoginService loginService;

    @RequestMapping("/login/show")
    public String login(){
        return "login";
    }
    @RequestMapping("/register/show")
    public String page(){
        return "register";
    }
    @RequestMapping("/login/do")
    @ResponseBody
    public Map<String,Object> login(String account, String password, String role) {
        Map<String,Object> map=new HashMap<>();
        String token=loginService.login(account, password, role);
        if(token != null){
            map.put("token", token);
            map.put("result","ok");
        }
        else{
            map.put("result","error");
        }
        return map;
    }
    @RequestMapping("/user/submit")
    @ResponseBody
    public Map<String,Object> register(String pw_info,User user){
        Map<String,Object> map=new HashMap<>();
        String token;
        if(pw_info.equals("ok") && (token = loginService.register(user)) != null){
            map.put("token", token);
            map.put("result","ok");
        }else {
            map.put("result","error");
        }
        return map;
    }
}
