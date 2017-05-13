package servlet;

import dao.SummonerLeague;
import net.rithms.riot.api.ApiConfig;
import net.rithms.riot.api.RiotApi;
import net.rithms.riot.api.RiotApiAsync;
import net.rithms.riot.api.RiotApiException;
import net.rithms.riot.api.endpoints.league.dto.LeaguePosition;
import net.rithms.riot.api.request.AsyncRequest;
import net.rithms.riot.api.request.RequestAdapter;
import net.rithms.riot.constant.Platform;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.logging.Level;

/**
 *
 * Created by lsc on 2017/5/8.
 */
@WebServlet(name = "SearchServlet", urlPatterns = "/search")
public class SearchServlet extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String platformId = request.getParameter("region");
        Platform platform = Platform.getPlatformById(platformId);
        String summonerName = request.getParameter("summoner");
        ApiConfig config = new ApiConfig();
        config.setKey("RGAPI-13cd1937-18f5-44d7-9d6d-cd5e57a7821c");
        RiotApi api = new RiotApi(config);

        List<SummonerLeague> list = new ArrayList<>();


        if ("GLOBAL".equals(platformId)) {
            Platform[] platforms = Platform.values();
            RiotApiAsync apiAsync = api.getAsyncApi();

            for (Platform p : platforms) {
                if (p.getId().equals("GLOBAL"))
                    continue;
                SummonerLeague eSummoner = new SummonerLeague();

                AsyncRequest requestSummoner = apiAsync.getSummonerByName(p, summonerName);

                requestSummoner.addListeners(new RequestAdapter() {
                    @Override
                    public void onRequestSucceeded(AsyncRequest request) {
                        eSummoner.setSummoner(request.getDto());
                    }
                });

                // 等待异步请求完成
                try {
                    // Wait for all asynchronous requests to finish
                    apiAsync.awaitAll();
                } catch (InterruptedException e) {
                    // We can use the Api's logger
                    RiotApi.log.log(Level.SEVERE, "Waiting Interrupted", e);
                }

                if (eSummoner.getSummoner() != null) {
                    Set<LeaguePosition> leaguePositions = null;
                    try {
                        leaguePositions = api.getLeaguePositionsBySummonerId(p, eSummoner.getSummoner().getId());
                    } catch (RiotApiException e) {
                        e.printStackTrace();
                    }
                    if (leaguePositions != null && !leaguePositions.isEmpty()) {
                        eSummoner.setLeague(leaguePositions.iterator().next());
                    }
                    eSummoner.setPlatform(p);
                    list.add(eSummoner);
                }

            }
        } else {
            SummonerLeague eSummoner = new SummonerLeague();
            try {
                eSummoner.setSummoner(api.getSummonerByName(platform, summonerName));
                if (eSummoner.getSummoner() != null) {
                    Set<LeaguePosition> leaguePositions = api.getLeaguePositionsBySummonerId(platform, eSummoner.getSummoner().getId());
                    if (leaguePositions != null && !leaguePositions.isEmpty()) {
                        eSummoner.setLeague(leaguePositions.iterator().next());
                    }
                    eSummoner.setPlatform(platform);
                    list.add(eSummoner);
                }
            } catch (RiotApiException e) {
                e.printStackTrace();
            }
        }


       /* for (SummonerLeague s : list) {
            System.out.println(s);
        }*/

        request.setAttribute("summonerList", list);
        request.getRequestDispatcher("searchlist.jsp").forward(request, response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
