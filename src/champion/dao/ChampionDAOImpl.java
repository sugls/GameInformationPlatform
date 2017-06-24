package champion.dao;

import net.rithms.riot.api.RiotApi;
import net.rithms.riot.api.RiotApiException;
import net.rithms.riot.api.endpoints.champion.dto.ChampionList;
import net.rithms.riot.api.endpoints.static_data.constant.ChampData;
import net.rithms.riot.api.endpoints.static_data.constant.ChampListData;
import net.rithms.riot.api.endpoints.static_data.constant.Locale;
import net.rithms.riot.api.endpoints.static_data.dto.Champion;
import net.rithms.riot.constant.Platform;
import util.RiotApiConfig;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Map;

/**
 *
 * Created by lsc on 2017/5/16.
 */
public class ChampionDAOImpl implements IChampionDAO {

    @Override
    public ChampionList getChampionList(Platform p) {
        RiotApi api = RiotApiConfig.getRiotApi();
        try {
            return api.getChampions(p);
        } catch (RiotApiException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Map<String, Champion> getDataChampionMap(Platform p) {
        try {
            return RiotApiConfig.getRiotApi().getDataChampionList(p, Locale.ZH_CN, null, true, ChampListData.TAGS).getData();
        } catch (RiotApiException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Champion> getDataChampionList(Map<String, Champion> map) {
        List<Champion> list = new ArrayList<>();
        for (Map.Entry<String, Champion> entry : map.entrySet()) {
            list.add(entry.getValue());
        }
        list.sort(Comparator.comparing(Champion::getKey));
        return list;
    }

    @Override
    public List<Champion> getFreeToPlayDataChampionList(Platform p, Map<String,Champion> map) {
        List<Champion> championList = new ArrayList<>();
        try {
            ChampionList freelist = RiotApiConfig.getRiotApi().getChampions(p, true);
            for (net.rithms.riot.api.endpoints.champion.dto.Champion c :
                    freelist.getChampions()) {
                championList.add(map.get(String.valueOf(c.getId())));
            }
        } catch (RiotApiException e) {
            e.printStackTrace();
        }
        return championList;
    }

    @Override
    public Champion getDataChampionById(Platform p, int id) {
        try {
            return RiotApiConfig.getRiotApi().getDataChampion(p,id,Locale.ZH_CN,null,ChampData.ALL);
        } catch (RiotApiException e) {
            e.printStackTrace();
        }
        return null;
    }
}
