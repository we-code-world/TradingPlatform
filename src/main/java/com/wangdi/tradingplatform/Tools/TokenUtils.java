package com.wangdi.tradingplatform.Tools;

import com.alibaba.fastjson2.JSON;
import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.auth0.jwt.interfaces.JWTVerifier;
import lombok.extern.slf4j.Slf4j;

import java.util.Date;

@Slf4j
public class TokenUtils {
    private static final long EXPIRE_TIME = 2*60*60*1000;
    private static final String TOKEN_SALT = "token-salt";
    private static final String ISSUER = "token";

    public static String sign(String value){
        return sign("user_id", value);
    }

    public static <T> String sign(String name, T value){
        String token = null;
        String actual = value instanceof String ? (String) value : JSON.toJSONString(value);
        try {
            Date now = new Date();
            Date expire_time = new Date(System.currentTimeMillis() + EXPIRE_TIME);
            token = JWT.create()
                    .withIssuer(ISSUER)
                    .withClaim(name, actual)
                    .withIssuedAt(now)
                    .withExpiresAt(expire_time)
                    .sign(Algorithm.HMAC256(TOKEN_SALT));
        }catch (Exception e){
            e.printStackTrace();
        }
        return token;
    }

    public static String design(String token){
        return design(token, "user_id");
    }

    public static String design(String token, String name){
        return design(token, name, String.class);
    }

    public static <T> T design(String token, String name, Class<T> clazz){

        try {
            JWTVerifier verifier = JWT.require(Algorithm.HMAC256(TOKEN_SALT)).withIssuer(ISSUER).build();
            DecodedJWT jwt = verifier.verify(token);
            log.info("认证通过");
            String value = jwt.getClaim(name).asString();
            if (String.class.isAssignableFrom(clazz)) {
                return (T) value;
            }
            return JSON.parseObject(value, JsonUtils.buildType(clazz));
        } catch (Exception e){
            e.printStackTrace();
            log.warn("认证失败");
            return null;
        }
    }
}
