package leaderboard.dao;

import net.rithms.riot.api.endpoints.league.dto.LeagueList;
import net.rithms.riot.constant.Platform;

import java.util.List;

/**
 *
 * Created by lsc on 2017/5/29.
 */
public interface ILeaderboardDAO {

    /**
     * 根据服务器名和排位队列获取 最强王者 LeagueList
     * @param p 服务器
     * @param queue 排位队列
     * @return LeagueList
     */
    LeagueList getChallengerLeagueList(Platform p, String queue);

    /**
     * 根据服务器名和排位队列获取 超凡大师 LeagueList
     * @param p 服务器
     * @param queue 排位队列
     * @return LeagueList
     */
    LeagueList getMasterLeagueList(Platform p, String queue);

}
