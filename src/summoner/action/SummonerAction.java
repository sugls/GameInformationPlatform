package summoner.action;

import com.opensymphony.xwork2.ActionSupport;
import community.dto.Userinfo;
import net.rithms.riot.api.RiotApiException;
import net.rithms.riot.constant.Platform;
import org.apache.struts2.interceptor.ServletRequestAware;
import summoner.dao.ISummonerLeagueDAO;
import summoner.dto.Account;
import summoner.dto.Matches;
import summoner.dto.SummonerLeague;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * Created by lsc on 2017/5/16.
 */
public class SummonerAction extends ActionSupport implements ServletRequestAware{

    private HttpServletRequest request;
    private HttpSession session;

    private ISummonerLeagueDAO leagueDAO;

    public String SearchSummoner() throws Exception {
        String platformId = request.getParameter("region");
        String summonerName = request.getParameter("summoner");
        System.out.println(platformId);
        System.out.println(summonerName);
        if (platformId!=null&&summonerName!=null){
            Platform platform = Platform.getPlatformById(platformId);
            leagueDAO = (ISummonerLeagueDAO) request.getAttribute("ISummonerDao");

            List<SummonerLeague> list = leagueDAO.searchSummonerByPlatform(platform, summonerName);
            request.setAttribute("type","search");
            request.setAttribute("summonerList", list);
        }
        return SUCCESS;
    }

    public String SummonerProfile() throws Exception {
        long summonerId = Long.valueOf(request.getParameter("summonerId"));
        Platform platform = Platform.getPlatformById(request.getParameter("region"));

        ISummonerLeagueDAO leagueDAO = (ISummonerLeagueDAO) request.getAttribute("ISummonerDao");
        SummonerLeague eSummoner = null;
        List<Matches> matchList = null;
        int page = 1;
        int pageSize = 5;
        try {

            eSummoner = leagueDAO.getSummonerLeagueBySummonerId(platform, summonerId);
            matchList = leagueDAO.getRecentMatchList(platform, summonerId, page, pageSize);


        } catch (RiotApiException e) {
            e.printStackTrace();
        }

        request.setAttribute("sl", eSummoner);
        request.setAttribute("matchList", matchList);

        return SUCCESS;
    }

    public String MyAccount() throws Exception {
        ISummonerLeagueDAO leagueDAO = (ISummonerLeagueDAO) request.getAttribute("ISummonerDao");

        Userinfo userinfo = (Userinfo)session.getAttribute("user");
        int userid = userinfo.getUserid();

        request.setAttribute("summoners",leagueDAO.getAccountSummonersById(userid));
        return SUCCESS;
    }

    public String addAccount() throws Exception {
        ISummonerLeagueDAO leagueDAO = (ISummonerLeagueDAO) request.getAttribute("ISummonerDao");
        String userid = request.getParameter("userid");
        String summonerid = request.getParameter("summonerid");
        String platform = request.getParameter("platform");
        Account account = new Account(Integer.valueOf(userid),Long.valueOf(summonerid),platform);
        boolean result = leagueDAO.insertAccount(account);
        if (result){
            request.setAttribute("info","绑定成功！");
            return SUCCESS;
        } else {
            request.setAttribute("info","发生错误，请稍后重试！");
            return ERROR;
        }
    }

    @Override
    public void setServletRequest(HttpServletRequest httpServletRequest) {
        this.request = httpServletRequest;
        this.session = request.getSession();
    }
}
