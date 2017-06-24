<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lsc
  Date: 2017/5/18
  Time: 16:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>GameInformationPlatform</title>
    <link rel="stylesheet" href="../css/champion.css">
    <style>
       #carousel-skin {
           width: 955px;
           height: 500px;
           margin: 0 auto 90px;;
           position: relative;
       }
       .defail-data{
           position: absolute;
           top: 50px;
           left: 40px;
           width: 270px;
           color: #fff;
           z-index: 99;
       }
       .carousel-indicators {
           position: absolute;
           top: 15px;
           right: 15px;
           z-index: 5;
           margin: 0;
           list-style: none;
       }
       .carousel-caption {
           position: absolute;
           right: 0;
           bottom: 0;
           left: 0;
           padding: 15px;
           background: #333333;
           background: rgba(0, 0, 0, 0.75);
       }
       .nav-tabs>li[class='active']{
           border-bottom: 3px solid #00A383;
           padding: 10px 19px 13px;
           background: #fff;
           border-left: 1px solid #E1E1E1;
           border-right: 1px solid #E1E1E1;
       }
       .spell{
           padding: 20px 30px;
           margin-top: -1px;
           position: relative;
           z-index: 1;
           border: 1px solid #E1E1E1;
           box-shadow: 0 0 2px rgba(0,0,0,.1);
           background: #fff;
       }
       .skilltitle {
           padding-bottom: 10px;
           font-size: 14px;
           color: #999;
       }
       .skilltitle h5 {
           display: inline;
           padding-right: 10px;
           font-size: 16px;
           color: #333;
           font-weight: bold;
       }
       .skilltip {
           color: #333;
           padding-bottom: 10px;
       }
    </style>
</head>
<body>

<c:if test="${requestScope.champion==null}">
    <c:redirect url="../404.html"/>
</c:if>

<div class="LayoutWrap CurrentMenu-summoner">
    <jsp:include page="../header.jsp"/>

    <div class="PageHeaderWrap" style="min-height: 600px">
        <c:set value="${requestScope.champion}" var="champion"/>
        <div class="Menu">
            <ol class="MenuList">
                <li class="Item active">
                    <a href="${pageContext.request.contextPath}/staticdata/champions" class="Link">英雄数据</a>
                </li>
                <li class="Item">
                    <i class="fa fa-2x fa-angle-right"></i>
                </li>
                <li class="Item">
                    <span class="h3">${champion.name} ${champion.title}</span>
                </li>
            </ol>
        </div>


        <div id="carousel-skin" class="carousel slide" data-interval="10000" data-ride="carousel">
            <div id="defailDATA" class="defail-data">

                <div class="media">
                    <div class="media-left">
                        <img src="http://ossweb-img.qq.com/images/lol/img/champion/${champion.image.full}" alt="${champion.name} ${champion.title}">
                    </div>
                    <div class="media-body">
                        <h2 class="media-heading">${champion.name}</h2>
                        <span class="h1" style="font-weight: bold;">${champion.title}</span><br><br>
                        <button class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/video/hero?id=${champion.id}'">查看英雄相关视频</button>
                    </div>
                </div>
                <br>
                <div id="DATAtags">
                    <c:forEach var="tag" items="${champion.tags}">
                        <span class="label label-primary">${tag}</span>
                    </c:forEach>

                </div>
                <br>
                <div id="details-info">
                    <div class="row">
                        <div class="col-md-4">
                            <label class="" for="attack">物理攻击</label>
                        </div>
                        <div class="col-md-8">
                            <div class="progress">
                                <div id="attack" class=" progress-bar progress-bar-danger" role="progressbar" aria-valuenow="${champion.info.attack}" aria-valuemin="0" aria-valuemax="10" style="width: ${champion.info.attack}0%">
                                    ${champion.info.attack}
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <label class="" for="magic">魔法攻击</label>
                        </div>
                        <div class="col-md-8">
                            <div class="progress">
                                <div id="magic" class=" progress-bar progress-bar-primary" role="progressbar" aria-valuenow="${champion.info.magic}" aria-valuemin="0" aria-valuemax="10" style="width: ${champion.info.magic}0%">
                                    ${champion.info.magic}
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <label class="" for="defense">防御能力</label>
                        </div>
                        <div class="col-md-8">
                            <div class="progress">
                                <div id="defense" class=" progress-bar progress-bar-warning" role="progressbar" aria-valuenow="${champion.info.defense}" aria-valuemin="0" aria-valuemax="10" style="width: ${champion.info.defense}0%">
                                    ${champion.info.defense}
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <label class="" for="difficulty">上手难度</label>
                        </div>
                        <div class="col-md-8">
                            <div class="progress">
                                <div id="difficulty" class=" progress-bar progress-bar-info" role="progressbar" aria-valuenow="${champion.info.difficulty}" aria-valuemin="0" aria-valuemax="10" style="width: ${champion.info.difficulty}0%">
                                    ${champion.info.difficulty}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

                <!-- Indicators -->
                <ol  class="carousel-indicators">

                    <c:forEach var="skin" items="${champion.skins}" varStatus="s">

                        <li data-target="#carousel-skin" data-slide-to="${s.index}" class=" <c:if test='${s.first}'>active</c:if>">
                            <%--<img src="http://ossweb-img.qq.com/images/lol/web201310/skin/small${skin.id}.jpg" alt="${skin.name}">--%>
                        </li>

                    </c:forEach>

                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">

                    <c:forEach items="${champion.skins}" var="skin" varStatus="s">

                        <div class="item <c:if test='${s.first}'>active</c:if>">
                            <img style="width: 980px; height: 500px;" src="http://ossweb-img.qq.com/images/lol/web201310/skin/big${skin.id}.jpg" alt="${skin.name}">
                            <div class="carousel-caption">
                                ${skin.name eq 'default'?'默认皮肤':skin.name}
                            </div>
                        </div>

                    </c:forEach>
                </div>

                <!-- Controls -->
                <a class="left carousel-control" href="#carousel-skin" role="button" data-slide="prev">
                    <i class="fa fa-angle-left fa-2x"></i>
                </a>
                <a class="right carousel-control" href="#carousel-skin" role="button" data-slide="next">
                    <i class="fa fa-angle-right fa-2x"></i>
                </a>
            </div>

        

        <div class="panel panel-default">
            <div class="panel-heading">背景故事</div>
            <div class="panel-body">
                <p>
                    ${champion.blurb}
                </p>
                <p>
                    ${champion.lore}
                </p>
            </div>
        </div>

        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">技能说明</h3>
            </div>
            <div class="panel-body">
                <div>

                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active"><a href="#passive" role="tab" data-toggle="tab">
                            <img src="http://ossweb-img.qq.com/images/lol/img/passive/${champion.passive.image.full}" alt="">
                        </a></li>
                       <c:forEach var="spell" items="${champion.spells}">
                           <li role="presentation" class=""><a href="#${spell.key}" role="tab" data-toggle="tab">
                               <img src="http://ossweb-img.qq.com/images/lol/img/spell/${spell.image.full}" alt="">
                           </a></li>
                       </c:forEach>
                    </ul>

                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane active" id="passive">
                            <div class="spell">
                                <div class="skilltitle">
                                    <h5>${champion.passive.name}</h5>
                                    <em>被动技能</em>
                                </div>
                                <div class="skilltip">
                                    ${champion.passive.description}
                                </div>
                            </div>
                        </div>
                        <c:forEach items="${champion.spells}" varStatus="s" var="spell">

                            <div role="tabpanel" class="tab-pane" id="${spell.key}">
                                <div class="spell">
                                    <div class="skilltitle">
                                        <h5>${spell.name}</h5>
                                        <c:choose>
                                            <c:when test="${s.first}"><em>快捷键：Q</em></c:when>
                                            <c:when test="${s.index==1}"><em>快捷键：W</em></c:when>
                                            <c:when test="${s.index==2}"><em>快捷键：E</em></c:when>
                                            <c:when test="${s.last}"><em>快捷键：R</em></c:when>
                                        </c:choose>
                                    </div>
                                    <p class="skilltip">
                                        <c:set var="e1" value="${(spell.effect)[1]}"/>
                                        <c:set var="e6" value="${(spell.effect)[6]}"/>
                                            ${spell.tooltip}
                                    </p>
                                    <ul class="skillstat">
                                        <c:forEach var="label" varStatus="l" items="${spell.leveltip.label}">
                                            <li>
                                                    ${label}：
                                                ${(spell.leveltip.effect)[l.index]}
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>

                        </c:forEach>
                    </div>

                </div>
            </div>
        </div>

        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">推荐装备</h3>
            </div>
            <div class="panel-body">
                <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active"><a href="#sr" aria-controls="home" role="tab" data-toggle="tab">
                        召唤师峡谷
                    </a></li>
                    <li role="presentation" class=""><a href="#ld" aria-controls="home" role="tab" data-toggle="tab">
                        极地大乱斗
                    </a></li>
                </ul>

                <!-- Tab panes -->
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="sr">p</div>
                    <div role="tabpanel" class="tab-pane" id="ld">q</div>
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">使用技巧</h3>
            </div>
            <div class="panel-body">
                <div class="colbox arttips">
                    <dl id="DATAallytips" class="borlineX">
                        <dt>当你使用${champion.name}</dt>
                        <dd>
                            <c:forEach var="tip" items="${champion.allytips}">
                                <p>${tip}</p>
                            </c:forEach>
                        </dd>
                    </dl>
                    <dl id="DATAenemytips">
                        <dt>敌人使用${champion.name}</dt>
                        <dd>
                            <c:forEach var="tip" items="${champion.enemytips}">
                                <p>${tip}</p>
                            </c:forEach>
                        </dd>
                    </dl>
                </div>

            </div>
        </div>


    </div>


    <jsp:include page="../footer.jsp"/>

</div>

</body>
</html>
