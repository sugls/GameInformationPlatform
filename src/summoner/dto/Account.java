package summoner.dto;

import java.io.Serializable;

/**
 *
 * Created by lsc on 2017/5/31.
 */
public class Account implements Serializable{

    private Integer id;
    private Integer userid;
    private long summonerid;
    private String platform;

    public Account() {
    }

    public Account(Integer userid, long summonerid, String platform) {
        this.userid = userid;
        this.summonerid = summonerid;
        this.platform = platform;
    }

    @Override
    public String toString() {
        return "Account{" +
                "id=" + id +
                ", userid=" + userid +
                ", summonerid=" + summonerid +
                ", platform='" + platform + '\'' +
                '}';
    }

    public Integer getId() {

        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public long getSummonerid() {
        return summonerid;
    }

    public void setSummonerid(long summonerid) {
        this.summonerid = summonerid;
    }

    public String getPlatform() {
        return platform;
    }

    public void setPlatform(String platform) {
        this.platform = platform;
    }
}
