package summoner.dto;

import net.rithms.riot.api.endpoints.match.dto.Match;
import net.rithms.riot.api.endpoints.match.dto.MatchReference;
import net.rithms.riot.api.endpoints.match.dto.Participant;
import net.rithms.riot.api.endpoints.static_data.dto.*;

/**
 *
 * Created by lsc on 2017/5/14.
 */
public class Matches {

    private Match match;
    private Participant part;
    private MatchReference reference;
    private Champion champion;
    private SummonerSpell spell1;
    private SummonerSpell spell2;
    private Mastery keystone;
    private Item item0;
    private Item item1;
    private Item item2;
    private Item item3;
    private Item item4;
    private Item item5;
    private Item item6;

    public MatchReference getReference() {
        return reference;
    }

    public void setReference(MatchReference reference) {
        this.reference = reference;
    }

    public Item getItem0() {
        return item0;
    }

    public void setItem0(Item item0) {
        this.item0 = item0;
    }

    public Item getItem1() {
        return item1;
    }

    public void setItem1(Item item1) {
        this.item1 = item1;
    }

    public Item getItem2() {
        return item2;
    }

    public void setItem2(Item item2) {
        this.item2 = item2;
    }

    public Item getItem3() {
        return item3;
    }

    public void setItem3(Item item3) {
        this.item3 = item3;
    }

    public Item getItem4() {
        return item4;
    }

    public void setItem4(Item item4) {
        this.item4 = item4;
    }

    public Item getItem5() {
        return item5;
    }

    public void setItem5(Item item5) {
        this.item5 = item5;
    }

    public Item getItem6() {
        return item6;
    }

    public void setItem6(Item item6) {
        this.item6 = item6;
    }

    public Mastery getKeystone() {
        return keystone;
    }

    public void setKeystone(Mastery keystone) {
        this.keystone = keystone;
    }

    public SummonerSpell getSpell1() {
        return spell1;
    }

    public void setSpell1(SummonerSpell spell1) {
        this.spell1 = spell1;
    }

    public SummonerSpell getSpell2() {
        return spell2;
    }

    public void setSpell2(SummonerSpell spell2) {
        this.spell2 = spell2;
    }

    public Champion getChampion() {
        return champion;
    }

    public void setChampion(Champion champion) {
        this.champion = champion;
    }

    public Match getMatch() {
        return match;
    }

    public void setMatch(Match match) {
        this.match = match;
    }

    public Participant getPart() {
        return part;
    }

    public void setPart(Participant part) {
        this.part = part;
    }

    @Override
    public String toString() {
        return "Matches{" +
                "match=" + match +
                ", part=" + part +
                '}';
    }
}
