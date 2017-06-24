package community.dto;

import util.ForumUtil;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 * 帖子
 * Created by lsc on 2017/5/23.
 */
public class Post implements Serializable {
    private Integer pid;
    private Integer fid;
    private Integer tid;
    private String author;
    private Integer authorid;
    private Timestamp dateline;
    private String message;
    private String userip;
    private boolean first;

    private List<Reply> replies;
    private Integer replyNum;
    private Integer actives;

    private String rank;
    private String rankTitle;


    public Post() {
    }

    public Post(Integer fid, Integer tid, String author, Integer authorid, String message, String userip, boolean first) {
        this.fid = fid;
        this.tid = tid;
        this.author = author;
        this.authorid = authorid;
        this.message = message;
        this.userip = userip;
        this.first = first;
    }

    public Post(Integer fid, String author, Integer authorid, String message, String userip, boolean first) {
        this.fid = fid;
        this.author = author;
        this.authorid = authorid;
        this.message = message;
        this.userip = userip;
        this.first = first;
    }

    public String getRank() {
        return rank;
    }

    public void setRank(String rank) {
        this.rank = rank;
    }

    public String getRankTitle() {
        return rankTitle;
    }

    public void setRankTitle(String rankTitle) {
        this.rankTitle = rankTitle;
    }

    public Integer getReplyNum() {
        return replyNum;
    }

    public void setReplyNum(Integer replyNum) {
        this.replyNum = replyNum;
    }

    public Integer getActives() {
        return actives;
    }

    public void setActives(Integer actives) {
        this.actives = actives;
        String[] rankTitle = ForumUtil.switchRankTitle(actives);
        setRank(rankTitle[0]);
        setRankTitle(rankTitle[1]);
    }

    public boolean isFirst() {
        return first;
    }

    public void setFirst(boolean first) {
        this.first = first;
    }

    @Override
    public String toString() {
        return "Post{" +
                "pid=" + pid +
                ", fid=" + fid +
                ", tid=" + tid +
                ", author='" + author + '\'' +
                ", authorid=" + authorid +
                ", dateline=" + dateline +
                ", message='" + message + '\'' +
                ", userip='" + userip + '\'' +
                ", actives='" + actives + '\'' +
                '}';
    }

    public List<Reply> getReplies() {
        return replies;
    }

    public void setReplies(List<Reply> replies) {
        this.replies = replies;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getFid() {
        return fid;
    }

    public void setFid(Integer fid) {
        this.fid = fid;
    }

    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
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

    public Timestamp getDateline() {
        return dateline;
    }

    public void setDateline(Timestamp dateline) {
        this.dateline = dateline;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getUserip() {
        return userip;
    }

    public void setUserip(String userip) {
        this.userip = userip;
    }

}
