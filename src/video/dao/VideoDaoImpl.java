package video.dao;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;
import util.DaiWanApi;
import util.NullStringToEmptyAdapterFactory;
import video.dto.Author;
import video.dto.Video;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Type;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 *
 * Created by lsc on 2017/5/29.
 */
public class VideoDaoImpl implements IVideoDao{

    class VideoData{
        Integer code;
        String msg;
        List<Video> data;

        public Integer getCode() {
            return code;
        }

        public void setCode(Integer code) {
            this.code = code;
        }

        public String getMsg() {
            return msg;
        }

        public void setMsg(String msg) {
            this.msg = msg;
        }

        public List<Video> getData() {
            return data;
        }

        public void setData(List<Video> data) {
            this.data = data;
        }
    }
    class AuthorData{
        Integer code;
        String msg;
        List<Author> data;

        public Integer getCode() {
            return code;
        }

        public void setCode(Integer code) {
            this.code = code;
        }

        public String getMsg() {
            return msg;
        }

        public void setMsg(String msg) {
            this.msg = msg;
        }

        public List<Author> getData() {
            return data;
        }

        public void setData(List<Author> data) {
            this.data = data;
        }
    }

    @Override
    public List<Video> getNewestVideoList(int pages) {
        String url = "http://infoapi.games-cube.com/GetNewstVideos?p="+pages;
        String data =  DaiWanApi.HttpClientMethod(url);

        Gson gson = new GsonBuilder()
                .registerTypeAdapterFactory(new NullStringToEmptyAdapterFactory())
                .create();
        java.lang.reflect.Type type = new TypeToken<VideoData>() {}.getType();
        VideoData videoData = gson.fromJson(data, type);

        return videoData.getData();
    }

    @Override
    public List<Author> getAuthorList() {
        String url = "http://infoapi.games-cube.com/GetAuthors";
        String data =  DaiWanApi.HttpClientMethod(url);

        Gson gson = new GsonBuilder()
                .registerTypeAdapterFactory(new NullStringToEmptyAdapterFactory())
                .create();
        java.lang.reflect.Type type = new TypeToken<AuthorData>() {}.getType();
        AuthorData authorData = gson.fromJson(data, type);

        return authorData.getData();
    }

    @Override
    public List<Video> getAuthorVideoList(int authorid, int pages) {
        String url = "http://infoapi.games-cube.com/GetAuthorVideos?author="+authorid+"&p="+pages;
        String data =  DaiWanApi.HttpClientMethod(url);

        Gson gson = new GsonBuilder()
                .registerTypeAdapterFactory(new NullStringToEmptyAdapterFactory())
                .create();
        java.lang.reflect.Type type = new TypeToken<VideoData>() {}.getType();
        VideoData videoData = gson.fromJson(data, type);

        return videoData.getData();
    }

    @Override
    public List<Video> getVideoListByKeyword(String keyword, int pages) {

        String encodeKeyword = null;
        try {
            encodeKeyword = URLEncoder.encode(keyword, "utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        String url = "http://infoapi.games-cube.com/FindVideos?keyword=" + encodeKeyword + "&p=" + pages;
        String data = DaiWanApi.HttpClientMethod(url);

        Gson gson = new GsonBuilder()
                .registerTypeAdapterFactory(new NullStringToEmptyAdapterFactory())
                .create();
        java.lang.reflect.Type type = new TypeToken<VideoData>() {
        }.getType();
        VideoData videoData = gson.fromJson(data, type);

        return videoData.getData();
    }

    @Override
    public List<Video> getVideoListByHero(int hero, int pages) {
        String url = "http://infoapi.games-cube.com/GetHeroVideos?hero="+hero+"+&p="+pages;
        String data = DaiWanApi.HttpClientMethod(url);

        Gson gson = new GsonBuilder()
                .registerTypeAdapterFactory(new NullStringToEmptyAdapterFactory())
                .create();
        java.lang.reflect.Type type = new TypeToken<VideoData>() {
        }.getType();
        VideoData videoData = gson.fromJson(data, type);

        return videoData.getData();
    }
}
