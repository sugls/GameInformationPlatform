<%--
  Created by IntelliJ IDEA.
  User: lsc
  Date: 2017/5/31
  Time: 21:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>


<div class="main main-user fl">

    <%-- 发帖 --%>
    <div class="yb-user">
        <div class="mod-tit">
            <h3>他的发帖</h3>
        </div>
        <ul id="questionList" class="topics-list t-issue clearfix" style="padding-left:0px;">
            <li>
                <div class="huifu-myhome radius3" title="回复"><span style="display:inherit;line-height:20px;">11</span></div>
                <div class="huifu-content">
                    <h3>
                        <a class="ellipsis fl" href="/p/469689731496012195" target="_blank">
                            直播了五六个月，下决心改版。                                </a>
                        <span class="t-issue-time">2天前</span>
                    </h3>
                    <p class="meta question-replay">
                        <a href="javascript:;" class="no-hr"><i class="disin answer"></i><span class="fans-count">0</span>个关注</a>
                        <a href="javascript:;" class="follow-question-square" data-meta="{&quot;des_id&quot;:&quot;469689731496012195&quot;,&quot;type&quot;:6}">+关注</a>
                    </p>
                </div>
            </li>
            <p class="yb-load-result">暂时没有更多发帖哟~</p>
        </ul>
        <a id="moreQuestion" offset="0" uid="lOwVaGzk575M" class="btn-more user-topic-btn"><i class="icon-loading"><img src="https://staticyb.douyu.com/images/loading.gif" alt=""></i><span>点击加载更多</span></a>
    </div>

    <%-- 回帖 --%>
    <%-- <div class="yb-user">
         <div class="mod-tit myhome-con-title">
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
                             来说说你们努力生活的动力吧。、让我找找灵感~  我已经失去对美好生活的向往了··谁来搭救我                                </a>
                     </h3>
                     <p class="desc substring-content">
                         <span>[表情]</span>

                     </p>
                 </div>
             </li>
             <p class="yb-load-result">暂时没有更多回复哟~</p>

         </ul>

         <a id="more_answer" offset="0" uid="DrdqY1gvRdap" by_time="1" class="btn-more"><i class="icon-loading"><img src="https://staticyb.douyu.com/images/loading.gif" alt=""></i><span>点击加载更多</span></a>
     </div>--%>

</div>


</body>
</html>
