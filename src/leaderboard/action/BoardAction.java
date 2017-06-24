package leaderboard.action;

import com.opensymphony.xwork2.ActionSupport;
import leaderboard.dao.ILeaderboardDAO;
import net.rithms.riot.api.endpoints.league.dto.LeagueList;
import net.rithms.riot.constant.Platform;
import org.apache.struts2.interceptor.ServletRequestAware;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * Created by lsc on 2017/5/29.
 */
public class BoardAction extends ActionSupport implements ServletRequestAware{

    private HttpServletRequest request;
    private HttpSession session;

    public String getChallengerBoard() throws Exception {
        String platform = request.getParameter("region");
        if (platform==null) platform = "NA1";
        Platform p = Platform.getPlatformById(platform);
        if (p==null) p = Platform.NA;
        ILeaderboardDAO leaderboardDAO = (ILeaderboardDAO) request.getAttribute("ILeaderboardDao");
        LeagueList list = leaderboardDAO.getChallengerLeagueList(p,"RANKED_SOLO_5x5");
        request.setAttribute("region",p.getId());
        request.setAttribute("boardLeague", list);
        return SUCCESS;
    }

    public String getMasterBoard() throws Exception {
        String platform = request.getParameter("region");
        if (platform==null) platform = "NA1";
        Platform p = Platform.getPlatformById(platform);
        if (p==null) p = Platform.NA;
        ILeaderboardDAO leaderboardDAO = (ILeaderboardDAO) request.getAttribute("ILeaderboardDao");
        LeagueList list = leaderboardDAO.getMasterLeagueList(p,"RANKED_SOLO_5x5");
        request.setAttribute("region",p.getId());
        request.setAttribute("boardLeague", list);
        return SUCCESS;
    }

    @Override
    public void setServletRequest(HttpServletRequest httpServletRequest) {
        request = httpServletRequest;
        session = request.getSession();
    }
}
