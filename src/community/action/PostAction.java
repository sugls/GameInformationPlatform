package community.action;

import com.opensymphony.xwork2.ActionSupport;
import community.dao.ICommunityDao;
import community.dto.Member;
import community.dto.Post;
import community.dto.Thread;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.json.JSONObject;
import util.ForumUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * Created by lsc on 2017/5/23.
 */
public class PostAction extends ActionSupport implements ServletRequestAware{

    private HttpServletRequest request;
    private HttpSession session;
    private ICommunityDao communityDao;
    private String result;
    private static final int POST_PAGE_SIZE = 10;
    private static final int REPLY_PAGE_SIZE = 5;

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }


    public String dispatchThread() throws Exception {
        communityDao = (ICommunityDao) request.getAttribute("ICommunityDao");
        int tid = Integer.parseInt(request.getParameter("tid"));
        int uid = Integer.parseInt(request.getParameter("uid"));
        int fid = Integer.parseInt(request.getParameter("fid"));
        communityDao.updateThreadViews(tid); // 阅读数加一
        Integer i = communityDao.getPostsTotalRecordsByTid(tid);
        request.setAttribute("thread",communityDao.getThreadById(tid));
        request.setAttribute("forum",communityDao.getForumById(fid));
        request.setAttribute("poster",communityDao.getMemberById(uid));
        request.setAttribute("tid",tid);
        request.setAttribute("totalPosts",i);
        request.setAttribute("totalPages",communityDao.getPostsTotalPagesByTid(i,POST_PAGE_SIZE));
        return SUCCESS;
    }

    public String getThreadPosts() throws Exception {
        communityDao = (ICommunityDao) request.getAttribute("ICommunityDao");
        int pages = Integer.parseInt(request.getParameter("pages"));
        int tid = Integer.parseInt(request.getParameter("tid"));

        if (pages==1){
             request.setAttribute("tpost",communityDao.getThreadPostByTid(tid));
        }

        request.setAttribute("posts",communityDao.getPostsRepliesByTid(tid,pages,POST_PAGE_SIZE,REPLY_PAGE_SIZE));

        return SUCCESS;
    }


    public String getMemberInfo() throws Exception {
        communityDao = (ICommunityDao) request.getAttribute("ICommunityDao");
        Integer id = Integer.valueOf(request.getParameter("id"));
        Member member = communityDao.getMemberById(id);
        result = new JSONObject(member).toString();
        System.out.println(result);
        return SUCCESS;
    }

    public String putAPost() throws Exception {
        communityDao = (ICommunityDao) request.getAttribute("ICommunityDao");

        session.removeAttribute("rankMember");

        String type = request.getParameter("type");

        //insert into post(fid,tid,author,authorid,dateline,message,userip,isFirst)
        //values(1,2,'kakaxi',2,current_timestamp(),'reply test1','192.168.0.1',false);
        Integer fid = Integer.valueOf(request.getParameter("fid"));
        Integer authorid = Integer.valueOf(request.getParameter("authorid"));
        String author = request.getParameter("author");
        String message = request.getParameter("message");
        String userip = ForumUtil.getUserIpAddr(request);
        boolean first;
        first = !"reply".equals(type);

        boolean res;
        if ("reply".equals(type)){
            Integer tid = Integer.valueOf(request.getParameter("tid"));
            Post post = new Post(fid,tid,author,authorid,message,userip,first);
            res = communityDao.replyAThread(post);
        } else {
            String subject = request.getParameter("subject");
            Post post = new Post(fid,author,authorid,message,userip,first);
            Thread thread = new Thread();
            // fid,author,authorid,`subject`,dateline
            thread.setFid(fid);
            thread.setAuthor(author);
            thread.setAuthorid(authorid);
            thread.setSubject(subject);
            res = communityDao.postAThread(thread, post);
        }

        result = new JSONObject(res).toString();
        return SUCCESS;
    }



    @Override
    public void setServletRequest(HttpServletRequest httpServletRequest) {
        request = httpServletRequest;
        session = request.getSession();
    }
}
