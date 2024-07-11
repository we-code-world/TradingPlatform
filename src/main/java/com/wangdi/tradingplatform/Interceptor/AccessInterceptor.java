package com.wangdi.tradingplatform.Interceptor;

import com.wangdi.tradingplatform.Annotation.AccessLimit;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class AccessInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if(!(handler instanceof HandlerMethod handlerMethod)) return false;
        AccessLimit accessLimit = handlerMethod.getBeanType().getAnnotation(AccessLimit.class);
        if (accessLimit == null) {
            System.out.println(handlerMethod.getBeanType());
            System.out.println("类上没有注解！");
            accessLimit = handlerMethod.getMethodAnnotation(AccessLimit.class);
        }
        if(accessLimit != null){
            int seconds = accessLimit.seconds();
            int maxCount = accessLimit.maxCount();
            boolean login = accessLimit.needLogin();
            if(login){
                System.out.println("ACCESS!");
            }
        }
        return HandlerInterceptor.super.preHandle(request, response, handler);
    }
}
