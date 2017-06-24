package summoner.dto;

import net.rithms.riot.api.endpoints.league.dto.LeaguePosition;
import net.rithms.riot.api.endpoints.summoner.dto.Summoner;
import net.rithms.riot.constant.Platform;

/**
 *
 * Created by lsc on 2017/5/9.
 */
public class SummonerLeague {

    private Summoner summoner;
    private LeaguePosition league;
    private Platform platform;


    public Summoner getSummoner() {
        return summoner;
    }

    public void setSummoner(Summoner summoner) {
        this.summoner = summoner;
    }

    public LeaguePosition getLeague() {
        return league;
    }

    public void setLeague(LeaguePosition league) {
        this.league = league;
    }

    public Platform getPlatform() {
        return platform;
    }

    public void setPlatform(Platform platform) {
        this.platform = platform;
    }

    @Override
    public String toString() {
        return "SummonerLeague{" +
                "summoner=" + summoner +
                ", league=" + league +
                ", platform='" + platform + '\'' +
                '}';
    }
}
