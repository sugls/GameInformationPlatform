<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: lsc
  Date: 2017/5/25
  Time: 19:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        .margin-top-50{
            margin-top: 50px;
        }
    </style>
</head>
<body>
<div class="LayoutWrap CurrentMenu-summoner">
    <jsp:include page="../header.jsp"/>

    <div class="container margin-top-50">



        <div class="panel panel-default">
            <div class="panel-heading">
                <nav class="navbar navbar-default">

                    <ul class="nav navbar-nav">
                            <li class="${'CHALLENGER'==requestScope.boardLeague.tier?'active':''}"><a href="${pageContext.request.contextPath}/leaderboard/challenger">最强王者</a></li>
                            <li class="${'MASTER'==requestScope.boardLeague.tier?'active':''}"><a href="${pageContext.request.contextPath}/leaderboard/master">超凡大师</a></li>
                        <input type="hidden" name="tier" value="${requestScope.boardLeague.tier}">
                            <%--<li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">queue <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">RANKED_SOLO_5x5</a></li>
                                    <li><a href="#">RANKED_FLEX_SR</a></li>
                                    <li><a href="#">RANKED_FLEX_TT</a></li>
                                </ul>
                            </li>--%>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">服务器 <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="${fn:toLowerCase(requestScope.boardLeague.tier)}?region=NA1">NA</a><li>
                                    <li><a href="${fn:toLowerCase(requestScope.boardLeague.tier)}?region=BR1">BR</a><li>
                                    <li><a href="${fn:toLowerCase(requestScope.boardLeague.tier)}?region=EUN1">EUNE</a><li>
                                    <li><a href="${fn:toLowerCase(requestScope.boardLeague.tier)}?region=EUW1">EUW</a><li>
                                    <li><a href="${fn:toLowerCase(requestScope.boardLeague.tier)}?region=LA1">LAN</a><li>
                                    <li><a href="${fn:toLowerCase(requestScope.boardLeague.tier)}?region=LA2">LAS</a><li>
                                    <li><a href="${fn:toLowerCase(requestScope.boardLeague.tier)}?region=OC1">OCE</a><li>
                                    <li><a href="${fn:toLowerCase(requestScope.boardLeague.tier)}?region=RU">RU</a><li>
                                    <li><a href="${fn:toLowerCase(requestScope.boardLeague.tier)}?region=TR1">TR</a><li>
                                    <li><a href="${fn:toLowerCase(requestScope.boardLeague.tier)}?region=JP1">JP</a><li>
                                    <li><a href="${fn:toLowerCase(requestScope.boardLeague.tier)}?region=KR">KR</a><li>
                                </ul>
                            </li>
                        </ul>

                </nav>
                <%--<span class="label label-default">Leaderboards:</span>--%>
                <span class="label label-primary">Region:${requestScope.region}</span>
                <span class="label label-success">${requestScope.boardLeague.tier}</span>
                <span class="label label-warning">${requestScope.boardLeague.name}</span>
                <span class="label label-info">Queue:${requestScope.boardLeague.queue}</span>
            </div>

            <table class="table">

                <thead>
                <tr>
                    <th>#</th>
                    <th>召唤师</th>
                    <th>符号标记</th>
                    <th>胜场/负场</th>
                    <th>胜点数</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${requestScope.boardLeague.entries}" var="league" varStatus="status">
                    <tr>
                        <td>${status.index+1}</td>
                        <td><a href="${pageContext.request.contextPath}/summoner/summary?region=${requestScope.region}&summonerId=${league.playerOrTeamId}">${league.playerOrTeamName}</a></td>
                        <td>
                            <i title="&lt;b style=&#039;color: #ffc659&#039;&gt;老兵&lt;/b&gt;&lt;br&gt;&lt;span&gt;你已在这个战区进行了超过100场比赛&lt;/span&gt;" class="tip fa fa-trophy" style="color: ${league.veteran?'#000':'#999'}"></i>
                            &nbsp;
                            <i class="fa fa-fire tip" title="&lt;b style=&#039;color: #ffc659&#039;&gt;连胜&lt;/b&gt;&lt;br&gt;&lt;span&gt;连续赢得3场以上的比赛&lt;/span&gt;" style="color: ${league.hotStreak?'#000':'#999'}"></i>
                            &nbsp;
                            <i class="fa fa-star tip" title="&lt;b style=&#039;color: #ffc659&#039;&gt;新兵&lt;/b&gt;&lt;br&gt;&lt;span&gt;近期加入这个战区&lt;/span&gt;" style="color: ${league.freshBlood?'#000':'#999'}"></i>
                            &nbsp;
                            <i class="fa fa-minus-circle tip" title="&lt;b style=&#039;color: #ffc659&#039;&gt;不活跃的&lt;/b&gt;&lt;br&gt;&lt;span&gt;不活跃的玩家&lt;/span&gt;" style="color: ${league.inactive?'#000':'#999'}"></i>
                        </td>
                        <td>
                            <div class="progress progress-bar-danger">
                                <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="${league.wins}" aria-valuemin="0" aria-valuemax="${league.wins+league.losses}" style="width: ${league.wins/(league.wins+league.losses)*100}%">
                                        ${league.wins}
                                </div>
                                    ${league.losses}
                            </div>
                            <fmt:formatNumber type="number" value="${league.wins/(league.wins+league.losses)*100}" pattern="0" maxFractionDigits="0"/>%
                        </td>
                        <td>
                                ${league.leaguePoints}
                        </td>
                    </tr>
                </c:forEach>
                </tbody>

            </table>
        </div>
    </div>


    <jsp:include page="../footer.jsp"/>
</div>
</body>
</html>
