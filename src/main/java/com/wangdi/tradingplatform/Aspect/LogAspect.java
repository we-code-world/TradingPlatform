package com.wangdi.tradingplatform.Aspect;

import com.wangdi.tradingplatform.Annotation.LogAnnotation;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.stereotype.Component;

import java.io.File;
import java.io.FileWriter;
import java.io.Writer;
import java.lang.reflect.Method;

@Aspect
@Component
public final class LogAspect {

    @Around("@annotation(com.wangdi.tradingplatform.Annotation.LogAnnotation)")
    public synchronized Object log(ProceedingJoinPoint pjp) throws Throwable {
        MethodSignature methodSignature = (MethodSignature) pjp.getSignature();
        Method targetMethod = pjp.getTarget().getClass().getDeclaredMethod(methodSignature.getName(), methodSignature.getMethod().getParameterTypes());
        LogAnnotation annotation = targetMethod.getAnnotation(LogAnnotation.class);
        File logFile = new File(annotation.logFile());
        File logDir = logFile.getParentFile();
        if(logDir != null && !logDir.exists())
            if(logDir.mkdirs()) System.out.println("创建路径成功！");
            else System.out.println("创建路径失败！");
        try(Writer out = new FileWriter(annotation.logFile(), true)) {
            out.write(methodSignature.getName());
        }catch (Exception e){
            e.printStackTrace();
        }
        return pjp.proceed();
    }
}
