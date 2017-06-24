package community.action;

import com.google.gson.JsonObject;
import com.opensymphony.xwork2.ActionSupport;
import community.dao.ICommunityDao;
import community.dto.Userinfo;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.json.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * Created by lsc on 2017/5/22.
 */
public class LoginAction extends ActionSupport implements ServletRequestAware {

    private HttpServletRequest request;
    private HttpSession session;
    private ICommunityDao communityDao;
    private String result;

    private File icon;
    private String uploadContentType;
    private String uploadFileName;
    private String savePath;

    public File getIcon() {
        return icon;
    }

    public void setIcon(File icon) {
        this.icon = icon;
    }

    public String getUploadContentType() {
        return uploadContentType;
    }

    public void setUploadContentType(String uploadContentType) {
        this.uploadContentType = uploadContentType;
    }

    public String getUploadFileName() {
        return uploadFileName;
    }

    public void setUploadFileName(String uploadFileName) {
        this.uploadFileName = uploadFileName;
    }

    public String getSavePath() {
        return savePath;
    }

    public void setSavePath(String savePath) {
        this.savePath = savePath;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public String checkLogin() throws Exception {
        String username = request.getParameter("username");
        String userpwd = request.getParameter("password");
        Userinfo user = new Userinfo(username, userpwd);
        System.out.println(user);
        communityDao = (ICommunityDao) request.getAttribute("ICommunityDao");
        Userinfo u = communityDao.checkLogin(user);
        Map<String, String> map = new HashMap<>();
        if (u != null) {
            session.setAttribute("user", u);
            map.put("message", "登录成功！");
        } else {
            map.put("message", "用户名或密码错误！");
        }
        JSONObject jsonData = new JSONObject(map);
        System.out.println(jsonData);
        result = jsonData.toString();

        return SUCCESS;
    }

    public String logout() throws Exception {
        session.removeAttribute("user");
        result = "ok";
        return SUCCESS;
    }

    public String checkUsername() throws Exception {
        communityDao = (ICommunityDao) request.getAttribute("ICommunityDao");
        String username = request.getParameter("username");
        boolean u = communityDao.isAvailableUsername(username);
       /* Map m = new HashMap();
        m.put("valid",u);*/
        JsonObject object = new JsonObject();
        object.addProperty("valid", u);
        result = object.toString();
        System.out.println(result);
        return SUCCESS;
    }

    public String register() throws Exception {
        communityDao = (ICommunityDao) request.getAttribute("ICommunityDao");
        String username = request.getParameter("username");
        String userpwd = request.getParameter("userpwd");
        String email = request.getParameter("email");
        boolean r = communityDao.registerUser(new Userinfo(username, userpwd, email));
        Map m = new HashMap();
        m.put("message", r);
        result = JSONObject.valueToString(m);
        return SUCCESS;
    }

    public String updateUserIcon() throws Exception {
        communityDao = (ICommunityDao) request.getAttribute("ICommunityDao");
        String userid = request.getParameter("userid");
        FileOutputStream fos = null;
        FileInputStream fis = null;
        try {
            savePath = "images/profile/face";
            uploadFileName = userid + ".jpg";

            String newFileName = session.getServletContext().getRealPath("/") + savePath + "\\" + uploadFileName;
            System.out.println(getUploadContentType());
            System.out.println(newFileName);

            fos = new FileOutputStream(newFileName);

            fis = new FileInputStream(getIcon());
            byte[] buffer = new byte[1024];
            int len = 0;
            while ((len = fis.read(buffer)) > 0) {
                fos.write(buffer, 0, len);
            }
            Userinfo u = new Userinfo();
            u.setUserid(Integer.parseInt(userid));
            u.setIcon(uploadFileName);
            Userinfo userinfo = communityDao.updateUserInfo(u);
            session.setAttribute("user", userinfo);

            request.setAttribute("info","头像修改成功！若头像显示没有变化，请刷新页面。");
        } catch (IOException e) {
            e.printStackTrace();
            request.setAttribute("info","头像修改失败！请稍后再试。");
        } finally {
            if (fos != null) {
                fos.close();
            }
            if (fis != null) {
                fis.close();
            }
        }
        return SUCCESS;
    }

    public String updateUserInfo() throws Exception {
        communityDao = (ICommunityDao) request.getAttribute("ICommunityDao");
        String userpwd = request.getParameter("userpwd");
        String email = request.getParameter("email");
        String userid = request.getParameter("userid");

        Userinfo u = new Userinfo();
        u.setUserid(Integer.parseInt(userid));
        if (userpwd!=null&&!"".equals(userpwd))u.setUserpwd(userpwd);
        if (email!=null&&!"".equals(email))u.setEmail(email);
        Userinfo user = communityDao.updateUserInfo(u);
        if (user!=null){
            session.setAttribute("user",user);
            request.setAttribute("info","资料修改成功！");

        } else {
            request.setAttribute("info","资料修改失败！请稍后再试。");
        }
        return SUCCESS;
    }


    @Override
    public void setServletRequest(HttpServletRequest httpServletRequest) {
        request = httpServletRequest;
        session = request.getSession();
    }
}
