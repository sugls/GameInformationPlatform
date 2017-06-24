package community.action;

import com.opensymphony.xwork2.ActionSupport;
import community.dao.ICommunityDao;
import community.dto.Forum;
import community.dto.Member;
import community.dto.Thread;
import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.json.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * Created by lsc on 2017/5/22.
 */
public class ForumAction extends ActionSupport implements ServletRequestAware{
    private HttpServletRequest request;
    private HttpSession session;
    private ICommunityDao communityDao;

    private static final int THREAD_PAGE_SIZE = 10;

    private String result;


    private Logger log = Logger.getLogger(ForumAction.class);

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }


    public String Forum() throws Exception {
        communityDao = (ICommunityDao) request.getAttribute("ICommunityDao");

        List<Forum> forums = (List<Forum>) session.getAttribute("forums");

        List<Member> topActivesMember = (List<Member>) session.getAttribute("rankMember");
        if (forums==null){
           forums = communityDao.getForum();
           session.setAttribute("forums",forums);
        }

        if (topActivesMember==null){
            topActivesMember = communityDao.getTopActivesMember(8);
            session.setAttribute("rankMember", topActivesMember);
        }

        return SUCCESS;
    }


    public String getThreads() throws Exception {

        communityDao = (ICommunityDao) request.getAttribute("ICommunityDao");

        String type = request.getParameter("type");
        int pages = Integer.parseInt(request.getParameter("pages"));
        List<Thread> list = new ArrayList<>();
        if ("hot".equals(type)){
            list = communityDao.getHotThreads(pages,THREAD_PAGE_SIZE);
        } else if ("newest".equals(type)){
            list = communityDao.getNewestThreads(pages,THREAD_PAGE_SIZE);
        }

        /*JSONObject jsonObject = new JSONObject(list);
        result = jsonObject.toString();

        log.info("jsonString: " + result);*/
        request.setAttribute("threadList",list);

        return SUCCESS;

    }

    public String dispatchForum() throws Exception {
        communityDao = (ICommunityDao) request.getAttribute("ICommunityDao");
        int fid = Integer.parseInt(request.getParameter("fid"));
        request.setAttribute("forum",communityDao.getForumById(fid));
        return SUCCESS;
    }

    public String getThreadsByFid() throws Exception {
        communityDao = (ICommunityDao) request.getAttribute("ICommunityDao");

        String type = request.getParameter("type");
        Integer fid = Integer.valueOf(request.getParameter("fid"));
        int pages = Integer.parseInt(request.getParameter("pages"));
        List<Thread> list = new ArrayList<>();
        if ("hot".equals(type)){
            list = communityDao.getHotThreadsByFid(fid,pages,THREAD_PAGE_SIZE);
        } else if ("newest".equals(type)){
            list = communityDao.getNewestThreadsByFid(fid,pages,THREAD_PAGE_SIZE);
        }
        request.setAttribute("threadList",list);
        return SUCCESS;
    }

    @Override
    public void setServletRequest(HttpServletRequest httpServletRequest) {
        request = httpServletRequest;
        session = request.getSession();
    }
}
