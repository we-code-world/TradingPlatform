package com.wangdi.tradingplatform.Controller;

import com.wangdi.tradingplatform.Entity.User;
import com.wangdi.tradingplatform.Service.LoginService;
import com.wangdi.tradingplatform.Service.ManageService;
import com.wangdi.tradingplatform.Tools.AlipayConfig;
import com.wangdi.tradingplatform.Tools.CommonUtils;
import com.wangdi.tradingplatform.Tools.DateUtils;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.internal.util.*;
import com.alipay.api.request.*;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/pay")
public class PayController {
    private final LoginService loginService;

    @RequestMapping("/checkout")
    @ResponseBody
    public Map<String,Object> check_out(HttpServletRequest request, double sum){
        Map<String,Object> map=new HashMap<String,Object>();
        Cookie[] cookies = request.getCookies();
        String token = null;
        for (Cookie cookie: cookies) if ("token".equals(cookie.getName())) token = cookie.getValue();
        User user = loginService.getUser(token);
        if(user.getCharge()!=0&&user.getCharge()>=sum){
            map.put("result","ok");
        }else {
            map.put("result","error");
        }
        return map;
    }
    @RequestMapping("/recharge")
    @ResponseBody
    public Map<String,Object> recharge(int userid){
        Map<String,Object> map=new HashMap<String,Object>();
        String id=CommonUtils.fillZeroBeforeString(userid+"",5);
        String WIDout_trade_no=id+ DateUtils.Date2Str(new Date(),"yyyyMMddHHmmss");
        map.put("WIDout_trade_no",WIDout_trade_no);//商户订单号
        map.put("WIDsubject","测试");//订单名称
        map.put("WIDbody","充值");//商品描述
        return map;
    }
    @RequestMapping("/return")
    public String returnUrl(HttpServletRequest request, Model model) throws Exception {
        Cookie[] cookies = request.getCookies();
        String token = null;
        for (Cookie cookie: cookies) if ("token".equals(cookie.getName())) token = cookie.getValue();
        User user = loginService.getUser(token);
        //PrintWriter out = response.getWriter();
        //获取支付宝GET过来反馈信息
        Map<String, String> params = new HashMap<String, String>();
        int userid;
        Map<String, String[]> requestParams = request.getParameterMap();
        for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext(); ) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]
                        : valueStr + values[i] + ",";
            }
            //乱码解决，这段代码在出现乱码时使用
            valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
            params.put(name, valueStr);
        }

        boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type); //调用SDK验证签名

        //——请在这里编写您的程序（以下代码仅作参考）——
        if (signVerified) {
            //商户订单号
            String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"), "UTF-8");

            //支付宝交易号
            String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"), "UTF-8");

            //付款金额
            String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"), "UTF-8");

            //out.println("trade_no:" + trade_no + "<br/>out_trade_no:" + out_trade_no + "<br/>total_amount:" + total_amount);
            userid=Integer.parseInt(out_trade_no.substring(0,5));
            double charge=Double.parseDouble(total_amount);
            return "forward:/Personal/index?userid="+userid;
        } else {
            model.addAttribute("msg","signVerified_error");
            return "failure";
            //out.println("验签失败");
        }
        //out.flush();
        //out.close();
    }
    @RequestMapping("/notify")
    public String notifyUrl(HttpServletRequest request) throws Exception {
        //PrintWriter out = response.getWriter();
        //获取支付宝GET过来反馈信息
        Map<String,String> params = new HashMap<String,String>();
        Map<String,String[]> requestParams = request.getParameterMap();
        for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]
                        : valueStr + values[i] + ",";
            }
            //乱码解决，这段代码在出现乱码时使用
            valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
            params.put(name, valueStr);
        }

        boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type); //调用SDK验证签名

        //——请在这里编写您的程序（以下代码仅作参考）——
        if(signVerified) {
            //商户订单号
            String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");

            //支付宝交易号
            String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");

            //付款金额
            String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"),"UTF-8");

            //out.println("trade_no:"+trade_no+"<br/>out_trade_no:"+out_trade_no+"<br/>total_amount:"+total_amount);
        }else {
            //out.println("验签失败");
        }
        //out.flush();
        //out.close();
        return "personal";
    }
    @RequestMapping("/page_pay")//付款
    public void pagePay(HttpServletRequest request, HttpServletResponse response)throws Exception{
        //获得初始化的AlipayClient
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);

        //设置请求参数
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        alipayRequest.setReturnUrl(AlipayConfig.return_url);
        alipayRequest.setNotifyUrl(AlipayConfig.notify_url);

        //商户订单号，商户网站订单系统中唯一订单号，必填
        String out_trade_no = new String(request.getParameter("WIDout_trade_no").getBytes("ISO-8859-1"),"UTF-8");
        //付款金额，必填
        String total_amount = new String(request.getParameter("WIDtotal_amount").getBytes("ISO-8859-1"),"UTF-8");
        //订单名称，必填
        String subject = new String(request.getParameter("WIDsubject").getBytes("ISO-8859-1"),"UTF-8");
        //商品描述，可空
        String body = new String(request.getParameter("WIDbody").getBytes("ISO-8859-1"),"UTF-8");

        alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\","
                + "\"total_amount\":\""+ total_amount +"\","
                + "\"subject\":\""+ subject +"\","
                + "\"body\":\""+ body +"\","
                + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");

        //若想给BizContent增加其他可选请求参数，以增加自定义超时时间参数timeout_express来举例说明
        //alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\","
        //		+ "\"total_amount\":\""+ total_amount +"\","
        //		+ "\"subject\":\""+ subject +"\","
        //		+ "\"body\":\""+ body +"\","
        //		+ "\"timeout_express\":\"10m\","
        //		+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
        //请求参数可查阅【电脑网站支付的API文档-Tools.trade.page.pay-请求参数】章节

        //请求
        String result = alipayClient.pageExecute(alipayRequest).getBody();

        //输出
        response.setContentType("text/html;charset=utf-8");
        response.getWriter().print(result);
        response.getWriter().flush();
    }
    @RequestMapping("trade_quary")//交易查询
    public void quaryTrade(HttpServletRequest request, HttpServletResponse response)throws Exception{
        //获得初始化的AlipayClient
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);

        //设置请求参数
        AlipayTradeQueryRequest alipayRequest = new AlipayTradeQueryRequest();

        //商户订单号，商户网站订单系统中唯一订单号
        String out_trade_no = new String(request.getParameter("WIDTQout_trade_no").getBytes("ISO-8859-1"),"UTF-8");
        //支付宝交易号
        String trade_no = new String(request.getParameter("WIDTQtrade_no").getBytes("ISO-8859-1"),"UTF-8");
        //请二选一设置

        alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\","+"\"trade_no\":\""+ trade_no +"\"}");

        //请求
        String result = alipayClient.execute(alipayRequest).getBody();

        //输出
        response.setContentType("text/html;charset=utf-8");
        response.getWriter().print(result);
        response.getWriter().flush();
    }
    @RequestMapping("trade_refund")//退款
    public void refund(HttpServletRequest request, HttpServletResponse response)throws Exception{
        //获得初始化的AlipayClient
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);

        //设置请求参数
        AlipayTradeRefundRequest alipayRequest = new AlipayTradeRefundRequest();

        //商户订单号，商户网站订单系统中唯一订单号
        String out_trade_no = new String(request.getParameter("WIDTRout_trade_no").getBytes("ISO-8859-1"),"UTF-8");
        //支付宝交易号
        String trade_no = new String(request.getParameter("WIDTRtrade_no").getBytes("ISO-8859-1"),"UTF-8");
        //请二选一设置
        //需要退款的金额，该金额不能大于订单金额，必填
        String refund_amount = new String(request.getParameter("WIDTRrefund_amount").getBytes("ISO-8859-1"),"UTF-8");
        //退款的原因说明
        String refund_reason = new String(request.getParameter("WIDTRrefund_reason").getBytes("ISO-8859-1"),"UTF-8");
        //标识一次退款请求，同一笔交易多次退款需要保证唯一，如需部分退款，则此参数必传
        String out_request_no = new String(request.getParameter("WIDTRout_request_no").getBytes("ISO-8859-1"),"UTF-8");

        alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\","
                + "\"trade_no\":\""+ trade_no +"\","
                + "\"refund_amount\":\""+ refund_amount +"\","
                + "\"refund_reason\":\""+ refund_reason +"\","
                + "\"out_request_no\":\""+ out_request_no +"\"}");

        //请求
        String result = alipayClient.execute(alipayRequest).getBody();

        //输出
        response.setContentType("text/html;charset=utf-8");
        response.getWriter().print(result);
        response.getWriter().flush();
    }
    @RequestMapping("refund_quary")//退款查询
    public void refundQuary(HttpServletRequest request, HttpServletResponse response)throws Exception{
        //获得初始化的AlipayClient
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);

        //设置请求参数
        AlipayTradeFastpayRefundQueryRequest alipayRequest = new AlipayTradeFastpayRefundQueryRequest();

        //商户订单号，商户网站订单系统中唯一订单号
        String out_trade_no = new String(request.getParameter("WIDRQout_trade_no").getBytes("ISO-8859-1"),"UTF-8");
        //支付宝交易号
        String trade_no = new String(request.getParameter("WIDRQtrade_no").getBytes("ISO-8859-1"),"UTF-8");
        //请二选一设置
        //请求退款接口时，传入的退款请求号，如果在退款请求时未传入，则该值为创建交易时的外部交易号，必填
        String out_request_no = new String(request.getParameter("WIDRQout_request_no").getBytes("ISO-8859-1"),"UTF-8");

        alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\","
                +"\"trade_no\":\""+ trade_no +"\","
                +"\"out_request_no\":\""+ out_request_no +"\"}");

        //请求
        String result = alipayClient.execute(alipayRequest).getBody();

        //输出
        response.setContentType("text/html;charset=utf-8");
        response.getWriter().print(result);
        response.getWriter().flush();
    }
    @RequestMapping("trade_close")//交易关闭
    public void closeTrade(HttpServletRequest request, HttpServletResponse response)throws Exception{
        //获得初始化的AlipayClient
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);

        //设置请求参数
        AlipayTradeCloseRequest alipayRequest = new AlipayTradeCloseRequest();
        //商户订单号，商户网站订单系统中唯一订单号
        String out_trade_no = new String(request.getParameter("WIDTCout_trade_no").getBytes("ISO-8859-1"),"UTF-8");
        //支付宝交易号
        String trade_no = new String(request.getParameter("WIDTCtrade_no").getBytes("ISO-8859-1"),"UTF-8");
        //请二选一设置

        alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\"," +"\"trade_no\":\""+ trade_no +"\"}");

        //请求
        String result = alipayClient.execute(alipayRequest).getBody();

        //输出
        response.setContentType("text/html;charset=utf-8");
        response.getWriter().print(result);
        response.getWriter().flush();;
    }

}
