package summoner.dao;

import net.rithms.riot.api.RiotApiException;
import net.rithms.riot.constant.Platform;
import org.junit.Test;
import summoner.dto.Matches;
import summoner.dto.SummonerLeague;

import java.util.List;

/**
 *
 * Created by lsc on 2017/5/14.
 */
public class SummonerLeagueDAOImplTest {
    private ISummonerLeagueDAO dao;
    @org.junit.Before
    public void setUp() throws Exception {
        dao = new SummonerLeagueDAOImpl();
    }

    @org.junit.After
    public void tearDown() throws Exception {
        dao = null;
    }

    @org.junit.Test
    public void getSummonerLeagueBySummonerId(){

        try{
            SummonerLeague league = dao.getSummonerLeagueBySummonerId(Platform.NA,58645222);
            System.out.println(league.getSummoner());
            System.out.println(league);
        } catch (RiotApiException e) {
            e.printStackTrace();
        }


    }

    @Test
    public void getRecentMatchList() throws Exception {
        List<Matches> matchesList = dao.getRecentMatchList(Platform.KR,27971322,1,5);
        for (Matches matches :
                matchesList) {
            System.out.println(matches.getMatch());
            System.out.println(matches.getChampion());
            System.out.println(matches.getPart().getStats().isWin());
            System.out.println(matches.getSpell1());
            System.out.println(matches.getSpell2());
            System.out.println(matches.getKeystone());
            System.out.println(matches.getItem0());
            System.out.println(matches.getItem1().getGold().getTotal());
            System.out.println(matches.getItem2());
            System.out.println(matches.getItem3());
            System.out.println(matches.getItem4());
            System.out.println(matches.getItem5());
            System.out.println(matches.getItem6());
            System.out.println("-----");
        }
    }

    @org.junit.Test
    public void getAccountIdBySummonerId() throws Exception {

    }

    @org.junit.Test
    public void getRecentMatchListBySummonerId() throws Exception {

    }

    @org.junit.Test
    public void getKeystoneMasteryByParticipant() throws Exception {

    }

    @org.junit.Test
    public void getItemListByParticipant() throws Exception {

    }

    @org.junit.Test
    public void getParticipantListByTeamId() throws Exception {

    }

    @org.junit.Test
    public void getParticipantBySummonerIdGameId() throws Exception {

    }

    @Test
    public void getAccountSummonersByIdTest() throws Exception {
        System.out.println(dao.getAccountSummonersById(1).get(0).getSummoner().getName());
    }
}