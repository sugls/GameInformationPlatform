package community.action;

import com.opensymphony.xwork2.ActionSupport;
import community.dao.ICommunityDao;
import community.dto.Member;
import org.apache.struts2.interceptor.ServletRequestAware;

import javax.servlet.http.HttpServletRequest;

/**
 *
 * Created by lsc on 2017/5/31.
 */
public class UserAction extends ActionSupport implements ServletRequestAware{

    private HttpServletRequest request;
    private ICommunityDao communityDao;


    public String UserCenter() throws Exception {
        communityDao = (ICommunityDao) request.getAttribute("ICommunityDao");

        String id = request.getParameter("id");

        Integer userid = Integer.valueOf(id);

        Member member = communityDao.getMemberById(userid);


        request.setAttribute("member", member);

        return SUCCESS;
    }


    @Override
    public void setServletRequest(HttpServletRequest httpServletRequest) {
        request = httpServletRequest;
    }
}
