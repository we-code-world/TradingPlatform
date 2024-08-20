package com.wangdi.tradingplatform.Controller;

import com.wangdi.tradingplatform.Entity.User;
import com.wangdi.tradingplatform.Service.LoginService;
import com.wangdi.tradingplatform.Service.ManageService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/register")
public class RegisterController {
    private final LoginService loginService;

}
