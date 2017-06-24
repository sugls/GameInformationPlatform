package util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.apache.commons.httpclient.DefaultHttpMethodRetryHandler;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.params.HttpMethodParams;

/**
 *
 * Created by lsc on 2017/5/29.
 */
public class DaiWanApi {

    private static final String DAIWAN_API_TOKEN = "****-*****-***";

    public static String HttpClientMethod(String url) {
        //定义httpClient的实例
        HttpClient httpClient = new HttpClient();
        //创建get方法的实例
        GetMethod getMethod = new GetMethod(url);
        //使用系统提供的默认恢复策略
        getMethod.getParams().setParameter(HttpMethodParams.RETRY_HANDLER, new DefaultHttpMethodRetryHandler());
        getMethod.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        getMethod.setRequestHeader("DAIWAN-API-TOKEN", DAIWAN_API_TOKEN);//带玩token码
        StringBuilder result = new StringBuilder("");
        BufferedReader reader = null;
        try {
            httpClient.executeMethod(getMethod);
            reader = new BufferedReader(new InputStreamReader(getMethod.getResponseBodyAsStream(), "utf-8"));
            String line;
            while ((line = reader.readLine()) != null) result.append(line);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            getMethod.releaseConnection();
            try {
                if (reader != null) reader.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return result.toString();
    }
}
