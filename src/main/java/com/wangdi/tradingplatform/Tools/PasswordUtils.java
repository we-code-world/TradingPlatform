package com.wangdi.tradingplatform.Tools;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.codec.binary.Hex;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Random;

@Slf4j
public class PasswordUtils {

    public static String MD5(String passwd) {
        MessageDigest md5 = null;
        try {
            // 生成普通的MD5密码
            md5 = MessageDigest.getInstance("MD5");
        } catch (NoSuchAlgorithmException e) {
            log.error("check jdk!");
            return "";
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
        char[] charArray = passwd.toCharArray();
        byte[] byteArray = new byte[charArray.length];
        for (int i = 0; i < charArray.length; i++)
            byteArray[i] = (byte) charArray[i];
        byte[] md5Bytes = md5.digest(byteArray);
        StringBuffer hexValue = new StringBuffer();
        for (byte md5Byte : md5Bytes) {
            int val = ((int) md5Byte) & 0xff;
            if (val < 16) hexValue.append("0");
            hexValue.append(Integer.toHexString(val));
        }
        return hexValue.toString();
    }

    public static String generateSaltPassword(String password) {
        Random random = new Random();
        //生成一个16位的随机数，也就是所谓的盐
        StringBuilder stringBuilder = new StringBuilder(16);
        stringBuilder.append(random.nextInt(99999999)).append(random.nextInt(99999999));
        int len = stringBuilder.length();
        if (len < 16) stringBuilder.append("0".repeat(Math.max(0, 16 - len)));
        // 生成盐
        String salt = stringBuilder.toString();
        //将盐加到明文中，并生成新的MD5码
        password = md5Hex(password + salt);

        System.out.println(password.length());
        //将盐混到新生成的MD5码中
        char[] cs = new char[48];
        for (int i = 0; i < 48; i += 3) {
            cs[i] = password.charAt(i / 3 * 2);
            char c = salt.charAt(i / 3);
            cs[i + 1] = c;
            cs[i + 2] = password.charAt(i / 3 * 2 + 1);
        }
        return new String(cs);
    }

    public static boolean verifySaltPassword(String password, String md5) {
        if(password == null || password.isEmpty()) return false;
        //先从MD5码中取出之前加的盐和加盐后生成的MD5码
        char[] cs1 = new char[32];
        char[] cs2 = new char[16];
        for (int i = 0; i < 48; i += 3) {
            cs1[i / 3 * 2] = md5.charAt(i);
            cs1[i / 3 * 2 + 1] = md5.charAt(i + 2);
            cs2[i / 3] = md5.charAt(i + 1);
        }
        String salt = new String(cs2);
        String check = new String(cs1);
        //比较二者是否相同
        return check.equals(md5Hex(password + salt));
    }

    private static String md5Hex(String src) {
        try {
            MessageDigest md5 = MessageDigest.getInstance("MD5");
            byte[] bs = md5.digest(src.getBytes());
            return new String(new Hex().encode(bs));
        } catch (Exception e) {
            return "";
        }
    }

}
