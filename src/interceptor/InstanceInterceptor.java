package interceptor;

import champion.dao.ChampionDAOImpl;
import champion.dao.IChampionDAO;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
import community.dao.CommunityDaoImpl;
import community.dao.ICommunityDao;
import leaderboard.dao.ILeaderboardDAO;
import leaderboard.dao.LeaderboardDAOImpl;
import org.apache.struts2.ServletActionContext;
import summoner.dao.ISummonerLeagueDAO;
import summoner.dao.SummonerLeagueDAOImpl;
import video.dao.IVideoDao;
import video.dao.VideoDaoImpl;

import javax.servlet.http.HttpServletRequest;

/**
 * instance 拦截器
 * Created by lsc on 2017/5/16.
 */
public class InstanceInterceptor implements Interceptor{

    private ISummonerLeagueDAO summonerDao;
    private IChampionDAO championDAO;
    private ICommunityDao communityDao;
    private ILeaderboardDAO leaderboardDAO;
    private IVideoDao videoDao;

    @Override
    public void destroy() {
        summonerDao = null;
        championDAO = null;
        communityDao = null;
        leaderboardDAO = null;
        videoDao = null;
    }

    @Override
    public void init() {
        summonerDao = new SummonerLeagueDAOImpl();
        championDAO = new ChampionDAOImpl();
        communityDao = new CommunityDaoImpl();
        leaderboardDAO = new LeaderboardDAOImpl();
        videoDao = new VideoDaoImpl();

    }

    @Override
    public String intercept(ActionInvocation actionInvocation) throws Exception {
        HttpServletRequest request = (HttpServletRequest) actionInvocation.getInvocationContext().get(ServletActionContext.HTTP_REQUEST);
        request.setAttribute("ISummonerDao", summonerDao);
        request.setAttribute("IChampionDao", championDAO);
        request.setAttribute("ICommunityDao", communityDao);
        request.setAttribute("ILeaderboardDao", leaderboardDAO);
        request.setAttribute("IVideoDao",videoDao);
        return actionInvocation.invoke();
    }
}
