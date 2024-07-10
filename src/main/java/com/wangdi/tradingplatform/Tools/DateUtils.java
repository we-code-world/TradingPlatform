package com.wangdi.tradingplatform.Tools;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {
    /**
     * 把日期字符串转为java.util.Date类型
     */
    public static Date str2Date(String dateStr, String parttern) {
        SimpleDateFormat sdf = new SimpleDateFormat(parttern);
        Date date = null;
        try {
            sdf.parse(dateStr);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return date;

    }

    /**
     * 把java.util.Date类型转为日期字符串
     */
    public static String Date2Str(Date date, String parttern) {
        SimpleDateFormat sdf=new SimpleDateFormat(parttern);
        String dateStr =null;
        try {
            dateStr = sdf.format(date);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dateStr;
    }
}
