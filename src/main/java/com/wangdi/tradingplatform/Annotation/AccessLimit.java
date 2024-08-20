package com.wangdi.tradingplatform.Annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.TYPE, ElementType.METHOD})
public @interface AccessLimit {
    int seconds()default 0;
    int maxCount()default 0;
    boolean needLogin()default true;
    String role()default "user";
}
