package community.dto;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 *
 * Created by lsc on 2017/5/24.
 */
public class Reply implements Serializable {

    private Integer rid;
    private Integer pid;
    private Integer authorid;
    private String author;
    private Integer toid;
    private String touser;
    private String message;
    private Timestamp dateline;
    private String userip;


    @Override
    public String toString() {
        return "Reply{" +
                "rid=" + rid +
                ", pid=" + pid +
                ", authorid=" + authorid +
                ", author='" + author + '\'' +
                ", toid=" + toid +
                ", touser='" + touser + '\'' +
                ", message='" + message + '\'' +
                ", dateline=" + dateline +
                ", userip='" + userip + '\'' +
                '}';
    }


    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Integer getRid() {
        return rid;
    }

    public void setRid(Integer rid) {
        this.rid = rid;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getAuthorid() {
        return authorid;
    }

    public void setAuthorid(Integer authorid) {
        this.authorid = authorid;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Integer getToid() {
        return toid;
    }

    public void setToid(Integer toid) {
        this.toid = toid;
    }

    public String getTouser() {
        return touser;
    }

    public void setTouser(String touser) {
        this.touser = touser;
    }

    public Timestamp getDateline() {
        return dateline;
    }

    public void setDateline(Timestamp dateline) {
        this.dateline = dateline;
    }

    public String getUserip() {
        return userip;
    }

    public void setUserip(String userip) {
        this.userip = userip;
    }
}
