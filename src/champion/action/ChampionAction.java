package champion.action;

import champion.dao.IChampionDAO;
import com.opensymphony.xwork2.ActionSupport;
import net.rithms.riot.api.endpoints.static_data.dto.Champion;
import net.rithms.riot.constant.Platform;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

/**
 *
 * Created by lsc on 2017/5/17.
 */
public class ChampionAction extends ActionSupport implements ServletRequestAware, ServletResponseAware{

    private HttpServletRequest request;
    private HttpServletResponse response;
    private IChampionDAO championDAO;
    private HttpSession session;

    private Logger log = Logger.getLogger("ChampionAction");


    public String getChampions() throws Exception {

        /*int minutes = 10;
        Date d = new Date();
        String modDate = d.toGMTString();
        String expDate = null;
        expDate = (new Date(d.getTime() + minutes * 60000)).toGMTString();
        response.setHeader("Last-Modified", modDate);
        response.setHeader("Expires", expDate);
        response.setHeader("Cache-Control", "public"); //   HTTP/1.1
        response.setHeader("Pragma", "Pragma"); //   HTTP/1.0
*/

        long i = System.currentTimeMillis();

        championDAO = (IChampionDAO) request.getAttribute("IChampionDao");


        if (session.getAttribute("allChampions")==null){

            Map<String, Champion> map = championDAO.getDataChampionMap(Platform.NA);

            session.setAttribute("allChampions",championDAO.getDataChampionList(map));
            session.setAttribute("freeChampions",championDAO.getFreeToPlayDataChampionList(Platform.NA,map));

            System.out.println("session is null");
        }


        log.info("getChampions执行时间："+(System.currentTimeMillis()-i));
        return SUCCESS;
    }


    public String getChampionDetails() throws Exception {
        long i = System.currentTimeMillis();
        IChampionDAO championDAO = (IChampionDAO) request.getAttribute("IChampionDao");
        int id;
        try {
            id = Integer.valueOf(request.getParameter("id"));
        } catch (NumberFormatException e){
            log.info("getChampionDetails执行时间："+(System.currentTimeMillis()-i));
            return ERROR;
        }

        request.setAttribute("champion", championDAO.getDataChampionById(Platform.NA,id));
        log.info("getChampionDetails执行时间："+(System.currentTimeMillis()-i));
        return SUCCESS;
    }


    @Override
    public void setServletRequest(HttpServletRequest httpServletRequest) {
        request = httpServletRequest;
        session = request.getSession();
    }

    @Override
    public void setServletResponse(HttpServletResponse httpServletResponse) {
        response = httpServletResponse;
    }
}
