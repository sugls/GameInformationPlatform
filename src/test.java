import net.rithms.riot.api.ApiConfig;
import net.rithms.riot.api.RiotApi;
import net.rithms.riot.api.RiotApiAsync;
import net.rithms.riot.api.RiotApiException;
import net.rithms.riot.api.endpoints.league.dto.LeagueItem;
import net.rithms.riot.api.endpoints.league.dto.LeagueList;
import net.rithms.riot.api.endpoints.league.dto.LeaguePosition;
import net.rithms.riot.api.endpoints.spectator.dto.FeaturedGames;
import net.rithms.riot.api.endpoints.summoner.dto.Summoner;
import net.rithms.riot.api.request.AsyncRequest;
import net.rithms.riot.api.request.RequestAdapter;
import net.rithms.riot.constant.Platform;
import util.RiotApiConfig;

import java.util.*;
import java.util.logging.Level;

/**
 *
 * Created by lsc on 2017/5/9.
 */
public class test {

    static class SummonerLeague{
        Summoner summoner;
        LeaguePosition league;

        SummonerLeague(Summoner s, LeaguePosition l){
            this.summoner = s;
            this.league = l;
        }

        SummonerLeague(){}

        @Override
        public String toString() {
            return "SummonerLeague{" +
                    "summoner=" + summoner +
                    ", league=" + league +
                    '}';
        }
    }


    private static void t1() {
        Platform[] platforms = Platform.values();
        for (Platform platform : platforms) {
            if (platform.getId().equals("GLOBAL"))
                continue;
            if (platform.getId().contains("1"))
                continue;
            System.out.println(platform);
        }
    }

    private static List<SummonerLeague> t2() throws RiotApiException {
        ApiConfig config = new ApiConfig();
        config.setKey("RGAPI-13cd1937-18f5-44d7-9d6d-cd5e57a7821c");
        RiotApi api = new RiotApi(config);
        RiotApiAsync apiAsync = api.getAsyncApi();
        List<SummonerLeague> list = new ArrayList<>();
        String platformId = "GLOBAL";
        String summonerName = "skt t1 peanut";
        Platform[] platforms = Platform.values();
        System.out.println("GLOBAL".equals(platformId));



        if ("GLOBAL".equals(platformId)){
            for (Platform platform : platforms) {
                if (platform.getId().equals("GLOBAL"))
                    continue;
               /* if (platform.getId().contains("1"))
                    continue;*/
                System.out.println(platform);

                SummonerLeague eSummoner = new SummonerLeague();

                AsyncRequest requestSummoner = apiAsync.getSummonerByName(platform, summonerName);

                requestSummoner.addListeners(new RequestAdapter() {
                    @Override
                    public void onRequestSucceeded(AsyncRequest request) {
				/*Map<String, Summoner> summoners = request.getDto();
				eSummoner.summoner = summoners.get(String.valueOf(summonerId));*/
                        eSummoner.summoner = request.getDto();
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

                if (eSummoner.summoner != null){
                    Set<LeaguePosition> leaguePositions = api.getLeaguePositionsBySummonerId(platform,eSummoner.summoner.getId());
                    if (leaguePositions != null && !leaguePositions.isEmpty()) {
                        eSummoner.league = leaguePositions.iterator().next();
                    }
                }
                list.add(eSummoner);
            }
        }
        return list;
    }


    public static void t3() {
        String platformId = "GLOBAL";
        Platform platform = Platform.getPlatformById(platformId);
        String summonerName = "skt t1 faker";
        ApiConfig config = new ApiConfig();
        config.setKey("RGAPI-13cd1937-18f5-44d7-9d6d-cd5e57a7821c");
        RiotApi api = new RiotApi(config);

        List<dao.SummonerLeague> list = new ArrayList<>();


        if ("GLOBAL".equals(platformId)) {
            Platform[] platforms = Platform.values();
            RiotApiAsync apiAsync = api.getAsyncApi();

            for (Platform p : platforms) {
                if (p.getId().equals("GLOBAL"))
                    continue;
               /* if (p.getId().contains("1"))
                    continue;*/
                dao.SummonerLeague eSummoner = new dao.SummonerLeague();

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
                }
                list.add(eSummoner);
            }

            for (dao.SummonerLeague s : list){
                System.out.println(s);
            }


        } else {
            dao.SummonerLeague eSummoner = new dao.SummonerLeague();
            try {
                eSummoner.setSummoner(api.getSummonerByName(platform, summonerName));
                if (eSummoner.getSummoner() != null) {
                    Set<LeaguePosition> leaguePositions = api.getLeaguePositionsBySummonerId(platform, eSummoner.getSummoner().getId());
                    if (leaguePositions == null || leaguePositions.isEmpty()) {
                        return;
                    }
                    eSummoner.setLeague(leaguePositions.iterator().next());
                    eSummoner.setPlatform(platform);
                }
            } catch (RiotApiException e) {
                e.printStackTrace();
            }
            list.add(eSummoner);
        }

        for (dao.SummonerLeague s : list){
            System.out.println(s);
        }

    }


    public static void t4() {

        ApiConfig config = new ApiConfig();
        config.setKey("RGAPI-13cd1937-18f5-44d7-9d6d-cd5e57a7821c");
        RiotApi api = new RiotApi(config);

        try {
            FeaturedGames games = api.getFeaturedGames(Platform.KR);
            System.out.println(games.getClientRefreshInterval());
        } catch (RiotApiException e) {
            e.printStackTrace();
        }

    }


    static void t5(){
        RiotApi api = RiotApiConfig.getRiotApi();
        try {
            List<LeagueList> list = api.getLeagueBySummonerId(Platform.KR, 27971322);

            for (LeagueList l : list) {
                System.out.println(l.getName());
                System.out.println(l.getQueue());
                System.out.println(l.getTier());
                List<LeagueItem> item = l.getEntries();
                System.out.println(item.size());
            }
        } catch (RiotApiException e) {
            e.printStackTrace();
        }

    }


    static void t6() {
        RiotApi api = RiotApiConfig.getRiotApi();
        try {
            Set<LeaguePosition> set = api.getLeaguePositionsBySummonerId(Platform.KR, 27971322);

            for (LeaguePosition l : set) {
                System.out.println(l.getLeagueName());
            }

        } catch (RiotApiException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        t5();
    }

}
