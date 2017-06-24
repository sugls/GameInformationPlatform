<%--
  Created by IntelliJ IDEA.
  User: lsc
  Date: 2017/5/31
  Time: 20:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>游戏信息交流平台</title>
</head>
<body>
<div class="outer-layer outer-layer-index">

    <!-- header -->
    <jsp:include page="header.jsp"/>

    <div class="all-main-wrapper" style="margin-left: 77px;">

        <div class="content_ucenter w1000  usercenter-margin-top">
            <div class="user-cont user-wrap-margin">
                <div class="radius1 user_wrap ">
                    <div class="info-main clearfix">
                        <span class="profile radius2 fl">
                            <img
                                src="${pageContext.request.contextPath}/images/profile/face/${requestScope.member.icon}"></span>

                        <div class="items fl">
                            <h4>
                                ${requestScope.member.username}
                                <span class="ban-trigger-container">
                                                </span>
                            </h4>
                            <h5>
                                活跃值：${requestScope.member.actives} <br>
                                ${requestScope.member.rankTitle}  <span class="lv-badge lv${requestScope.member.rank}"></span>
                                <span class="ban-trigger-container">
                                                </span>
                            </h5>

                            <p class="intro" title=""></p>
                        </div>
                    </div>
                    <div class="myview clearfix">
                        <ul class="fl clearfix">
                            <li>
                                <p class="nu"></p>

                                <p class="word">
                                    <span>${requestScope.member.posts}</span>

                                    <a >发帖</a>
                                </p>
                            </li>
                            <li>
                                <p class="nu"></p>

                                <p class="word">
                                    <span>${requestScope.member.replies}</span>
                                    <a>回帖</a>
                                </p>
                            </li>
                        </ul>
                    </div>
                    <div class="profile-navbar clearfix">
                        <ul class="fl clearfix usercenter_tab">

                            <li class="answer">
                                <a href="">
                                    发帖
                                </a>
                            </li>
                            <li class="question">
                                <a href="">
                                    回帖
                                </a>
                            </li>
                        </ul>
                        <%--<div class="myfocus fr">
                            <p class="fl">我关注了：</p>
                            <ul class="fl">
                                <li>
                                    <a href="/usercenter/followquestions?uid=Mn7MEgQWn7j2">
                                        1 个帖子
                                    </a>
                                </li>
                                <li>
                                    <a href="/usercenter/followusers?uid=Mn7MEgQWn7j2">
                                        28 个用户
                                    </a>
                                </li>
                            </ul>
                        </div>--%>
                    </div>
                </div>
                <div class="user_main clearfix">


                    <div class="main main-user fl">
                        <%--<div class="yb-user">
                            <div class="mod-tit">
                                <h3>我加入的小组</h3>
                            </div>
                            <ul class="user-topic-list"><!--this is topicmore on modules userCenter-->
                                <p class="yb-load-result">还没有加入任何小组</p>

                                <!--this is topicmore on modules->userCenter END--></ul>
                            <a url="/usercenter/topicmore?uid=Mn7MEgQWn7j2" offset="1" class="btn-more loading-more" style="cursor: pointer; display: none;">点击加载更多</a>
                        </div>--%>

                            <div class="yb-user">
                                <%--<div class="mod-tit">
                                    <h3>他的发帖</h3>
                                </div>
                                <ul id="questionList" class="topics-list t-issue clearfix" style="padding-left:0px;">
                                    <li>
                                        <div class="huifu-myhome radius3" title="回复"><span
                                                style="display:inherit;line-height:20px;">11</span></div>
                                        <div class="huifu-content">
                                            <h3>
                                                <a class="ellipsis fl" href="/p/469689731496012195" target="_blank">
                                                    直播了五六个月，下决心改版。 </a>
                                                <span class="t-issue-time">2天前</span>
                                            </h3>
                                            <p class="meta question-replay">
                                                <a href="javascript:;" class="no-hr"><i class="disin answer"></i><span
                                                        class="fans-count">0</span>个关注</a>
                                                <a href="javascript:;" class="follow-question-square"
                                                   data-meta="{&quot;des_id&quot;:&quot;469689731496012195&quot;,&quot;type&quot;:6}">+关注</a>
                                            </p>
                                        </div>
                                    </li>
                                    <p class="yb-load-result">暂时没有更多发帖哟~</p>
                                </ul>
                                <a id="moreQuestion" offset="0" uid="lOwVaGzk575M" class="btn-more user-topic-btn"><i
                                        class="icon-loading"><img src="https://staticyb.douyu.com/images/loading.gif"
                                                                  alt=""></i><span>点击加载更多</span></a>--%>
                            </div>

                        <%--<div class="yb-user">
                            <div class="mod-tit">
                                <h3>我的回复</h3>
                            </div>
                            <ul id="answerlist" class="topics-list clearfix">
                                <li>
                                    <a class="fl user-praise-new radius3">
                                        <span class="like-dislike-num">0</span>
                                        <span>赞同</span>
                                    </a>
                                    <div class="topic-desc">
                                        <h3>
                                            <a href="/p/243869301495647672#?aid=22" target="_blank">
                                                来说说你们努力生活的动力吧。、让我找找灵感~ 我已经失去对美好生活的向往了··谁来搭救我 </a>
                                        </h3>
                                        <p class="desc substring-content">
                                            <span>[表情]</span>

                                        </p>
                                    </div>
                                </li>
                                <p class="yb-load-result">暂时没有更多回复哟~</p>

                            </ul>

                            <a id="more_answer" offset="0" uid="DrdqY1gvRdap" by_time="1" class="btn-more"><i
                                    class="icon-loading"><img src="https://staticyb.douyu.com/images/loading.gif"
                                                              alt=""></i><span>点击加载更多</span></a>
                        </div>--%>

                    </div>


                   <%-- <div class="focus-me">
                        <div class="myfoucs-list">
                            <div class="title mod-tit mod-tit-new">
                                <h3>关注我的人</h3>
                            </div>
                            <ul class="myf-topic myf-ulist">
                                <li>
                                    <p class="yb-load-result diff-index-css-change">还没有人关注他</p>
                                </li>
                            </ul>
                        </div>--%>
                        <%--<div class="myhot-qus mt27">
                            <div class="title mod-tit mod-tit-new">
                                <h3>我的热门回复</h3>
                            </div>
                            <ul class="my-hot-reply">
                                <li>
                                    <h3 class="col-item">
                                        <a href="/p/243869301495647672#?aid=22" target="_blank">来说说你们努力生活的动力吧。、...</a>
                                    </h3>

                                    <p class="col-info">
                                        [表情]                    </p>
                                </li>
                                <li>
                                    <h3 class="col-item">
                                        <a href="/p/416195791495604738#?aid=34" target="_blank">老铁们，可能房管有时候禁言错了...</a>
                                    </h3>

                                    <p class="col-info">
                                        [表情]                    </p>
                                </li>
                            </ul>
                        </div>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="footer.jsp"/>

</div>

</body>
</html>
