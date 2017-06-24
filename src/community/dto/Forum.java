package community.dto;

import java.io.Serializable;

/**
 *
 * Created by lsc on 2017/5/22.
 */
public class Forum implements Serializable{

    private Integer fid;
    private String name;
    private String desc;
    private String icon;
    private Integer threads;
    private Integer posts;


    @Override
    public String toString() {
        return "Forum{" +
                "fid=" + fid +
                ", name='" + name + '\'' +
                ", desc='" + desc + '\'' +
                ", icon='" + icon + '\'' +
                ", threads=" + threads +
                ", posts=" + posts +
                '}';
    }

    public Integer getFid() {
        return fid;
    }

    public void setFid(Integer fid) {
        this.fid = fid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public Integer getThreads() {
        return threads;
    }

    public void setThreads(Integer threads) {
        this.threads = threads;
    }

    public Integer getPosts() {
        return posts;
    }

    public void setPosts(Integer posts) {
        this.posts = posts;
    }
}
