package champion.dao;

import net.rithms.riot.api.endpoints.champion.dto.ChampionList;
import net.rithms.riot.api.endpoints.static_data.dto.Champion;
import net.rithms.riot.constant.Platform;

import java.util.List;
import java.util.Map;

/**
 *
 * Created by lsc on 2017/5/16.
 */
public interface IChampionDAO {

    /**
     * 获取英雄列表
     * @param p 服务器名
     * @return ChampionList
     */
    ChampionList getChampionList(Platform p);

    /**
     * 获取所有英雄静态数据Map
     * @param p 服务器名
     * @return 英雄数据 Map
     */
    Map<String, Champion> getDataChampionMap(Platform p);

    /**
     * 根据英雄数据Map获取英雄数据列表
     * @param map 英雄数据 Map
     * @return Champion List
     */
    List<Champion> getDataChampionList(Map<String,Champion> map);

    /**
     * 获取周免英雄数据列表
     * @param p 服务器名
     * @param map  英雄数据 Map
     * @return 周免英雄数据列表
     */
    List<Champion> getFreeToPlayDataChampionList(Platform p,Map<String,Champion> map);

    /**
     * 根据ChampionId获取英雄数据
     * @param p 服务器名
     * @param id ChampionId
     * @return Champion
     */
    Champion getDataChampionById(Platform p, int id);

}
