package video.dto;

import java.io.Serializable;

/**
 *
 * Created by lsc on 2017/5/29.
 */
public class Author implements Serializable {
    private String id;
    private String name;
    private String img;
    private String isex;
    private String ivideo;
    private String desc;
    private String usernum;
    private String videonum;
    private String count;
    private String type;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getIsex() {
        return isex;
    }

    public void setIsex(String isex) {
        this.isex = isex;
    }

    public String getIvideo() {
        return ivideo;
    }

    public void setIvideo(String ivideo) {
        this.ivideo = ivideo;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getUsernum() {
        return usernum;
    }

    public void setUsernum(String usernum) {
        this.usernum = usernum;
    }

    public String getVideonum() {
        return videonum;
    }

    public void setVideonum(String videonum) {
        this.videonum = videonum;
    }

    public String getCount() {
        return count;
    }

    public void setCount(String count) {
        this.count = count;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return "Author{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", img='" + img + '\'' +
                ", isex='" + isex + '\'' +
                ", ivideo='" + ivideo + '\'' +
                ", desc='" + desc + '\'' +
                ", usernum='" + usernum + '\'' +
                ", videonum='" + videonum + '\'' +
                ", count='" + count + '\'' +
                ", type='" + type + '\'' +
                '}';
    }
}
