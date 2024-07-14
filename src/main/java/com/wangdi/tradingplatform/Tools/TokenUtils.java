package com.wangdi.tradingplatform.Tools;

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

    public static String sign(String name, String value){
        String token = null;
        try {
            Date now = new Date();
            Date expire_time = new Date(System.currentTimeMillis() + EXPIRE_TIME);
            token = JWT.create()
                    .withIssuer(ISSUER)
                    .withClaim(name, value)
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

        try {
            JWTVerifier verifier = JWT.require(Algorithm.HMAC256(TOKEN_SALT)).withIssuer(ISSUER).build();
            DecodedJWT jwt = verifier.verify(token);
            log.info("认证通过");
            return jwt.getClaim(name).asString();
        } catch (Exception e){
            e.printStackTrace();
            log.warn("认证失败");
            return null;
        }
    }
}
