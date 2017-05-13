import java.util.Map;

import net.rithms.riot.api.ApiConfig;
import net.rithms.riot.api.RiotApi;
import net.rithms.riot.api.RiotApiException;
import net.rithms.riot.api.endpoints.static_data.constant.ChampListData;
import net.rithms.riot.api.endpoints.static_data.constant.Locale;
import net.rithms.riot.api.endpoints.static_data.dto.Champion;
import net.rithms.riot.api.endpoints.static_data.dto.ChampionList;
import net.rithms.riot.constant.Platform;

/**
 * This is a simple example using the RiotApi to request some static data using a Locale
 */
public class StaticDataWithLocale {

	public static void main(String[] args) throws RiotApiException {
		ApiConfig config = new ApiConfig().setKey("RGAPI-13cd1937-18f5-44d7-9d6d-cd5e57a7821c");
		RiotApi api = new RiotApi(config);

		// Get all champions and print them with their German title
		ChampionList championList = api.getDataChampionList(Platform.NA, null, null, false, ChampListData.ALL);
		Map<String, Champion> map = championList.getData();
		for (Champion champion : map.values()) {
			System.out.println(champion.getName() + ": " + champion.getTitle());
		}
	}
}