package summoner.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import summoner.dto.Account;
import summoner.dto.Matches;
import net.rithms.riot.api.RiotApi;
import net.rithms.riot.api.RiotApiAsync;
import net.rithms.riot.api.RiotApiException;
import net.rithms.riot.api.endpoints.league.dto.LeaguePosition;
import net.rithms.riot.api.endpoints.match.dto.*;
import net.rithms.riot.api.endpoints.static_data.constant.*;
import net.rithms.riot.api.endpoints.static_data.constant.Locale;
import net.rithms.riot.api.endpoints.static_data.dto.*;
import net.rithms.riot.api.endpoints.static_data.dto.Mastery;
import net.rithms.riot.api.endpoints.summoner.dto.Summoner;
import net.rithms.riot.api.request.AsyncRequest;
import net.rithms.riot.api.request.RequestAdapter;
import net.rithms.riot.constant.Platform;
import summoner.dto.SummonerLeague;
import util.MybatisSqlSessionFactory;
import util.RiotApiConfig;

import java.util.*;
import java.util.logging.Level;

/**
 *
 * Created by lsc on 2017/5/14.
 */
public class SummonerLeagueDAOImpl implements ISummonerLeagueDAO{

    private Logger log = Logger.getLogger(SummonerLeagueDAOImpl.class);

    @Override
    public List<SummonerLeague> searchSummonerByPlatform(Platform platform, String summonerName) {

        RiotApi api = RiotApiConfig.getRiotApi();

        List<SummonerLeague> list = new ArrayList<>();


        if ("GLOBAL".equals(platform.getId())) {
            Platform[] platforms = Platform.values();
            RiotApiAsync apiAsync = RiotApiConfig.getRiotApiAsync();

            for (Platform p : platforms) {
                if (p.getId().equals("GLOBAL"))
                    continue;
                if (p.getId().equals("PBE1"))
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
                        log.info(e);
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
        return list;
    }

    int anInt = 0;

    public List<Matches> getRecentMatchList(Platform p, long id , int page, int pageSize) throws RiotApiException{
        RiotApi api = RiotApiConfig.getRiotApi();
        RiotApiAsync apiAsync = RiotApiConfig.getRiotApiAsync();
        long accountId = api.getSummoner(p,id).getAccountId();
        anInt++;    // api + 1
        System.out.println(accountId);
        MatchList matchList = api.getRecentMatchListByAccountId(p, accountId);
        anInt++;
        System.out.println(matchList);

        List<MatchReference> reference = matchList.getMatches();
      /*  reference.sort(new Comparator<MatchReference>() {
            @Override
            public int compare(MatchReference o1, MatchReference o2) {
                return (int) (o1.getTimestamp() - o2.getTimestamp());
            }
        });*/

        List<MatchReference> subReference =  reference.subList((page-1)*pageSize,page*pageSize<reference.size()?page*pageSize:reference.size());
        List<Matches> matchesList = new ArrayList<>();
        for (MatchReference matchReference : subReference) {
            Matches matches = new Matches();
            long gameId = matchReference.getGameId();
            matches.setReference(matchReference);
            matches.setChampion(getChampionById(matchReference.getChampion()));
            apiAsync.getMatch(p, gameId).addListeners(new RequestAdapter() {
                @Override
                public void onRequestSucceeded(AsyncRequest request) {
                    Match m = request.getDto();
                    matches.setMatch(m);
                    Participant p = m.getParticipantBySummonerId(id);
                    if (p != null){
                        matches.setPart(p);

                        matches.setSpell1(getSummonerSpellById(p.getSpell1Id()));
                        matches.setSpell2(getSummonerSpellById(p.getSpell2Id()));
                        matches.setKeystone(getKeystoneMasteryByParticipant(p));

                        ParticipantStats stats = p.getStats();

                        matches.setItem0(stats.getItem0()==0?null:getItemById(stats.getItem0()));
                        matches.setItem1(stats.getItem1()==0?null:getItemById(stats.getItem1()));
                        matches.setItem2(stats.getItem2()==0?null:getItemById(stats.getItem2()));
                        matches.setItem3(stats.getItem3()==0?null:getItemById(stats.getItem3()));
                        matches.setItem4(stats.getItem4()==0?null:getItemById(stats.getItem4()));
                        matches.setItem5(stats.getItem5()==0?null:getItemById(stats.getItem5()));
                        matches.setItem6(stats.getItem6()==0?null:getItemById(stats.getItem6()));


                    }
                    anInt++;
                }
                @Override
                public void onRequestTimeout(AsyncRequest request) {
                    System.out.println("timeout");
                }
            });

            matchesList.add(matches);
        }
        try {
            apiAsync.awaitAll();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        System.out.println(anInt);
        return matchesList;
    }


    @Override
    public Item getItemById(int id) {
        RiotApi api = RiotApiConfig.getRiotApi();
        try {
            return api.getDataItem(Platform.NA,id, Locale.ZH_CN,null, ItemData.ALL);
        } catch (RiotApiException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public SummonerLeague getSummonerLeagueBySummonerId(Platform p, long id) throws RiotApiException{

        RiotApiAsync apiAsync = RiotApiConfig.getRiotApiAsync();
        SummonerLeague eSummoner = new SummonerLeague();

        AsyncRequest requestSummoner = apiAsync.getSummoner(p, id);
        requestSummoner.addListeners(new RequestAdapter() {
            @Override
            public void onRequestSucceeded(AsyncRequest request) {
                eSummoner.setSummoner(request.getDto());
            }
        });
        AsyncRequest requestLeague = apiAsync.getLeaguePositionsBySummonerId(p, id);
        requestLeague.addListeners(new RequestAdapter() {
            @Override
            public void onRequestSucceeded(AsyncRequest request) {
                Set<LeaguePosition> leaguePositions = request.getDto();
                if (leaguePositions != null && !leaguePositions.isEmpty()) {
                    eSummoner.setLeague(leaguePositions.iterator().next());
                }
            }
        });
        eSummoner.setPlatform(p);

        try {
            // Wait for all asynchronous requests to finish
            apiAsync.awaitAll();
        } catch (InterruptedException e) {
            // We can use the Api's logger
            RiotApi.log.log(Level.SEVERE, "Waiting Interrupted", e);
        }

        return eSummoner;
    }

    @Override
    public Long getAccountIdBySummonerId(Platform p, long id) throws RiotApiException{
        RiotApiAsync apiAsync = RiotApiConfig.getRiotApiAsync();
        final Summoner[] summoner = new Summoner[1];
        apiAsync.getSummoner(p, id).addListeners(new RequestAdapter() {
            @Override
            public void onRequestSucceeded(AsyncRequest request) {
                summoner[0] = request.getDto();
            }
        });
        try {
            apiAsync.awaitAll();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        return summoner[0].getAccountId();
    }

    @Override
    public MatchList getRecentMatchListBySummonerId(Platform p, long id) throws RiotApiException {
        RiotApiAsync apiAsync = RiotApiConfig.getRiotApiAsync();
        long accountId = getAccountIdBySummonerId(p, id);
        final MatchList[] matchList = new MatchList[1];
        apiAsync.getRecentMatchListByAccountId(p, accountId).addListeners(new RequestAdapter() {
            @Override
            public void onRequestSucceeded(AsyncRequest request) {
                matchList[0] = request.getDto();
            }
        });
        try {
            apiAsync.awaitAll();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        return matchList[0];
    }


    public Mastery getKeystoneMasteryByParticipant(Participant participant){
        RiotApi api = RiotApiConfig.getRiotApi();
        if (participant != null){
            List<net.rithms.riot.api.endpoints.match.dto.Mastery> masteries = participant.getMasteries();
            int[] ids = {6161,6162,6164,6261,6262,6263,6361,6362,6363};

            for (net.rithms.riot.api.endpoints.match.dto.Mastery m : masteries) {
                for (int i: ids){
                    if (m.getMasteryId()==i){
                        try {
                            return api.getDataMastery(Platform.NA,i,Locale.ZH_CN,null,MasteryData.ALL);
                        } catch (RiotApiException e) {
                            e.printStackTrace();
                        }
                    }
                }
            }
        }
        return null;
    }

    @Override
    public Champion getChampionById(int id) {
        RiotApi api = RiotApiConfig.getRiotApi();
        try {
            return api.getDataChampion(Platform.NA, id);
        } catch (RiotApiException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public SummonerSpell getSummonerSpellById(int id) {
        RiotApi api = RiotApiConfig.getRiotApi();
        try {
            return api.getDataSummonerSpell(Platform.NA,id,Locale.ZH_CN,null,SpellData.ALL);
        } catch (RiotApiException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Item> getItemListByParticipant(Participant participant)throws RiotApiException{
        RiotApiAsync apiAsync = RiotApiConfig.getRiotApiAsync();
        List<Item> items = new ArrayList<>();
        if (participant!=null){
            int[] ids = {participant.getStats().getItem0(),
                    participant.getStats().getItem1(),
                    participant.getStats().getItem2(),
                    participant.getStats().getItem3(),
                    participant.getStats().getItem4(),
                    participant.getStats().getItem5(),
                    participant.getStats().getItem6()};
            for (int i=0;i<ids.length;i++){
                if (ids[i]==0){
                    items.add(null);
                } else {
                    apiAsync.getDataItem(Platform.NA,ids[i]).addListeners(new RequestAdapter() {
                        @Override
                        public void onRequestSucceeded(AsyncRequest request) {
                            items.add(request.getDto());
                        }
                    });
                }
            }
            try {
                apiAsync.awaitAll();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        return items;
    }


    public Map<Integer,List<Participant>> getParticipantListByTeamId(Match match){
        Map<Integer,List<Participant>> team = new HashMap<>();
        if (match!=null){
            int team1Id = match.getTeams().get(0).getTeamId();
            int team2Id = match.getTeams().get(1).getTeamId();
            List<Participant> participants = match.getParticipants();
            List<Participant> team1 = new ArrayList<>();
            List<Participant> team2 = new ArrayList<>();
            for (Participant p : participants){
                if(p.getTeamId()==team1Id){
                    team1.add(p);
                }
                if (p.getTeamId()==team2Id){
                    team2.add(p);
                }
            }
            team.put(team1Id,team1);
            team.put(team2Id,team2);
        }
        return team;
    }


    public Participant getParticipantBySummonerIdGameId(long id1, Match match) throws RiotApiException{
        Participant participant = null;
        if (match != null){
            int index = 0;
            List<ParticipantIdentity> par = match.getParticipantIdentities();

            for (ParticipantIdentity i : par) {
                Player player = i.getPlayer();
                if (player != null){
                    if (player.getSummonerId()==id1){
                        index = i.getParticipantId();
                        break;
                    }
                }
            }


            List<Participant> ps = match.getParticipants();

            for (Participant pt :
                    ps) {
                if (index == pt.getParticipantId()) {
                    participant = pt;
                    break;
                }

            }
        }
        return participant;
    }

    @Override
    public List<SummonerLeague> getAccountSummonersById(int userid) {
        List<SummonerLeague> list = new ArrayList<>();
        SqlSession session = MybatisSqlSessionFactory.getSqlSession();
        List<Account> accounts = session.selectList("getAccountsByUserId",userid);
        MybatisSqlSessionFactory.closeSqlSession();

        if (accounts==null||accounts.size()<=0)
            return null;

        for (Account a :
                accounts) {
            System.out.println(a);
            try {
                list.add(getSummonerLeagueBySummonerId(Platform.getPlatformById(a.getPlatform()),a.getSummonerid()));
            } catch (RiotApiException e) {
                e.printStackTrace();
            }
        }
        return list;
    }

    @Override
    public boolean insertAccount(Account account) {
        boolean result = false;
        SqlSession session = MybatisSqlSessionFactory.getSqlSession();
        int i = session.insert("addAccount",account);
        if (i!=0){
            result = true;
            session.commit();
        }
        MybatisSqlSessionFactory.closeSqlSession();
        return result;
    }
}