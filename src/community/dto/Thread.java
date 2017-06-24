package community.dto;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 *
 * Created by lsc on 2017/5/22.
 */
public class Thread implements Serializable{

    private Integer tid;
    private Integer fid;
    private String author;
    private Integer authorid;
    private String subject;
    private Timestamp dateline;
    private Integer views;
    private Integer replies;

    private String fname;

    public Thread() {
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    @Override
    public String toString() {
        return "Thread{" +
                "tid=" + tid +
                ", fid=" + fid +
                ", author='" + author + '\'' +
                ", authorid=" + authorid +
                ", subject='" + subject + '\'' +
                ", dateline=" + dateline +
                ", views=" + views +
                ", replies=" + replies +
                ", fname=" + fname +
                '}';
    }

    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }

    public Integer getFid() {
        return fid;
    }

    public void setFid(Integer fid) {
        this.fid = fid;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Integer getAuthorid() {
        return authorid;
    }

    public void setAuthorid(Integer authorid) {
        this.authorid = authorid;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public Timestamp getDateline() {
        return dateline;
    }

    public void setDateline(Timestamp dateline) {
        this.dateline = dateline;
    }

    public Integer getViews() {
        return views;
    }

    public void setViews(Integer views) {
        this.views = views;
    }

    public Integer getReplies() {
        return replies;
    }

    public void setReplies(Integer replies) {
        this.replies = replies;
    }
}
