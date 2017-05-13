import net.rithms.riot.api.ApiConfig;
import net.rithms.riot.api.RiotApi;
import net.rithms.riot.api.RiotApiException;
import net.rithms.riot.api.endpoints.summoner.dto.Summoner;
import net.rithms.riot.constant.Platform;

/**
 * This is a simple example using the RiotApi to request summoner information for a few given summoner names
 */
public class SimpleExample {

	public static void main(String[] args) throws RiotApiException {
		ApiConfig config = new ApiConfig().setKey("RGAPI-13cd1937-18f5-44d7-9d6d-cd5e57a7821c");
		RiotApi api = new RiotApi(config);

		Summoner summoner = api.getSummonerByName(Platform.NA, "a happy fly");
		System.out.println("Name: " + summoner.getName() + ", ID: " + summoner.getId());
		System.out.println(summoner.getProfileIconId());
	}
}