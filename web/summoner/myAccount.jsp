<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lsc
  Date: 2017/5/30
  Time: 22:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>GameInformationPlatform</title>
    <style>
        .margin-top-50 {
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
                我的账号
                <span class="pull-right"><button onclick="location.href='search'" class="btn btn-warning">绑定账号</button></span>
            </div>
            <div class="panel-body" style="min-height: 400px">

                <div class="row">

                    <c:if test="${requestScope.summoners!=null}">
                        <c:forEach items="${requestScope.summoners}" var="sr">
                            <div class="col-sm-12 col-md-6">
                                <%--<div class="thumbnail">
                                    <img src="http://ddragon.leagueoflegends.com/cdn/7.9.2/img/profileicon/${sr.summoner.profileIconId}.png"
                                         alt="profileIcon">
                                    <div class="caption">
                                        <h3>${sr.summoner.name}</h3>
                                        <p>${sr.platform}</p>
                                        <p>${sr.summoner.summonerLevel}</p>
                                        <p> ${sr.league.leagueName} <br>
                                                ${sr.league.tier} ${sr.league.rank} <br> leaguePoints: ${sr.league.leaguePoints}</p>
                                        <p><a href="${pageContext.request.contextPath}/summoner/summary?summonerId=${sr.summoner.id}&region=${sr.platform}" class="btn btn-primary" role="button">查看</a></p>
                                    </div>
                                </div>--%>
                                <div class="media">
                                    <div class="media-left">
                                        <a>
                                            <img src="http://ddragon.leagueoflegends.com/cdn/7.9.2/img/profileicon/${sr.summoner.profileIconId}.png"
                                                 alt="profileIcon">
                                        </a>
                                    </div>
                                    <div class="media-body">
                                        <h4 class="media-heading"><h3>${sr.summoner.name}</h3></h4>
                                        <p>服务器:${sr.platform}  等级:${sr.summoner.summonerLevel}</p>
                                        <p>战区: ${sr.league.leagueName} <br>
                                                ${sr.league.tier} ${sr.league.rank} <br> leaguePoints: ${sr.league.leaguePoints}</p>
                                        <p><a href="${pageContext.request.contextPath}/summoner/summary?summonerId=${sr.summoner.id}&region=${sr.platform.id}" class="btn btn-primary" role="button">查看</a></p>

                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                    <c:if test="${requestScope.summoners==null}">
                        <p>请先绑定账号</p>
                    </c:if>

                </div>

            </div>
        </div>

    </div>

    <jsp:include page="../footer.jsp"/>
</div>

</body>
</html>
