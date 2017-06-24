<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="zh_CN">
<head>

    <meta charset="UTF-8">
    <title>游戏信息交流平台</title>

</head>

<body>

<div class="LayoutWrap CurrentMenu-summoner">

    <jsp:include page="../header.jsp"/>


    <div class="ContentWrap">
        <div class="Content">

            <div class="SummonerLayoutWrap">
                <div class="SummonerLayout tabWrap">
                    <div class="Header">

                        <div class="Face">
                            <div class="ProfileIcon">

                                <c:choose>
                                    <c:when test="${requestScope.sl.league.tier == null || requestScope.sl.league.tier=='BRONZE'}">

                                    </c:when>
                                    <c:otherwise>
                                        <div class="borderImage"
                                             style="background-image: url(../images/borders/${fn:toLowerCase(requestScope.sl.league.tier)}.png);">
                                        </div>
                                    </c:otherwise>
                                </c:choose>


                                <img src="http://ddragon.leagueoflegends.com/cdn/7.9.2/img/profileicon/${requestScope.sl.summoner.profileIconId}.png" alt="profileIcon" class="ProfileImage">
                            </div>
                        </div>

                        <div class="Profile">
                            <div class="Information">
                                <div class="Name">${requestScope.sl.summoner.name}</div>
                                <%--<a class="FavoriteButton" href="#" id="FavoriteButton">
                                    <i class="fa fa-thumbs-up"></i> 1234
                                </a>--%>
                                <br><br>
                                <div class="Rank">
                                    <div class="LadderRank">
                                        <span class="h4">服务器 ${requestScope.sl.platform}</span>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>


                    <div class="Menu">
                        <dl id="tabMenu" class="MenuList tabHeaders nav-tabs" role="tablist">
                            <dd role="presentation" class="Item tabHeader active" data-ajax-url="${pageContext.request.contextPath}/summoner/summary">
                                <a href="#summary" role="tab" >总览</a>
                            </dd>
                            <%--<dd role="presentation" class="Item tabHeader " data-ajax-url="${pageContext.request.contextPath}/summoner/champion" >
                                <a href="#champion"  role="tab">英雄</a>
                            </dd>
                            <dd role="presentation" class="Item tabHeader " data-ajax-url="${pageContext.request.contextPath}/summoner/league">
                                <a href="#league" role="tab">排位</a>
                            </dd>
                            <dd role="presentation" class="Item tabHeader " data-ajax-url="${pageContext.request.contextPath}/summoner/rune">
                                <a href="#rune" role="tab">符文</a>
                            </dd>
                            <dd role="presentation" class="Item tabHeader " data-ajax-url="${pageContext.request.contextPath}/summoner/mastery">
                                <a href="#mastery" role="tab">天赋</a>
                            </dd>--%>
                           <%-- <dd role="presentation" class="Item tabHeader inGame " data-tab-show-class="summonerLayout-spectator" data-tab-always-force-load="true">
                                <a class="SpectateTabButton" href="#"> <i class="fa fa-tv"></i>
                                    <span class="text">Live Game</span> </a>
                            </dd>--%>
                        </dl>
                    </div>

                    <div class="ContentWrap tabItems tab-content" id="SummonerLayoutContent">


                        <div id="summary" class="currentTab tabItem Content SummonerLayoutContent tab-pane active summonerLayout-summary" data-tab-data-url="" data-tab-spinner-height="800" data-tab-is-loaded-already="true">
                            L
                            <div class="SideContent">
                                <div class="TierBox Box">
                                    <div class="SummonerRatingMedium tip" title="Ranked Solo">
                                        <div class="Medal">
                                            <c:choose>
                                                <c:when test="${requestScope.sl.league.tier == null}">
                                                    <img src="../images/base-icons/provisional.png" alt="tier" class="Image">
                                                </c:when>
                                                <c:otherwise>
                                                    <img src="../images/base-icons/${fn:toLowerCase(requestScope.sl.league.tier)}.png" alt="tier" class="Image">
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                        <div class="TierRankInfo">
                                            ${requestScope.sl.league.queueType}
                                            <div class="TierRank">
                                                <span class="tierRank">${requestScope.sl.league.tier}  ${requestScope.sl.league.rank}</span>
                                            </div>
                                            <div class="TierInfo">
                                                <span class="LeaguePoints">
                                                    ${requestScope.sl.league.leaguePoints} 胜点
                                                </span>
                                                /
                                                <span class="WinLose">
                                                    <span class="wins">${requestScope.sl.league.wins!=null?requestScope.sl.league.wins:"--"}胜</span>
                                                <span class="losses">${requestScope.sl.league.losses!=null?requestScope.sl.league.losses:"--"}负</span>
					                <br>
					<span class="winratio">胜率 <c:set var="winrate" value="${requestScope.sl.league.wins!=null&&requestScope.sl.league.losses!=null?
                  requestScope.sl.league.wins / (requestScope.sl.league.wins + requestScope.sl.league.losses): '--'}"/>

                <c:if test="${!winrate.equals('--')}">
                    <fmt:formatNumber value="${winrate}" type="percent"/>
                </c:if>
                  <c:if test="${winrate.equals('--')}">
                      ----
                  </c:if></span>
							</span>
                                            </div>
                                            <div class="LeagueName">
                                               战区： ${requestScope.sl.league.leagueName}
                                            </div>
                                        </div>
                                    </div>

                                </div>

                            </div>
                            <div class="RealContent">
                                <div class="GameListContainer" data-summoner-id="27971322" data-last-info="1493047333">
                                    <div class="Header Box">
                                        <style>
                                            .SelectMatchTypes,
                                            .ChampionMatchSearchWrap > .Content { display: none; }
                                        </style>
                                        <script>
                                            String.prototype.replaceAll = function(search, replace){
                                                //if replace is not sent, return original string otherwise it will
                                                //replace search string with 'undefined'.
                                                if (replace === undefined) {
                                                    return this.toString();
                                                }

                                                return this.replace(new RegExp('[' + search + ']', 'g'), replace);
                                            };

                                            $(function(){
                                                var wrap = $('.ChampionMatchSearchWrap'),
                                                    content = $('>.Content', wrap),
                                                    allChampionList = $(">.SelectMatchChampionList >.Item.All .ChampionList", content);

                                                /*  var searchInputPast = null;*/

                                                var updateSearchKeyword = function(oSearchInput){
                                                    var keyword = oSearchInput.val().toLowerCase();
                                                    var allChampionHeader = $(">.AllChampion", allChampionList);
                                                    var allChampions = $(">.Item", allChampionList);

                                                    if (keyword.length > 0) {
                                                        allChampionHeader.show();
                                                    }

                                                    /* searchInputPast = keyword;*/

                                                    allChampions.each(function(i, o){
                                                        var championName = $(o).data('champion-name'),
                                                            championKey = $(o).data('champion-key'),
                                                            championNameChosung = $(o).data('champion-name-chosung');

                                                        if (championName) {
                                                            if (championName.indexOf(keyword) >= 0 || championKey.indexOf(keyword) >= 0 || (championNameChosung && championNameChosung.indexOf(keyword) >= 0)) {
                                                                $(o).removeClass('hide');
                                                                $(o).addClass('show');
                                                            } else {
                                                                $(o).removeClass('show');
                                                                $(o).addClass('hide');
                                                            }
                                                        }
                                                    });

                                                    var championNotFound = $(">.ChampionNotFound", allChampionList);
                                                    if ($(">.Item.show", allChampionList).length == 0) {
                                                        championNotFound.show();
                                                    } else {
                                                        championNotFound.hide();
                                                    }
                                                };

                                                var showChampionMatchSearch = function(){
                                                        // 중복 이벤트 할당 문제
                                                        if (content.is(':visible')) {
                                                            return;
                                                        }

                                                        content.show();
                                                        $(document).on('click', function(event){
                                                            var target = event.target || event.srcElement;
                                                            if (!$(target).closest(wrap.selector).length) {
                                                                hideChampionMatchSearch();
                                                            }
                                                        });
                                                    },
                                                    hideChampionMatchSearch = function(){
                                                        content.hide();
                                                        $(document).off('click');
                                                    };

                                                // 아무키나 누르면 띄워주도록
                                                var searchInput = $('>.Header >.Input', wrap);
                                                searchInput
                                                    .on('keyup keydown change click', function(){
                                                        showChampionMatchSearch();
                                                        updateSearchKeyword($(this));
                                                    });
                                            });
                                        </script>
                                        <div class="Navigation">
                                            <ul class="List Type">
                                                <li class="Item active" data-type="排位">
                                                    <a href="#" class="Link" data-type="total" onclick="$.OP.GG.matches.list.changeType($(this).data('type'), $(this)); return false;">战绩</a>
                                                </li>
                                                <%--<li class="Item " data-type="soloranked">
                                                    <a href="#" class="Link" data-type="soloranked" onclick="$.OP.GG.matches.list.changeType($(this).data('type'), $(this)); return false;">Ranked Solo</a>
                                                </li>
                                                <li class="Item " data-type="flexranked">
                                                    <a href="#" class="Link" data-type="flexranked" onclick="$.OP.GG.matches.list.changeType($(this).data('type'), $(this)); return false;">Ranked Flex</a>
                                                </li>
                                                <li class="Item" data-type="normal">
                                                    <a href="#" class="Link" data-type="normal" onclick="$.OP.GG.matches.list.changeType($(this).data('type'), $(this)); return false;">Normal</a>
                                                </li>--%>
                                            </ul>
                                           <%-- <div class="Actions">
                                                <div class="Action">
                                                    <div class="ChampionMatchSearchWrap">
                                                        <div class="Header">
                                                            <input type="text" class="Input" placeholder="Search a Champion">

                                                            <div class="Action">
                                                                <i class="fa fa-search"></i>
                                                            </div>
                                                        </div>
                                                        <div class="Content">
                                                            <ul class="SelectMatchChampionList short">
                                                                <li class="Item All">
                                                                    <div class="Header">Champion List</div>
                                                                    <div class="Content">
                                                                        <ul class="ChampionList">
                                                                            <li class="Item AllChampion">
                                                                                <a href="#" onclick="$.OP.GG.matches.list.changeChampion('', $(this)); return false;" class="Link">All Champions</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="aatrox" data-champion-key="aatrox">
                                                                                <a href="#" data-champion-id="266" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Aatrox</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="ahri" data-champion-key="ahri">
                                                                                <a href="#" data-champion-id="103" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Ahri</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="akali" data-champion-key="akali">
                                                                                <a href="#" data-champion-id="84" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Akali</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="alistar" data-champion-key="alistar">
                                                                                <a href="#" data-champion-id="12" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Alistar</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="amumu" data-champion-key="amumu">
                                                                                <a href="#" data-champion-id="32" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Amumu</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="anivia" data-champion-key="anivia">
                                                                                <a href="#" data-champion-id="34" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Anivia</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="annie" data-champion-key="annie">
                                                                                <a href="#" data-champion-id="1" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Annie</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="ashe" data-champion-key="ashe">
                                                                                <a href="#" data-champion-id="22" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Ashe</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="aurelionsol" data-champion-key="aurelionsol">
                                                                                <a href="#" data-champion-id="136" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Aurelion Sol</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="azir" data-champion-key="azir">
                                                                                <a href="#" data-champion-id="268" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Azir</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="bard" data-champion-key="bard">
                                                                                <a href="#" data-champion-id="432" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Bard</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="blitzcrank" data-champion-key="blitzcrank">
                                                                                <a href="#" data-champion-id="53" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Blitzcrank</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="brand" data-champion-key="brand">
                                                                                <a href="#" data-champion-id="63" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Brand</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="braum" data-champion-key="braum">
                                                                                <a href="#" data-champion-id="201" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Braum</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="caitlyn" data-champion-key="caitlyn">
                                                                                <a href="#" data-champion-id="51" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Caitlyn</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="camille" data-champion-key="camille">
                                                                                <a href="#" data-champion-id="164" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Camille</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="cassiopeia" data-champion-key="cassiopeia">
                                                                                <a href="#" data-champion-id="69" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Cassiopeia</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="cho&#039;gath" data-champion-key="chogath">
                                                                                <a href="#" data-champion-id="31" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Cho&#039;Gath</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="corki" data-champion-key="corki">
                                                                                <a href="#" data-champion-id="42" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Corki</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="darius" data-champion-key="darius">
                                                                                <a href="#" data-champion-id="122" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Darius</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="diana" data-champion-key="diana">
                                                                                <a href="#" data-champion-id="131" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Diana</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="dr.mundo" data-champion-key="drmundo">
                                                                                <a href="#" data-champion-id="36" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Dr. Mundo</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="draven" data-champion-key="draven">
                                                                                <a href="#" data-champion-id="119" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Draven</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="ekko" data-champion-key="ekko">
                                                                                <a href="#" data-champion-id="245" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Ekko</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="elise" data-champion-key="elise">
                                                                                <a href="#" data-champion-id="60" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Elise</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="evelynn" data-champion-key="evelynn">
                                                                                <a href="#" data-champion-id="28" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Evelynn</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="ezreal" data-champion-key="ezreal">
                                                                                <a href="#" data-champion-id="81" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Ezreal</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="fiddlesticks" data-champion-key="fiddlesticks">
                                                                                <a href="#" data-champion-id="9" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Fiddlesticks</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="fiora" data-champion-key="fiora">
                                                                                <a href="#" data-champion-id="114" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Fiora</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="fizz" data-champion-key="fizz">
                                                                                <a href="#" data-champion-id="105" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Fizz</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="galio" data-champion-key="galio">
                                                                                <a href="#" data-champion-id="3" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Galio</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="gangplank" data-champion-key="gangplank">
                                                                                <a href="#" data-champion-id="41" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Gangplank</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="garen" data-champion-key="garen">
                                                                                <a href="#" data-champion-id="86" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Garen</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="gnar" data-champion-key="gnar">
                                                                                <a href="#" data-champion-id="150" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Gnar</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="gragas" data-champion-key="gragas">
                                                                                <a href="#" data-champion-id="79" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Gragas</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="graves" data-champion-key="graves">
                                                                                <a href="#" data-champion-id="104" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Graves</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="hecarim" data-champion-key="hecarim">
                                                                                <a href="#" data-champion-id="120" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Hecarim</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="heimerdinger" data-champion-key="heimerdinger">
                                                                                <a href="#" data-champion-id="74" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Heimerdinger</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="illaoi" data-champion-key="illaoi">
                                                                                <a href="#" data-champion-id="420" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Illaoi</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="irelia" data-champion-key="irelia">
                                                                                <a href="#" data-champion-id="39" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Irelia</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="ivern" data-champion-key="ivern">
                                                                                <a href="#" data-champion-id="427" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Ivern</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="janna" data-champion-key="janna">
                                                                                <a href="#" data-champion-id="40" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Janna</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="jarvaniv" data-champion-key="jarvaniv">
                                                                                <a href="#" data-champion-id="59" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Jarvan IV</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="jax" data-champion-key="jax">
                                                                                <a href="#" data-champion-id="24" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Jax</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="jayce" data-champion-key="jayce">
                                                                                <a href="#" data-champion-id="126" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Jayce</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="jhin" data-champion-key="jhin">
                                                                                <a href="#" data-champion-id="202" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Jhin</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="jinx" data-champion-key="jinx">
                                                                                <a href="#" data-champion-id="222" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Jinx</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="kalista" data-champion-key="kalista">
                                                                                <a href="#" data-champion-id="429" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Kalista</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="karma" data-champion-key="karma">
                                                                                <a href="#" data-champion-id="43" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Karma</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="karthus" data-champion-key="karthus">
                                                                                <a href="#" data-champion-id="30" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Karthus</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="kassadin" data-champion-key="kassadin">
                                                                                <a href="#" data-champion-id="38" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Kassadin</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="katarina" data-champion-key="katarina">
                                                                                <a href="#" data-champion-id="55" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Katarina</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="kayle" data-champion-key="kayle">
                                                                                <a href="#" data-champion-id="10" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Kayle</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="kennen" data-champion-key="kennen">
                                                                                <a href="#" data-champion-id="85" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Kennen</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="kha&#039;zix" data-champion-key="khazix">
                                                                                <a href="#" data-champion-id="121" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Kha&#039;Zix</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="kindred" data-champion-key="kindred">
                                                                                <a href="#" data-champion-id="203" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Kindred</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="kled" data-champion-key="kled">
                                                                                <a href="#" data-champion-id="240" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Kled</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="kog&#039;maw" data-champion-key="kogmaw">
                                                                                <a href="#" data-champion-id="96" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Kog&#039;Maw</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="leblanc" data-champion-key="leblanc">
                                                                                <a href="#" data-champion-id="7" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">LeBlanc</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="leesin" data-champion-key="leesin">
                                                                                <a href="#" data-champion-id="64" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Lee Sin</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="leona" data-champion-key="leona">
                                                                                <a href="#" data-champion-id="89" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Leona</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="lissandra" data-champion-key="lissandra">
                                                                                <a href="#" data-champion-id="127" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Lissandra</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="lucian" data-champion-key="lucian">
                                                                                <a href="#" data-champion-id="236" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Lucian</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="lulu" data-champion-key="lulu">
                                                                                <a href="#" data-champion-id="117" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Lulu</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="lux" data-champion-key="lux">
                                                                                <a href="#" data-champion-id="99" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Lux</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="malphite" data-champion-key="malphite">
                                                                                <a href="#" data-champion-id="54" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Malphite</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="malzahar" data-champion-key="malzahar">
                                                                                <a href="#" data-champion-id="90" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Malzahar</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="maokai" data-champion-key="maokai">
                                                                                <a href="#" data-champion-id="57" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Maokai</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="masteryi" data-champion-key="masteryi">
                                                                                <a href="#" data-champion-id="11" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Master Yi</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="missfortune" data-champion-key="missfortune">
                                                                                <a href="#" data-champion-id="21" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Miss Fortune</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="mordekaiser" data-champion-key="mordekaiser">
                                                                                <a href="#" data-champion-id="82" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Mordekaiser</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="morgana" data-champion-key="morgana">
                                                                                <a href="#" data-champion-id="25" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Morgana</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="nami" data-champion-key="nami">
                                                                                <a href="#" data-champion-id="267" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Nami</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="nasus" data-champion-key="nasus">
                                                                                <a href="#" data-champion-id="75" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Nasus</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="nautilus" data-champion-key="nautilus">
                                                                                <a href="#" data-champion-id="111" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Nautilus</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="nidalee" data-champion-key="nidalee">
                                                                                <a href="#" data-champion-id="76" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Nidalee</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="nocturne" data-champion-key="nocturne">
                                                                                <a href="#" data-champion-id="56" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Nocturne</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="nunu" data-champion-key="nunu">
                                                                                <a href="#" data-champion-id="20" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Nunu</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="olaf" data-champion-key="olaf">
                                                                                <a href="#" data-champion-id="2" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Olaf</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="orianna" data-champion-key="orianna">
                                                                                <a href="#" data-champion-id="61" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Orianna</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="pantheon" data-champion-key="pantheon">
                                                                                <a href="#" data-champion-id="80" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Pantheon</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="poppy" data-champion-key="poppy">
                                                                                <a href="#" data-champion-id="78" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Poppy</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="quinn" data-champion-key="quinn">
                                                                                <a href="#" data-champion-id="133" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Quinn</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="rakan" data-champion-key="rakan">
                                                                                <a href="#" data-champion-id="497" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Rakan</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="rammus" data-champion-key="rammus">
                                                                                <a href="#" data-champion-id="33" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Rammus</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="rek&#039;sai" data-champion-key="reksai">
                                                                                <a href="#" data-champion-id="421" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Rek&#039;Sai</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="renekton" data-champion-key="renekton">
                                                                                <a href="#" data-champion-id="58" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Renekton</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="rengar" data-champion-key="rengar">
                                                                                <a href="#" data-champion-id="107" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Rengar</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="riven" data-champion-key="riven">
                                                                                <a href="#" data-champion-id="92" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Riven</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="rumble" data-champion-key="rumble">
                                                                                <a href="#" data-champion-id="68" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Rumble</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="ryze" data-champion-key="ryze">
                                                                                <a href="#" data-champion-id="13" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Ryze</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="sejuani" data-champion-key="sejuani">
                                                                                <a href="#" data-champion-id="113" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Sejuani</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="shaco" data-champion-key="shaco">
                                                                                <a href="#" data-champion-id="35" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Shaco</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="shen" data-champion-key="shen">
                                                                                <a href="#" data-champion-id="98" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Shen</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="shyvana" data-champion-key="shyvana">
                                                                                <a href="#" data-champion-id="102" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Shyvana</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="singed" data-champion-key="singed">
                                                                                <a href="#" data-champion-id="27" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Singed</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="sion" data-champion-key="sion">
                                                                                <a href="#" data-champion-id="14" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Sion</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="sivir" data-champion-key="sivir">
                                                                                <a href="#" data-champion-id="15" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Sivir</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="skarner" data-champion-key="skarner">
                                                                                <a href="#" data-champion-id="72" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Skarner</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="sona" data-champion-key="sona">
                                                                                <a href="#" data-champion-id="37" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Sona</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="soraka" data-champion-key="soraka">
                                                                                <a href="#" data-champion-id="16" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Soraka</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="swain" data-champion-key="swain">
                                                                                <a href="#" data-champion-id="50" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Swain</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="syndra" data-champion-key="syndra">
                                                                                <a href="#" data-champion-id="134" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Syndra</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="tahmkench" data-champion-key="tahmkench">
                                                                                <a href="#" data-champion-id="223" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Tahm Kench</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="taliyah" data-champion-key="taliyah">
                                                                                <a href="#" data-champion-id="163" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Taliyah</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="talon" data-champion-key="talon">
                                                                                <a href="#" data-champion-id="91" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Talon</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="taric" data-champion-key="taric">
                                                                                <a href="#" data-champion-id="44" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Taric</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="teemo" data-champion-key="teemo">
                                                                                <a href="#" data-champion-id="17" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Teemo</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="thresh" data-champion-key="thresh">
                                                                                <a href="#" data-champion-id="412" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Thresh</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="tristana" data-champion-key="tristana">
                                                                                <a href="#" data-champion-id="18" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Tristana</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="trundle" data-champion-key="trundle">
                                                                                <a href="#" data-champion-id="48" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Trundle</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="tryndamere" data-champion-key="tryndamere">
                                                                                <a href="#" data-champion-id="23" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Tryndamere</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="twistedfate" data-champion-key="twistedfate">
                                                                                <a href="#" data-champion-id="4" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Twisted Fate</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="twitch" data-champion-key="twitch">
                                                                                <a href="#" data-champion-id="29" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Twitch</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="udyr" data-champion-key="udyr">
                                                                                <a href="#" data-champion-id="77" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Udyr</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="urgot" data-champion-key="urgot">
                                                                                <a href="#" data-champion-id="6" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Urgot</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="varus" data-champion-key="varus">
                                                                                <a href="#" data-champion-id="110" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Varus</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="vayne" data-champion-key="vayne">
                                                                                <a href="#" data-champion-id="67" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Vayne</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="veigar" data-champion-key="veigar">
                                                                                <a href="#" data-champion-id="45" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Veigar</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="vel&#039;koz" data-champion-key="velkoz">
                                                                                <a href="#" data-champion-id="161" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Vel&#039;Koz</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="vi" data-champion-key="vi">
                                                                                <a href="#" data-champion-id="254" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Vi</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="viktor" data-champion-key="viktor">
                                                                                <a href="#" data-champion-id="112" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Viktor</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="vladimir" data-champion-key="vladimir">
                                                                                <a href="#" data-champion-id="8" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Vladimir</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="volibear" data-champion-key="volibear">
                                                                                <a href="#" data-champion-id="106" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Volibear</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="warwick" data-champion-key="warwick">
                                                                                <a href="#" data-champion-id="19" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Warwick</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="wukong" data-champion-key="monkeyking">
                                                                                <a href="#" data-champion-id="62" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Wukong</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="xayah" data-champion-key="xayah">
                                                                                <a href="#" data-champion-id="498" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Xayah</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="xerath" data-champion-key="xerath">
                                                                                <a href="#" data-champion-id="101" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Xerath</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="xinzhao" data-champion-key="xinzhao">
                                                                                <a href="#" data-champion-id="5" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Xin Zhao</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="yasuo" data-champion-key="yasuo">
                                                                                <a href="#" data-champion-id="157" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Yasuo</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="yorick" data-champion-key="yorick">
                                                                                <a href="#" data-champion-id="83" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Yorick</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="zac" data-champion-key="zac">
                                                                                <a href="#" data-champion-id="154" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Zac</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="zed" data-champion-key="zed">
                                                                                <a href="#" data-champion-id="238" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Zed</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="ziggs" data-champion-key="ziggs">
                                                                                <a href="#" data-champion-id="115" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Ziggs</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="zilean" data-champion-key="zilean">
                                                                                <a href="#" data-champion-id="26" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Zilean</a>
                                                                            </li>
                                                                            <li class="Item" data-champion-name="zyra" data-champion-key="zyra">
                                                                                <a href="#" data-champion-id="143" onclick="$.OP.GG.matches.list.changeChampion($(this).data('champion-id'), $(this)); return false;" class="Link">Zyra</a>
                                                                            </li>
                                                                            <div class="ChampionNotFound" style="display: none;">
                                                                                <div class="ErrorMessage">
                                                                                    That Champion doesn't appear to exist!											</div>
                                                                            </div>
                                                                        </ul>
                                                                    </div>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>--%>
                                        </div>
                                    </div>
                                    <div class="Content">
                                        <script>
                                            /* $(function(){
                                             $.OP.GG.matches.graph.winRatioPieChart('WinRatioGraph-summary', 6, 14);
                                             });*/
                                            $(function () {
                                                var winrate = echarts.init(document.getElementById("WinRatioGraph-summary"));
                                                option = {
                                                    /*title : {
                                                     text : 'wins and losses in recent 20 games'
                                                     },*/
                                                    tooltip : {
                                                        trigger: 'item',
                                                        formatter: "{a} <br/>{b} : {c} ({d}%)"
                                                    },
                                                    legend: {
                                                        orient: 'horizontal',
                                                        x:'center',
                                                        y:'top',
                                                        data:['胜','负']
                                                    },
                                                    series : [
                                                        {
                                                            name: '游戏场次',
                                                            type: 'pie',
                                                            radius : ['30%', '70%'],
                                                            center: ['50%', '60%'],
                                                            data:[
                                                                {value:${requestScope.sl.league.wins}, name:'胜'},
                                                                {value:${requestScope.sl.league.losses}, name:'负'}
                                                            ],
                                                            itemStyle: {
                                                                normal: {
                                                                    color: function(params) {
                                                                        var colorList = [
                                                                            '#1f8ecd','#ee5a52'
                                                                        ];
                                                                        return colorList[params.dataIndex]
                                                                    }
                                                                },
                                                                emphasis: {
                                                                    shadowBlur: 10,
                                                                    shadowOffsetX: 0,
                                                                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                                                                }
                                                            },
                                                            label: {
                                                                normal: {
                                                                    show: false,
                                                                    position: 'outside'
                                                                },
                                                                emphasis: {
                                                                    show: false
                                                                }
                                                            },
                                                            labelLine: {
                                                                normal: {
                                                                    show: false
                                                                },
                                                                emphasis: {
                                                                    show: false
                                                                }
                                                            },
                                                        }
                                                    ]
                                                };
                                                winrate.setOption(option);
                                            })
                                        </script>
                                        <div class="GameAverageStatsBox" id="GameAverageStatsBox-summary">
                                            <div class="Box">
                                                <table class="GameAverageStats">
                                                    <tr>
                                                        <td class="Title" colspan="2">
                                                            <%--<div class="WinRatioTitle">
                                                                <span class="total">20 </span>Games
                                                                <span class="win">6 </span>W
                                                                <span class="lose">14 </span>L
                                                            </div>--%>
                                                        </td>
                                                        <%--<td class="MostChampion" rowspan="2">
                                                            <ul>
                                                                <li>
                                                                    <div class="NotFound">
                                                                        <div class="Image">
                                                                            <i class='__spSite __spSite-176'></i>
                                                                        </div>
                                                                        <div class="Message">Not found Champion</div>
                                                                    </div>
                                                                    <div class="Content" style="display: none;">
                                                                        <div class="Image">
                                                                            <img src="" alt="">
                                                                        </div>
                                                                        <div class="Name"></div>
                                                                        <div class="WonLose">
                                                                            <b class="red tip" title="Win Ratio">70%</b> (<span class="win">2</span>W <span class="lose">2</span>L)
                                                                        </div>
                                                                        <div class="KDA"><span>2.12</span> KDA</div>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div class="NotFound">
                                                                        <div class="Image">
                                                                            <i class='__spSite __spSite-176'></i>
                                                                        </div>
                                                                        <div class="Message">Not found Champion</div>
                                                                    </div>
                                                                    <div class="Content" style="display: none;">
                                                                        <div class="Image">
                                                                            <img src="" alt="">
                                                                        </div>
                                                                        <div class="Name"></div>
                                                                        <div class="WonLose">
                                                                            <b class="red tip" title="Win Ratio">70%</b> (<span class="win">2</span>W <span class="lose">2</span>L)
                                                                        </div>
                                                                        <div class="KDA"><span>2.12</span> KDA</div>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div class="NotFound">
                                                                        <div class="Image">
                                                                            <i class='__spSite __spSite-176'></i>
                                                                        </div>
                                                                        <div class="Message">Not found Champion</div>
                                                                    </div>
                                                                    <div class="Content" style="display: none;">
                                                                        <div class="Image">
                                                                            <img src="" alt="">
                                                                        </div>
                                                                        <div class="Name"></div>
                                                                        <div class="WonLose">
                                                                            <b class="red tip" title="Win Ratio">70%</b> (<span class="win">2</span>W <span class="lose">2</span>L)
                                                                        </div>
                                                                        <div class="KDA"><span>2.12</span> KDA</div>
                                                                    </div>
                                                                </li>
                                                            </ul>
                                                        </td>
                                                        <td class="Title">Preferred Position (Rank)</td>--%>
                                                    </tr>
                                                    <tr>
                                                        <td class="Summary">
                                                            <div class="WinRatioGraph">
                                                                <div id="WinRatioGraph-summary" class="Graph" style="width: 170px;height: 120px;"></div>
                                                                <!-- <div class="Text">30%</div>-->
                                                            </div>
                                                        </td>
                                                        <td class="KDA">
                                                            <%--<div class="KDA">
                                                                <span class="Kill">5.6</span> /
                                                                <span class="Death">6.0</span> /
                                                                <span class="Assist">6.5</span>
                                                            </div>--%>
                                                            <div class="KDARatio">
                                                                <%--<span class="KDARatio">2.02:1</span>--%>
                                                                <span class="CKRate tip" title="胜率">(<span><c:if test="${!winrate.equals('--')}">
                                                                    <fmt:formatNumber value="${winrate}" type="percent"/>
                                                                </c:if>
                  <c:if test="${winrate.equals('--')}">
                      ----
                  </c:if></span>)</span>
                                                            </div>
                                                        </td>
                                                        <%--<td class="PositionStats">
                                                            <ul class="Content" style="display: none;">
                                                                <li style="display: none;">
                                                                    <div class="Image">
                                                                        <i></i>
                                                                    </div>
                                                                    <div class="PositionStatContent">
                                                                        <div class="Name">?</div>
                                                                        <span class="RoleRate"><b>?</b>%</span> <span class="WinRatio">Win Ratio										<span><b>?</b>%</span></span>
                                                                    </div>
                                                                </li>
                                                                <li style="display: none;">
                                                                    <div class="Image">
                                                                        <i></i>
                                                                    </div>
                                                                    <div class="PositionStatContent">
                                                                        <div class="Name">?</div>
                                                                        <span class="RoleRate"><b>?</b>%</span> <span class="WinRatio">Win Ratio										<span><b>?</b>%</span></span>
                                                                    </div>
                                                                </li>
                                                                <li style="display: none;">
                                                                    <div class="Image">
                                                                        <i></i>
                                                                    </div>
                                                                    <div class="PositionStatContent">
                                                                        <div class="Name">?</div>
                                                                        <span class="RoleRate"><b>?</b>%</span> <span class="WinRatio">Win Ratio										<span><b>?</b>%</span></span>
                                                                    </div>
                                                                </li>
                                                            </ul>
                                                            <ul class="NotFound">
                                                                <li>
                                                                    <div class="Image">
                                                                        <i class='__spSite __spSite-239'></i>
                                                                    </div>
                                                                    <div class="PositionStatContent">
                                                                        <div class="Message">Not found Position</div>
                                                                    </div>
                                                                </li>
                                                            </ul>
                                                        </td>--%>
                                                    </tr>
                                                </table>
                                            </div>
                                            <div class="Message">
                                                Data analysis of recent <span>20</span> games
                                            </div>

                                        </div>
                                        <div class="GameItemList">

                                            <c:forEach items="${requestScope.matchList}" var="match">

                                                <div class="GameItemWrap">
                                                    <div class="GameItem <c:if test="${match.part.stats.win==true}">Win</c:if><c:if test="${match.part.stats.win==false}">Lose</c:if>  ">
                                                        <div class="Content">
                                                            <div class="GameStats">
                                                                <div class="GameType">${match.match.gameType}</div>
                                                                <div class="TimeStamp"><span class=' _timeago _timeCount' data-datetime='${match.reference.timestamp}' data-type='' data-interval='60'></span></div>
                                                                <div class="Bar"></div>
                                                                <div class="GameResult">
                                                                        ${match.part.stats.win?"胜利":"失败"}
                                                                </div>
                                                                <div class="GameLength">
                                                                        <%-- ${match.match.gameDuration / 3600} h--%>
                                                                        <%--  ${(match.match.gameDuration % 3600) / 60} m
                                                                          ${((match.match.gameDuration % 3600) % 60) } s--%>
                                                                            <fmt:formatNumber type='number' value='${match.match.gameDuration / 60}' maxFractionDigits="0"/>
                                                                         分钟
                                                                </div>

                                                            </div>
                                                            <div class="GameSettingInfo">
                                                                <div class="ChampionImage">
                                                                    <a href="/champion/graves/statistics" target="_blank"><img src="http://ddragon.leagueoflegends.com/cdn/7.9.2/img/champion/${match.champion.key}.png" class="Image" alt="${match.champion.key}"></a>
                                                                </div>

                                                                <div class="SummonerSpell">
                                                                    <div class="Spell">
                                                                        <img src="http://ddragon.leagueoflegends.com/cdn/7.9.2/img/spell/${match.spell1.key}.png" class="Image tip" title="&lt;b style=&#039;color: #ffc659&#039;&gt;${match.spell1.name}&lt;/b&gt;&lt;br&gt;&lt;span&gt;${match.spell1.description}&lt;/span&gt;" alt="${match.spell1.name}">
                                                                    </div>
                                                                    <div class="Spell">
                                                                        <img src="http://ddragon.leagueoflegends.com/cdn/7.9.2/img/spell/${match.spell2.key}.png" class="Image tip" title="&lt;b style=&#039;color: #ffc659&#039;&gt;${match.spell2.name}&lt;/b&gt;&lt;br&gt;&lt;span&gt;${match.spell2.description}&lt;/span&gt;" alt="${match.spell2.name}">
                                                                    </div>
                                                                </div>
                                                                <div class="KeystoneMastery">
                                                                    <div class="Mastery">
                                                                        <img src="http://ddragon.leagueoflegends.com/cdn/7.9.2/img/mastery/${match.keystone.id}.png" class="Image tip"
                                                                             title="&lt;b style=&#039;color: #ffc659&#039;&gt;${match.keystone.name}&lt;/b&gt;&lt;br&gt;&lt;span&gt;${match.keystone.description}&lt;/span&gt;" alt="${match.keystone.name}">
                                                                    </div>
                                                                </div>
                                                                <div class="ChampionName">
                                                                    <a href="/champion/graves/statistics" target="_blank">${match.champion.name}</a>
                                                                </div>
                                                            </div>
                                                            <div class="KDA">
                                                                <div class="KDA">
                                                                    <span class="Kill">${match.part.stats.kills}</span> /
                                                                    <span class="Death">${match.part.stats.deaths}</span> /
                                                                    <span class="Assist">${match.part.stats.assists}</span>
                                                                </div>
                                                                <div class="KDARatio">
                                                                    <span class="KDARatio ">  <fmt:formatNumber type='number' value='${(match.part.stats.kills + match.part.stats.deaths) / (match.part.stats.assists>0?match.part.stats.assists+0.0:1.0)}' maxFractionDigits="2"/> : 1</span>
                                                                    KDA
                                                                </div>
                                                            </div>
                                                            <div class="Stats">
                                                                <div class="Level">
                                                                    等级 ${match.part.stats.champLevel}
                                                                </div>
                                                                <div class="CS">
                                                                    <span class="CS tip" title="小兵数 ${match.part.stats.totalMinionsKilled}  + 中立生物数 ${match.part.stats.neutralMinionsKilled}&lt;br&gt;每分钟补兵数: <fmt:formatNumber value="${(match.part.stats.totalMinionsKilled+match.part.stats.neutralMinionsKilled) / (match.match.gameDuration / 60)}" maxFractionDigits="1"  /> ">${match.part.stats.totalMinionsKilled+match.part.stats.neutralMinionsKilled} (<fmt:formatNumber value="${(match.part.stats.totalMinionsKilled+match.part.stats.neutralMinionsKilled) / (match.match.gameDuration / 60)}" maxFractionDigits="1"  /> )</span> 补兵
                                                                </div>
                                                                <div class="Ward">
                                                                    <span class='wards vision'>${match.part.stats.visionWardsBoughtInGame}</span> 真视守卫
                                                                </div>
                                                                    <%-- <div class="CKRate tip" title="Kill Participation">
                                                                         P/Kill ${(match.part.stats.kills + match.part.stats.assists) / match.teamKills[0]}
                                                                     </div>--%>
                                                            </div>
                                                            <div class="Items">
                                                                <c:choose>
                                                                    <c:when test="${match.item0!=null}">
                                                                        <div class="Item">
                                                                            <img src="http://ddragon.leagueoflegends.com/cdn/7.9.2/img/item/${match.item0.id}.png " class="Image tip" title="&lt;b style=&#039;color: #00cfbc&#039;&gt;${match.item0.name}&lt;/b&gt;&lt;br&gt;&lt;span&gt;${match.item0.plaintext}&lt;/span&gt;&lt;br&gt;&lt;span&gt;&lt;stats&gt;${match.item0.description}&lt;/stats&gt;&lt;/span&gt;&lt;br&gt;&lt;span&gt;Cost:&lt;/span&gt; &lt;span style=&#039;color: #ffc659&#039;&gt;${match.item0.gold.total} (${match.item0.gold.base})&lt;/span&gt;" alt="${match.item0.name}">
                                                                        </div>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <div class="Item">
                                                                            <div class="Image NoItem"></div>
                                                                        </div>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                                <c:choose>
                                                                    <c:when test="${match.item1!=null}">
                                                                        <div class="Item">
                                                                            <img src="http://ddragon.leagueoflegends.com/cdn/7.9.2/img/item/${match.item1.id}.png " class="Image tip" title="&lt;b style=&#039;color: #00cfbc&#039;&gt;${match.item1.name}&lt;/b&gt;&lt;br&gt;&lt;span&gt;${match.item1.plaintext}&lt;/span&gt;&lt;br&gt;&lt;span&gt;&lt;stats&gt;${match.item1.description}&lt;/stats&gt;&lt;/span&gt;&lt;br&gt;&lt;span&gt;Cost:&lt;/span&gt; &lt;span style=&#039;color: #ffc659&#039;&gt;${match.item1.gold.total} (${match.item1.gold.base})&lt;/span&gt;" alt="${match.item1.name}">
                                                                        </div>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <div class="Item">
                                                                            <div class="Image NoItem"></div>
                                                                        </div>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                                <c:choose>
                                                                    <c:when test="${match.item2!=null}">
                                                                        <div class="Item">
                                                                            <img src="http://ddragon.leagueoflegends.com/cdn/7.9.2/img/item/${match.item2.id}.png " class="Image tip" title="&lt;b style=&#039;color: #00cfbc&#039;&gt;${match.item2.name}&lt;/b&gt;&lt;br&gt;&lt;span&gt;${match.item2.plaintext}&lt;/span&gt;&lt;br&gt;&lt;span&gt;&lt;stats&gt;${match.item2.description}&lt;/stats&gt;&lt;/span&gt;&lt;br&gt;&lt;span&gt;Cost:&lt;/span&gt; &lt;span style=&#039;color: #ffc659&#039;&gt;${match.item2.gold.total} (${match.item2.gold.base})&lt;/span&gt;" alt="${match.item2.name}">
                                                                        </div>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <div class="Item">
                                                                            <div class="Image NoItem"></div>
                                                                        </div>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                                <c:choose>
                                                                    <c:when test="${match.item3!=null}">
                                                                        <div class="Item">
                                                                            <img src="http://ddragon.leagueoflegends.com/cdn/7.9.2/img/item/${match.item3.id}.png " class="Image tip" title="&lt;b style=&#039;color: #00cfbc&#039;&gt;${match.item3.name}&lt;/b&gt;&lt;br&gt;&lt;span&gt;${match.item3.plaintext}&lt;/span&gt;&lt;br&gt;&lt;span&gt;&lt;stats&gt;${match.item3.description}&lt;/stats&gt;&lt;/span&gt;&lt;br&gt;&lt;span&gt;Cost:&lt;/span&gt; &lt;span style=&#039;color: #ffc659&#039;&gt;${match.item3.gold.total} (${match.item3.gold.base})&lt;/span&gt;" alt="${match.item3.name}">
                                                                        </div>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <div class="Item">
                                                                            <div class="Image NoItem"></div>
                                                                        </div>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                                <c:choose>
                                                                    <c:when test="${match.item4!=null}">
                                                                        <div class="Item">
                                                                            <img src="http://ddragon.leagueoflegends.com/cdn/7.9.2/img/item/${match.item4.id}.png " class="Image tip" title="&lt;b style=&#039;color: #00cfbc&#039;&gt;${match.item4.name}&lt;/b&gt;&lt;br&gt;&lt;span&gt;${match.item4.plaintext}&lt;/span&gt;&lt;br&gt;&lt;span&gt;&lt;stats&gt;${match.item4.description}&lt;/stats&gt;&lt;/span&gt;&lt;br&gt;&lt;span&gt;Cost:&lt;/span&gt; &lt;span style=&#039;color: #ffc659&#039;&gt;${match.item4.gold.total} (${match.item4.gold.base})&lt;/span&gt;" alt="${match.item4.name}">
                                                                        </div>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <div class="Item">
                                                                            <div class="Image NoItem"></div>
                                                                        </div>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                                <c:choose>
                                                                    <c:when test="${match.item5!=null}">
                                                                        <div class="Item">
                                                                            <img src="http://ddragon.leagueoflegends.com/cdn/7.9.2/img/item/${match.item5.id}.png " class="Image tip" title="&lt;b style=&#039;color: #00cfbc&#039;&gt;${match.item5.name}&lt;/b&gt;&lt;br&gt;&lt;span&gt;${match.item5.plaintext}&lt;/span&gt;&lt;br&gt;&lt;span&gt;&lt;stats&gt;${match.item5.description}&lt;/stats&gt;&lt;/span&gt;&lt;br&gt;&lt;span&gt;Cost:&lt;/span&gt; &lt;span style=&#039;color: #ffc659&#039;&gt;${match.item5.gold.total} (${match.item5.gold.base})&lt;/span&gt;" alt="${match.item5.name}">
                                                                        </div>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <div class="Item">
                                                                            <div class="Image NoItem"></div>
                                                                        </div>
                                                                    </c:otherwise>
                                                                </c:choose>

                                                            </div>
                                                            <div class="TrinketWithItem">

                                                                <c:choose>
                                                                    <c:when test="${match.item6!=null}">
                                                                        <div class="Item">
                                                                            <img src="http://ddragon.leagueoflegends.com/cdn/7.9.2/img/item/${match.item6.id}.png " class="Image tip" title="&lt;b style=&#039;color: #00cfbc&#039;&gt;${match.item6.name}&lt;/b&gt;&lt;br&gt;&lt;span&gt;${match.item6.plaintext}&lt;/span&gt;&lt;br&gt;&lt;span&gt;&lt;stats&gt;${match.item6.description}&lt;/stats&gt;&lt;/span&gt;&lt;br&gt;&lt;span&gt;Cost:&lt;/span&gt; &lt;span style=&#039;color: #ffc659&#039;&gt;${match.item6.gold.total} (${match.item6.gold.base})&lt;/span&gt;" alt="${match.item6.name}">
                                                                        </div>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <div class="Item">
                                                                            <div class="Image NoItem"></div>
                                                                        </div>
                                                                    </c:otherwise>
                                                                </c:choose>

                                                               <%-- <button class="Button" onclick="$.OP.GG.matches.openBuild(2809578677, 27971322, $(this).closest('.GameItem')); return false;">
                                                                    <i class="__spSite __spSite-161 Off"></i>
                                                                    <i class="__spSite __spSite-162 On"></i>
                                                                </button>--%>
                                                            </div>
                                                                <%-- <div class="FollowPlayers">
                                                                     <div class="Team">
                                                                         <div class="Summoner ">
                                                                             <div class="ChampionImage">
                                                                                 <div class="Image __sprite __spc16 __spc16-119 tip" title="Gragas">Gragas</div>
                                                                             </div>
                                                                             <div class="SummonerName">
                                                                                 <a href="/summoner.jsp/www.op.gg/summoner/userName=lftmove" class="Link" target='_blank'>LFT Move</a>
                                                                             </div>
                                                                         </div>
                                                                         <div class="Summoner Requester">
                                                                             <div class="ChampionImage">
                                                                                 <div class="Image __sprite __spc16 __spc16-125 tip" title="Graves">Graves</div>
                                                                             </div>
                                                                             <div class="SummonerName">
                                                                                 <a href="/summoner.jsp/www.op.gg/summoner/userName=sktt1peanut" class="Link" target='_blank'>SKT T1 Peanut</a>
                                                                             </div>
                                                                         </div>
                                                                         <div class="Summoner ">
                                                                             <div class="ChampionImage">
                                                                                 <div class="Image __sprite __spc16 __spc16-82 tip" title="Karma">Karma</div>
                                                                             </div>
                                                                             <div class="SummonerName">
                                                                                 <a href="/summoner.jsp/www.op.gg/summoner/userName=boroona" class="Link" target='_blank'>BoRoona</a>
                                                                             </div>
                                                                         </div>
                                                                         <div class="Summoner ">
                                                                             <div class="ChampionImage">
                                                                                 <div class="Image __sprite __spc16 __spc16-45 tip" title="Ashe">Ashe</div>
                                                                             </div>
                                                                             <div class="SummonerName">
                                                                                 <a href="/summoner.jsp/www.op.gg/summoner/userName=%EC%8A%B9%ED%8C%A8%EC%83%81%EA%B4%80%EC%97%86%EB%8A%94%EC%82%AC%EB%9E%8C" class="Link" target='_blank'>승패상관없는사람</a>
                                                                             </div>
                                                                         </div>
                                                                         <div class="Summoner ">
                                                                             <div class="ChampionImage">
                                                                                 <div class="Image __sprite __spc16 __spc16-43 tip" title="Nunu">Nunu</div>
                                                                             </div>
                                                                             <div class="SummonerName">
                                                                                 <a href="/summoner.jsp/www.op.gg/summoner/userName=%EB%81%84%EC%9C%BC%EB%9F%AC%EC%89%AC" class="Link" target='_blank'>끄으러쉬</a>
                                                                             </div>
                                                                         </div>
                                                                     </div>
                                                                     <div class="Team">
                                                                         <div class="Summoner ">
                                                                             <div class="ChampionImage">
                                                                                 <div class="Image __sprite __spc16 __spc16-27 tip" title="Kled">Kled</div>
                                                                             </div>
                                                                             <div class="SummonerName">
                                                                                 <a href="/summoner.jsp/www.op.gg/summoner/userName=toam" class="Link" target='_blank'>TOAM</a>
                                                                             </div>
                                                                         </div>
                                                                         <div class="Summoner ">
                                                                             <div class="ChampionImage">
                                                                                 <div class="Image __sprite __spc16 __spc16-4 tip" title="Sejuani">Sejuani</div>
                                                                             </div>
                                                                             <div class="SummonerName">
                                                                                 <a href="/summoner.jsp/www.op.gg/summoner/userName=sonofbengi" class="Link" target='_blank'>Son of Bengi</a>
                                                                             </div>
                                                                         </div>
                                                                         <div class="Summoner ">
                                                                             <div class="ChampionImage">
                                                                                 <div class="Image __sprite __spc16 __spc16-100 tip" title="Taliyah">Taliyah</div>
                                                                             </div>
                                                                             <div class="SummonerName">
                                                                                 <a href="/summoner.jsp/www.op.gg/summoner/userName=bl%EB%94%94%EB%94%94" class="Link" target='_blank'>Bl디디</a>
                                                                             </div>
                                                                         </div>
                                                                         <div class="Summoner ">
                                                                             <div class="ChampionImage">
                                                                                 <div class="Image __sprite __spc16 __spc16-91 tip" title="Caitlyn">Caitlyn</div>
                                                                             </div>
                                                                             <div class="SummonerName">
                                                                                 <a href="/summoner.jsp/www.op.gg/summoner/userName=ssg%EB%A9%94%EB%A5%B4%EC%8B%9C" class="Link" target='_blank'>SSG 메르시</a>
                                                                             </div>
                                                                         </div>
                                                                         <div class="Summoner ">
                                                                             <div class="ChampionImage">
                                                                                 <div class="Image __sprite __spc16 __spc16-85 tip" title="Trundle">Trundle</div>
                                                                             </div>
                                                                             <div class="SummonerName">
                                                                                 <a href="/summoner.jsp/www.op.gg/summoner/userName=suzack" class="Link" target='_blank'>Suzack</a>
                                                                             </div>
                                                                         </div>
                                                                     </div>
                                                                 </div>--%>
                                                            <%--<div class="StatsButton">
                                                                <div class="Content">
                                                                    <div class="Item">
                                                                        <a class="Button Replay" onclick="$.OP.GG.matches.openSpectate(2809578677); return false;">
                                                                            <span class="__spSite __spSite-257"></span></a>
                                                                    </div>
                                                                    <div class="Item">
                                                                        <a class="Button MatchDetail" onclick="$.OP.GG.matches.openDetail(2809578677, 27971322, $(this).closest('.GameItem')); return false;">
                                                                            <span class="__spSite __spSite-288 Off"></span>
                                                                            <span class="__spSite __spSite-287 On"></span>
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                            </div>--%>
                                                        </div>
                                                        <div class="GameDetail"></div>
                                                    </div>
                                                </div>

                                            </c:forEach>
                                        </div>
                                        <div class="GameMoreButton Box">
<%--
                                            <a href="#" onclick="$.OP.GG.matches.list.loadMore($(this)); return false;" class="Button">Show More</a>
--%>
                                        </div>
                                        <%--<script>
                                            var activeTabClassName = $(".SummonerLayout .MenuList .active").data("tab-show-class");
                                            var $gameListContainer = $(".SummonerLayoutContent." + activeTabClassName).find(".GameListContainer");
                                        </script>--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="champion" class="tabItem Content SummonerLayoutContent tab-pane summonerLayout-champions" data-tab-data-url="champion?summonerId=${requestScope.sl.summoner.id}" data-tab-spinner-height="800"></div>
                        <div id="league" class="tabItem Content SummonerLayoutContent tab-pane summonerLayout-league" data-tab-data-url="league?summonerId=${requestScope.sl.summoner.id}" data-tab-spinner-height="800"></div>
                        <div id="rune" class="tabItem Content SummonerLayoutContent tab-pane summonerLayout-rune" data-tab-data-url="rune?summonerId=${requestScope.sl.summoner.id}" data-tab-spinner-height="800"></div>
                        <div id="mastery" class="tabItem Content SummonerLayoutContent tab-pane summonerLayout-mastery" data-tab-data-url="mastery?region=${requestScope.sl.platform}&summonerId=${requestScope.sl.summoner.id}" data-tab-spinner-height="800"></div>
                        <%--    <div class="tabItem Content SummonerLayoutContent summonerLayout-spectator" data-tab-data-url="../spectator.html/" data-tab-spinner-height="800"></div>
                            <div class="tabItem Content SummonerLayoutContent summonerLayout-plus" data-tab-data-url="/summoner/plus/userName=SKT%20T1%20Peanut" data-tab-spinner-height="800"></div>--%>

                    </div>

                </div>
            </div>
        </div>
    </div>

    <jsp:include page="../footer.jsp"/>

</div>

</body>
</html>
