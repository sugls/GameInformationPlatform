package community.dto;

import util.ForumUtil;

import java.io.Serializable;

/**
 *
 * Created by lsc on 2017/5/24.
 */
public class Member implements Serializable{

    private Integer userid;
    private String username;
    private Integer posts;
    private Integer replies;
    private Integer actives;

    private String rank;
    private String rankTitle;

    private String icon;

    public Member() {
    }

    public Member(Integer userid, String username) {
        this.userid = userid;
        this.username = username;
    }

    @Override
    public String toString() {
        return "Member{" +
                "userid=" + userid +
                ", username='" + username + '\'' +
                ", posts=" + posts +
                ", replies=" + replies +
                ", actives=" + actives +
                ", icon='" + icon + '\'' +
                '}';
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

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Integer getPosts() {
        return posts;
    }

    public void setPosts(Integer posts) {
        this.posts = posts;
    }

    public Integer getReplies() {
        return replies;
    }

    public void setReplies(Integer replies) {
        this.replies = replies;
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

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }
}
