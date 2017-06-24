package summoner.dao;

import net.rithms.riot.api.endpoints.summoner.dto.Summoner;
import summoner.dto.Account;
import summoner.dto.Matches;
import net.rithms.riot.api.RiotApiException;
import net.rithms.riot.api.endpoints.match.dto.MatchList;
import net.rithms.riot.api.endpoints.match.dto.Participant;
import net.rithms.riot.api.endpoints.static_data.dto.Item;
import net.rithms.riot.api.endpoints.static_data.dto.Mastery;
import net.rithms.riot.api.endpoints.static_data.dto.SummonerSpell;
import net.rithms.riot.constant.Platform;
import summoner.dto.SummonerLeague;

import java.util.List;

/**
 *
 * Created by lsc on 2017/5/14.
 */
public interface ISummonerLeagueDAO {

    /**
     * 根据顽玩家名称查询玩家基本数据和段位数据
     * @param p 服务器，p 为 Global 时，检索所有服务器
     * @param summonerName 玩家名称
     * @return SummonerLeague List
     */
    List<SummonerLeague> searchSummonerByPlatform(Platform p, String summonerName);

    /**
     * 根据SummonerId获取玩家游戏数据
     * @param p 服务器
     * @param id SummonerId
     * @return SummonerLeague
     * @throws RiotApiException
     */
    SummonerLeague getSummonerLeagueBySummonerId(Platform p, long id) throws RiotApiException;

    /**
     * 根据SummonerId获取AccountId
     * @param p 服务器名
     * @param id SummonerId
     * @return AccountId
     * @throws RiotApiException
     */
    Long getAccountIdBySummonerId(Platform p, long id) throws RiotApiException;

    /**
     * 根据SummonerId获取最近游戏比赛记录
     * @param p 服务器名
     * @param id SummonerId
     * @return MatchList
     * @throws RiotApiException
     */
    MatchList getRecentMatchListBySummonerId(Platform p, long id) throws RiotApiException;

    /**
     * 分页获取游戏数据列表
     * @param p 服务器
     * @param id SummonerId
     * @param page 指定页
     * @param pageSize 页大小
     * @return Matches List
     * @throws RiotApiException
     */
    List<Matches> getRecentMatchList(Platform p, long id, int page, int pageSize) throws RiotApiException;

    net.rithms.riot.api.endpoints.static_data.dto.Champion getChampionById(int id);

    /**
     *
     * @param id
     * @return
     */
    SummonerSpell getSummonerSpellById(int id);

    /**
     * 获取基石天赋
     * @param participant
     * @return Mastery 基石天赋
     */
    Mastery getKeystoneMasteryByParticipant(Participant participant);


    Item getItemById(int id);

    /**
     * 根据用户id获取绑定游戏账号
     * @param userid 用户id
     * @return SummonerLeague List
     */
    List<SummonerLeague> getAccountSummonersById(int userid);

    /**
     *
     */
    boolean insertAccount(Account account);

}
