<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>游戏信息交流平台</title>
  <!-- Custom Theme files -->
  <!--<style>
    body{
      padding-top: 50px;
    }
  </style>-->
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="keywords" content="Flat Search Box Responsive, Login form web template, Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
  <!--Google Fonts-->
  <%--<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
  <!--Google Fonts-->
  <link rel="stylesheet" href="../css/bootstrap.min.css">
  <link rel="stylesheet" href="../css/layout.css">
  <link rel="stylesheet" href="../css/green.css">
  <link rel="stylesheet" href="../css/essentials.css">
  <link rel="stylesheet" href="../css/font-awesome.min.css">
  <script src="../js/jquery-1.12.4.min.js"></script>
  <script src="../js/bootstrap.min.js"></script>--%>

  <style>

    .region-select ul li {
      padding: 0 10px;
      line-height: 25px;
      cursor: pointer;
    }
  </style>
</head>
<body>

<!-- 导航条开始 -->

<div class="LayoutWrap CurrentMenu-summoner">

  <jsp:include page="../header.jsp"/>

<!-- 导航条结束 -->

<%--<section class="page-header page-header-xs dark">
  <div class="container">
    <h1>搜索结果</h1>
  </div>
</section>--%>

<section class="padding-xs alternate">
  <div class="container">
    <form method="get" action="${pageContext.request.contextPath}/summoner/search" class="clearfix well well-sm search-big nomargin">
      <div class="input-group">
        <div class="input-group-btn region-select">
          <button type="button" class="btn btn-default input-lg dropdown-toggle noborder-right" data-toggle="dropdown">
            North America <span class="caret"></span>
          </button>
          <input type="hidden" id="region" name="region" value="NA1">
          <ul class="dropdown-menu" style="height: 300px; overflow: scroll;">
            <li class="active">
              <a><i class="fa fa-check"></i> North America</a>
            </li>
            <li value="GLOBAL">Global</li>
            <li value="BR1">Brazil</li>
            <li value="EUN1">EU Nordic &amp; East</li>
            <li value="EUW1">EU West</li>
            <li value="LA1">Latin America North</li>
            <li value="LA2">Latin America South</li>
            <li value="OC1">Oceania</li>
            <li value="RU">Russia</li>
            <li value="TR1">Turkey</li>
            <li value="JP1">Japan</li>
            <li value="KR">Korea</li>
          </ul>
        </div>
        <input name="summoner" class="form-control input-lg" type="text" placeholder="召唤师名称">
        <div class="input-group-btn">
          <button type="submit" class="btn btn-default input-lg noborder-left">
            <i class="fa fa-search fa-lg nopadding"></i>
          </button>
        </div>
      </div>
    </form>
  </div>
</section>


<section style="min-height: 400px;">

  <c:if test="${requestScope.type=='search'}">
    <div class="container">
      <!-- <p>

       </p>-->
      <div class="clearfix search-result">
        <!--<h4>50 Results</h4>-->

        <c:if test="${requestScope.summonerList==null || requestScope.summonerList.size()<=0}">
          <span class="h4">没有查找到召唤师信息，请检查输入是否正确！</span>
        </c:if>
        <c:if test="${requestScope.summonerList!=null && requestScope.summonerList.size()>0}">
          <table class="table table-striped table-hover table-vertical-middle">
            <thead>
            <tr>
              <th>召唤师名称</th>
              <th>地区</th>
              <th>等级</th>
              <th>段位</th>
              <th>胜场数/负场数</th>
              <th>胜率</th>
              <th>最后活跃时间</th>
              <c:if test="${sessionScope.user!=null}">
                <th>绑定账号</th>
              </c:if>
                <%--<th>Summoner Id</th>--%>
            </tr>
            </thead>
            <tbody>

            <c:forEach items="${requestScope.summonerList}" var="sr" >

              <tr>
                <td>
                  <a href="${pageContext.request.contextPath}/summoner/summary?region=${sr.platform.id}&summonerId=${sr.summoner.id}">
                    <img
                            src="http://ddragon.leagueoflegends.com/cdn/7.9.2/img/profileicon/${sr.summoner.profileIconId}.png" alt="profileIcon"
                            width="80px" height="80px"
                    >
                      ${sr.summoner.getName()}
                  </a>
                </td>
                <td>
                    ${fn:toUpperCase(sr.platform.name)}
                </td>
                <td>
                    ${sr.summoner.summonerLevel}
                </td>
                <td>
                  <c:choose>
                    <c:when test="${sr.league.tier == null}">
                      <img src="../images/base-icons/provisional.png" alt="tier" width="80px" height="80px">
                    </c:when>
                    <c:otherwise>
                      <img src="../images/base-icons/${fn:toLowerCase(sr.league.tier)}.png" alt="tier" width="80px" height="80px">
                    </c:otherwise>
                  </c:choose>
                  <c:choose>
                    <c:when test="${sr.league.tier == null}">
                      Unranked
                    </c:when>
                    <c:otherwise>
                      ${sr.league.leagueName} <br>
                      ${sr.league.tier} ${sr.league.rank} <br> leaguePoints: ${sr.league.leaguePoints}
                    </c:otherwise>
                  </c:choose>
                </td>
                <td>
                    ${sr.league.wins!=null?sr.league.wins:"--"} / ${sr.league.losses!=null?sr.league.losses:"--"}
                </td>
                <td>
                  <c:set var="winrate" value="${sr.league.wins!=null&&sr.league.losses!=null?
                  sr.league.wins / (sr.league.wins + sr.league.losses): '--'}"/>

                  <c:if test="${!winrate.equals('--')}">
                    <fmt:formatNumber value="${winrate}" type="percent"/>
                  </c:if>
                  <c:if test="${winrate.equals('--')}">
                    ----
                  </c:if>
                </td>
                <td>
                  <jsp:useBean id="dateObject" class="java.util.Date" scope="page"/>
                  <jsp:setProperty property="time" name="dateObject" value="${sr.summoner.revisionDate}"/>
                  <fmt:formatDate value="${dateObject}" pattern="yyyy-MM-dd HH:mm:ss" />
                </td>
                <c:if test="${sessionScope.user!=null}">
                  <td>
                    <button onclick="location.href='addAccount?userid=${sessionScope.user.userid}&summonerid=${sr.summoner.id}&platform=${sr.platform.id}'" class="btn btn-primary">绑定账号</button>
                  </td>
                </c:if>
                  <%--<td>${sr.summoner.id}</td>--%>
              </tr>

            </c:forEach>

            </tbody>
          </table>
        </c:if>

      </div>
    </div>
  </c:if>


</section>

<%--<footer id="footer">
  <div class="copyright">
    <div class="container">
      <ul class="pull-right nomargin list-inline mobile-block">
        <li>设计实现：刘少池</li>
        <li>&bull;</li>
        <li>指导教师：程珍</li>
      </ul>
      &copy; 2017 游戏信息交流平台
    </div>
  </div>
</footer>--%>

  <jsp:include page="../footer.jsp"/>

</div>

<script>

    $('.region-select ul li').on('click', function (e) {
        var _this = $(this);
        var active = $(".region-select ul").find(".active");
        var ah = active.html();
        active.removeClass("active");
        active.html(ah.substr(ah.indexOf("</i>")), ah.indexOf("</a>"));
        $('.region-select > button').html(_this.html()+ ' <span class="caret"></span>');
        _this.addClass("active");
        var html = _this.html();
        _this.html('<a><i class="fa fa-check"></i> ' + html+'</a>');
        $('#region').val( _this.attr('value'));
    });

</script>


</body>
</html>
