package com.wangdi.tradingplatform.Interceptor;

import com.wangdi.tradingplatform.Annotation.AccessLimit;
import com.wangdi.tradingplatform.Service.LoginService;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.jetbrains.annotations.NotNull;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
@RequiredArgsConstructor
public class AccessInterceptor implements HandlerInterceptor {
    private final LoginService loginService;
    @Override
    public boolean preHandle(@NotNull HttpServletRequest request, @NotNull HttpServletResponse response, @NotNull Object handler) throws Exception {
        if(!(handler instanceof HandlerMethod handlerMethod)) return false;
        AccessLimit accessLimit = handlerMethod.getBeanType().getAnnotation(AccessLimit.class);
        // 类上没有注解时，查看方法上的注解
        if (accessLimit == null) accessLimit = handlerMethod.getMethodAnnotation(AccessLimit.class);
        if(accessLimit != null){
            int seconds = accessLimit.seconds();
            int maxCount = accessLimit.maxCount();
            boolean login = accessLimit.needLogin();
            if(login){
                Cookie tokenCookie = null;
                Cookie[] cookies = request.getCookies();
                for (Cookie cookie: cookies) if("token".equals(cookie.getName())) tokenCookie = cookie;
                String accessToken = request.getParameter("token");
                if (accessToken == null && tokenCookie != null) {
                    accessToken = tokenCookie.getValue();
                }
                if((accessToken = loginService.checkLogin(accessToken)) == null){
                    response.sendRedirect("/login/show");
                    return false;
                }
                if(tokenCookie == null) {
                    tokenCookie = new Cookie("token", accessToken);
                }else tokenCookie.setValue(accessToken);
                response.addCookie(tokenCookie);
            }
        }
        return HandlerInterceptor.super.preHandle(request, response, handler);
    }
}
