package champion.dao;

import net.rithms.riot.api.endpoints.champion.dto.Champion;
import net.rithms.riot.api.endpoints.champion.dto.ChampionList;
import net.rithms.riot.constant.Platform;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.util.Comparator;
import java.util.List;
import java.util.Map;

/**
 *
 * Created by lsc on 2017/5/16.
 */
public class ChampionDAOImplTest {
    private IChampionDAO dao;
    @Before
    public void setUp() throws Exception {
        dao = new ChampionDAOImpl();
    }

    @After
    public void tearDown() throws Exception {
        dao = null;
    }

    @Test
    public void getChampionList() throws Exception {
        ChampionList list = dao.getChampionList(Platform.NA);
        List<Champion> champions = list.getChampions();
        for (Champion c :
                champions) {
            System.out.println(c);
        }
    }


   /* @Test
    public void getDataChampionList() throws Exception {
        List<net.rithms.riot.api.endpoints.static_data.dto.Champion> c =dao.getDataChampionList(Platform.NA);
        long i = System.currentTimeMillis();
        c.sort(Comparator.comparing(net.rithms.riot.api.endpoints.static_data.dto.Champion::getKey));
        System.out.println(System.currentTimeMillis()-i);
        System.out.println(c);
    }*/

    @Test
    public void getFreeToPlay() throws Exception{
        Map<String, net.rithms.riot.api.endpoints.static_data.dto.Champion> map = dao.getDataChampionMap(Platform.NA);
        System.out.println(map.keySet());
        List<net.rithms.riot.api.endpoints.static_data.dto.Champion> list = dao.getFreeToPlayDataChampionList(Platform.NA,map);
       for (net.rithms.riot.api.endpoints.static_data.dto.Champion c:list){
           System.out.println(c);
       }
    }

    @Test
    public void getDataChampionById(){
        System.out.println(dao.getDataChampionById(Platform.NA,104));
    }

}