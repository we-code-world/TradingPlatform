package com.wangdi.tradingplatform.Interceptor;

import com.wangdi.tradingplatform.Annotation.AccessLimit;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

public class AccessInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if(!(handler instanceof HandlerMethod handlerMethod)) return false;
        AccessLimit accessLimit = handlerMethod.getMethodAnnotation(AccessLimit.class);
        if(accessLimit != null){
            int seconds = accessLimit.seconds();
            int maxCount = accessLimit.maxCount();
            boolean login = accessLimit.needLogin();
            if(login){

            }
        }
        return HandlerInterceptor.super.preHandle(request, response, handler);
    }
}
