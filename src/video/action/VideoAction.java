package video.action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.interceptor.ServletRequestAware;
import video.dao.IVideoDao;
import video.dto.Author;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * Created by lsc on 2017/5/29.
 */
public class VideoAction extends ActionSupport implements ServletRequestAware{

    private HttpServletRequest request;
    private HttpSession session;
    private IVideoDao videoDao;

    public String getAuthors() throws Exception {
        List<Author> authors = (List<Author>) session.getAttribute("authors");
        videoDao = (IVideoDao) request.getAttribute("IVideoDao");
        if (authors==null){
            authors = videoDao.getAuthorList();
        }
        session.setAttribute("authors", authors);
        return SUCCESS;
    }

    public String getNewestVideos() throws Exception {
        String currPages = request.getParameter("pages");
        if (currPages==null) currPages = "1";
        int pages = 1;
        try{
            pages = Integer.parseInt(currPages);
        } catch (NumberFormatException e){
            pages = 1;
        }
        request.setAttribute("url","videos?");
        request.setAttribute("pages",pages);
        videoDao = (IVideoDao) request.getAttribute("IVideoDao");
        request.setAttribute("videos",videoDao.getNewestVideoList(pages));
        return SUCCESS;
    }

    public String getAuthorVideos() throws Exception {
        String currPages = request.getParameter("pages");
        String authorid = request.getParameter("id");
        if (currPages==null) currPages = "1";
        int pages = 1;
        try{
            pages = Integer.parseInt(currPages);
        } catch (NumberFormatException e){
            pages = 1;
        }
        request.setAttribute("url","author?id="+authorid);
        request.setAttribute("pages",pages);
        videoDao = (IVideoDao) request.getAttribute("IVideoDao");
        request.setAttribute("videos",videoDao.getAuthorVideoList(Integer.parseInt(authorid),pages));
        return SUCCESS;
    }

    public String FindVideos() throws Exception {
        String currPages = request.getParameter("pages");
        String keyword = request.getParameter("keyword");
        if (currPages==null) currPages = "1";
        int pages;
        try{
            pages = Integer.parseInt(currPages);
        } catch (NumberFormatException e){
            pages = 1;
        }
        request.setAttribute("url","search?keyword="+keyword);
        request.setAttribute("pages",pages);
        videoDao = (IVideoDao) request.getAttribute("IVideoDao");
        request.setAttribute("videos",videoDao.getVideoListByKeyword(keyword,pages));
        return SUCCESS;
    }

    public String getHeroVideos() throws Exception {
        String currPages = request.getParameter("pages");
        String hero = request.getParameter("id");
        if (currPages==null) currPages = "1";
        int pages;
        try{
            pages = Integer.parseInt(currPages);
        } catch (NumberFormatException e){
            pages = 1;
        }
        request.setAttribute("url","hero?id="+hero);
        request.setAttribute("pages",pages);
        videoDao = (IVideoDao) request.getAttribute("IVideoDao");
        request.setAttribute("videos",videoDao.getVideoListByHero(Integer.parseInt(hero),pages));
        return SUCCESS;
    }

    @Override
    public void setServletRequest(HttpServletRequest httpServletRequest) {
        request = httpServletRequest;
        session = request.getSession();
    }
}
