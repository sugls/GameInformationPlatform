package community.dto;

import java.io.Serializable;

/**
 *
 * Created by lsc on 2017/5/22.
 */
public class Userinfo implements Serializable{
    private int userid;
    private String username;
    private String userpwd;
    private String email;
    private String icon;

    public Userinfo() {
    }

    public Userinfo(String username, String userpwd) {
        this.username = username;
        this.userpwd = userpwd;
    }

    public Userinfo(String username, String userpwd, String email) {
        this.username = username;
        this.userpwd = userpwd;
        this.email = email;
    }

    @Override
    public String toString() {
        return "Userinfo{" +
                "userid=" + userid +
                ", username='" + username + '\'' +
                ", userpwd='" + userpwd + '\'' +
                ", email='" + email + '\'' +
                ", icon='" + icon + '\'' +
                '}';
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUserpwd() {
        return userpwd;
    }

    public void setUserpwd(String userpwd) {
        this.userpwd = userpwd;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }
}
