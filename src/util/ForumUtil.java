package util;

import javax.servlet.http.HttpServletRequest;

/**
 *
 * Created by lsc on 2017/5/25.
 */
public class ForumUtil {

    public static String[] switchRankTitle(int actives){
        // 武林新丁 ->   10
        // 江湖小虾 ->   60
        // 后起之秀 ->  110
        // 武林高手 ->  160
        // 风尘奇侠 ->  210
        // 无双隐士 ->  260
        // 世外高人 ->  310
        // 江湖侠隐 ->  360
        // 无敌圣者 ->  410
        // 三界贤君 ->  460
        String[] rankTitle = new String[2];
        switch ((int)Math.ceil((actives - 10) / 50.0) + 1) {
            case 1 :
                rankTitle[0] = "1";
                rankTitle[1] = "武林新丁";
                break;
            case 2 :
                rankTitle[0] = "2";
                rankTitle[1] = "江湖小虾";
                break;
            case 3 :
                rankTitle[0] = "3";
                rankTitle[1] = "后起之秀";
                break;
            case 4 :
                rankTitle[0] = "4";
                rankTitle[1] = "武林高手";
                break;
            case 5 :
                rankTitle[0] = "5";
                rankTitle[1] = "风尘奇侠";
                break;
            case 6 :
                rankTitle[0] = "6";
                rankTitle[1] = "无双隐士";
                break;
            case 7 :
                rankTitle[0] = "7";
                rankTitle[1] = "世外高人";
                break;
            case 8 :
                rankTitle[0] = "8";
                rankTitle[1] = "江湖侠隐";
                break;
            case 9 :
                rankTitle[0] = "9";
                rankTitle[1] = "无敌圣者";
                break;
            case 10 :
                rankTitle[0] = "10";
                rankTitle[1] = "三界贤君";
                break;
        }
        return rankTitle;
    }


    public static String getUserIpAddr(HttpServletRequest request){
        String ip = request.getHeader("x-forwarded-for");
        if (ip==null||ip.length()==0||"unknown".equalsIgnoreCase(ip)){
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip==null||ip.length()==0||"unknown".equalsIgnoreCase(ip)){
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip==null||ip.length()==0||"unknown".equalsIgnoreCase(ip)){
            ip = request.getRemoteAddr();
        }
        return ip;
    }
}
