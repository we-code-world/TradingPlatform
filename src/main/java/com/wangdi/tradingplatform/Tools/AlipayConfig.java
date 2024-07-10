package com.wangdi.tradingplatform.Tools;
/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

import java.io.FileWriter;
import java.io.IOException;

public class AlipayConfig {

//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

    // 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
    public static String app_id = "2016102500758473";

    // 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCryiqz5KyhRlqVeLxPMSeR+reDho13PYiukuQ/iPfCoVAise07BMK1QXoguDq7+7wlGF/M++aG1VVkr2hoqt2SmepfTpwGRQYRqPlwaN7StYJ2YHDiRUxXSNH/I88wRn9Gawm5aIwp5KSWWT53Hk8T7QNMVoSEIVkUcyOStd2TgX/LjfKM1gKN+jDKPVrZP2njcLA+v0S7LM9fTOVPk/HD5BIBa2LQsXxODg4SyjvmF97J8x2TpVqDWDEGVaIsGVw4Lihx7c11KXxsryEHY4Nw1NepH2GCFLm/FZdJEWH7XTr1jYL+PPcpbiEGZ8auU/Op5+GIsHOMcFDgKfVQg/rlAgMBAAECggEAP4IJr1+GgkikDEYKN6yQWGM7nKANhFt3QDKFtwdHsOg529mzPfJQmPmP0LDK5dv2fjA4mms1mfscCpDeJHOmXiAQiRNikt7Jk5XIQUpDtdnsVR7qHHxJ8Kq3F3+BhPNK8hl4Ctcfmg0w23Q6p4bI7TDd20bQzpgVen3mVMJvG6xVJtbO/YREo8Kc6LQy35nacVFxdQdA5SC32QD9H11pDLC0LaTRLAFwdLYFjuRqWktqS7B/4nXGwZVyOAmNOHTjNHqIy55kMzcXX72siAGJyV7Or4HMTmRQup8sHE5Na1KGQ212VQf/YYpGLOmA8ma7wQIPOsVQOwiG6VXxrHX1AQKBgQDTbZUjqjCR1jyGcB7CWppmAfwUI2GUH19/yjTv/ogF23vv884vrnYe/r1qB+hL1V5AQBkoO3lTZpyhM4MqLDwAmst7mrn/shwQWLEM11TgKh/Ah8AQGfdbXQo6vEznvvybr2bw0Ry62U0p8Trh6o8mII2rklKn01DcSjUdy0vokQKBgQDQAV6QM+NAXblY6hAaa32lC+QTcAP7oA3BQegtGlQl9TyiDKx4UCWCL0B4tgkauXib+EK8+UTouvijFKx1huEqUbZjkoeztalwEDhGbFkBaYcQIdUHRYkG/Wl/2MbpH1eEtfy1vLfg62S4HcIyXVJIqFsYiXxSYFDXwyvMCob3FQKBgQDLbJQiTI2Ow+JYN2hg92u22hIADkrEiasI+TUV9IBLonIM3Td1CRb9m3wDmLgYvqKAjyulWhPR+tiZAUciPI0+x7EgrC5ppqT51VwETuqLA/yo8fQJifJFJa/B84rLLyc9Y/ZXndtWq91ijYdp9pTkyk2E1rRQZTFXws54bDINAQKBgCcEKr23zeez7OFdvjmGciH0UgrHVyfqxMm8WBWlu6UHFCF9aRiESBTcUiaSVrDZm2L+NV6HD0LsV1kXtqWw8Clk/GY/BQ9Tgv3PPQ8Qob1fEwOWpQPhKivSeuiNO/pcc6kkDcv1IzSgUtsqUdPqp1WTpsq6d0RoZqGiLWPvkZNlAoGAGeMgQopUHoW6YYUzZW68qg0s7W+0vjEb2yrO8IEBQc8UjQtFuRbI80RJzzPo61/uuf+AXRjVL6PWf0dO0pefHiomFPSxUSKc1EhYiiUEB+yJCLLQ5ah8XHk1pmDeWBezqWbp/biFoK6hUdgYAlZF4vfNSOXws2rYO4Ig/2VOF0A=";

    // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAz9Ga3wdnnCaQtFbG8hqfO1qpIQNBZLu/Zg9VXc5X1f6x1JlSd/G9kLa8ydbsb3ZY4EsZLv6C9ET9AiVRzsPksLH8hQ52plAR691iFY0Q4OlUDmdYPkfV89HuNaBuOXioDiEkgEm/j8TRgAtN5la9Cge8OrJ2uBrY5ofLabAlQcJvHkiV6Muacyr1WaJdARHVKSJUbYr3GA6JFTMNGRFhARb/Hdh37VFSK7bQv6ObyETrGjYvV9TqkcbxPYzHTb+U+O2mpCAzm7nxwzvTb3ntOsS0aAocZPxxbJ94zjbsBL1cUwcCYoXvY7lheprhDo/3I0e1ZkDLHhjBzdc52pGpEwIDAQAB";
    //public static String alipay_public_key =
    // 服务器异步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String notify_url = "http://wdpersonal.xyz/Xianyu_In_School/Pay/notify";

    // 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String return_url = "http://wdpersonal.xyz/Xianyu_In_School/Pay/return";

    // 签名方式
    public static String sign_type = "RSA2";

    // 字符编码格式
    public static String charset = "utf-8";

    // 支付宝网关
    //public static String gatewayUrl = "https://openapi.alipay.com/gateway.do";
    public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";

    // 支付宝网关
    public static String log_path = "D:\\intelliJ\\Xianyu_In_School\\log";

//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /**
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     *
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis() + ".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
