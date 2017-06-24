package util;

import net.rithms.riot.api.ApiConfig;
import net.rithms.riot.api.RiotApi;
import net.rithms.riot.api.RiotApiAsync;

/**
 * 获取 RiotApi 和 RiotApiAsync 实例
 * Created by lsc on 2017/5/10.
 */
public class RiotApiConfig {

    private static final String API_KEY = "*****-*****-*****";
    private static ThreadLocal<RiotApi> t1 = new ThreadLocal<>();

    private static ThreadLocal<RiotApiAsync> t2 = new ThreadLocal<>();

    private static ApiConfig config = new ApiConfig();

    public static RiotApi getRiotApi(){
        RiotApi api = t1.get();
        if (api == null){
            config.setKey(API_KEY);
            api = new RiotApi(config);
            t1.set(api);
        }
        return api;
    }

    public static RiotApiAsync getRiotApiAsync(){
        RiotApi api = getRiotApi();
        RiotApiAsync apiAsync = t2.get();
        if (apiAsync == null){
            apiAsync = api.getAsyncApi();
            t2.set(apiAsync);
        }
        return apiAsync;
    }

}
