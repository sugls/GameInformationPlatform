package leaderboard.dao;

import net.rithms.riot.api.RiotApi;
import net.rithms.riot.api.RiotApiException;
import net.rithms.riot.api.endpoints.league.dto.LeagueItem;
import net.rithms.riot.api.endpoints.league.dto.LeagueList;
import net.rithms.riot.constant.Platform;
import util.RiotApiConfig;

import java.util.Comparator;
import java.util.List;

/**
 *
 * Created by lsc on 2017/5/29.
 */
public class LeaderboardDAOImpl implements ILeaderboardDAO {
    @Override
    public LeagueList getChallengerLeagueList(Platform p, String queue) {
        RiotApi api = RiotApiConfig.getRiotApi();

        try {
            LeagueList list = api.getChallengerLeagueByQueue(p,queue);
            list.getEntries().sort((o1, o2) -> o2.getLeaguePoints()-o1.getLeaguePoints());
            return list;
        } catch (RiotApiException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public LeagueList getMasterLeagueList(Platform p, String queue) {
        RiotApi api = RiotApiConfig.getRiotApi();

        try {
            LeagueList list = api.getMasterLeagueByQueue(p,queue);
            list.getEntries().sort((o1, o2) -> o2.getLeaguePoints()-o1.getLeaguePoints());
            return list;
        } catch (RiotApiException e) {
            e.printStackTrace();
        }
        return null;
    }
}
