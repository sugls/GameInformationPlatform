<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lsc
  Date: 2017/5/23
  Time: 16:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html>
<head>
    <title>Title</title>
    <script>
        function loadDefault(obj) {
            obj.src = '${pageContext.request.contextPath}/images/profile/face/default.jpg';
           /* obj.onerror = null;//控制onerror事件只触发一次*/
        }
    </script>
    <style>
        dt {
            font-weight: normal
        }
    </style>
</head>
<body>


<c:if test="${requestScope.tpost!=null}">
    <!--postContent 帖子内容-->
    <div class="post-content-wrapper">
        <!--postContent START-->
        <!-- 帖子回复内容模板位于 usercenter -> postcontent.jsp -->
        <div class="post-content">

            <div class="content">
                <div class="content-poster">
                    <img src="../images/forum/poster.png" alt="楼主">
                </div>
                <!--左侧图像，赞踩 START-->
                <div class="poster-info fl">
                    <img class="v2-radius3 " alt=""
                         src="${pageContext.request.contextPath}/images/profile/face/${requestScope.tpost.authorid}.jpg"
                         data-tooltip="/usercenter/ajaxuserdetail?uid=0LW7rZbDl7GY&amp;tid=12">
                    <a href="${pageContext.request.contextPath}/community/user?id=${requestScope.tpost.authorid}" class="poster-name ellipsis reply-user-name ">
                            ${requestScope.tpost.author}
                    </a>
                    <div class="level-title" title="点击查看等级头衔说明">
                        <span>${requestScope.tpost.rankTitle}</span>
                        <span class="lv-badge lv${requestScope.tpost.rank}"></span>
                    </div>

                </div>
                <!--左侧图像，赞踩 END-->
                <!--右则正文部分 START-->
                <div class="post-info">

                    <!--帖子正文 start-->
                    <div class="post-info-content" id="thread-content">

                        <p>${requestScope.tpost.message}</p>

                    </div>
                    <!--帖子正文 end-->

                   <%-- <div class="post-operation shown-on-hover-wrapper">
                        <a class="v2-c999 report question_report  shown-on-hover orange-hover " href="javascript:;">
                            举报
                        </a>
                        <!--删除帖子-->
                        <span class="v2-c999"><!--发布于-->
                                    ${requestScope.tpost.dateline}
                                </span>

                        <a class="reply-dt-buttons-up v2-c666 nohover fl" href="javascript:;"
                           onclick="YUBA.post.likeClicked(this, 0, '', true);" title="点击赞">
                                    <span class="icon-alignment">
                                        <i class="v2-icon rtop3 thumbsup "></i>
                                    </span>
                            <span class="reply-dt-liked-count ">
                                        12
                                    </span>
                        </a>
                        <div class="post-share-tit fl" data-name="铁锹001">
                            <em class="post-share-icon"></em>
                            <span>分享</span>
                            <div class="post-share">
                                <div class="sq-wrap">
                                    <!-- 分享按钮 -->
                                    <div id="share-content" class="share-box fl clearfix">
                                        <div class="con hide" data-share-content="content">
                                            <i class="arrow-icon"></i>
                                            <div class="share-more clearfix">
                                                <div class="share-third-list"><h3 class="h3">呼唤小伙伴们前来围观吧</h3>
                                                    <div class="s-more" data-share-btn="more">
                                                        <ul class="trd-ullist clearfix">
                                                            <li><a class="sm1" href="javascript:;" title="分享到新浪微博"
                                                                   data-to="tsina" target="_blank"></a></li>
                                                            <li><a class="sm4" href="javascript:;" title="分享到QQ"
                                                                   data-to="cqq" target="_blank"></a></li>
                                                            <li><a class="sm3" href="javascript:;" title="分享到QQ空间"
                                                                   data-to="qzone" target="_blank"></a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="wx-qcode">
                                                    <div class="wxqrimgbg">
                                                        <div class="wxqrimg"></div>
                                                        <i class="wex-icon"></i></div>
                                                    <p> 微信扫码分享 </p></div>
                                            </div>
                                            <div class="addr">
                                                <div class="tt">
                                                    <ul>
                                                        <li class="hover" data-share-path="url">鱼吧地址</li>
                                                    </ul>
                                                </div>
                                                <div class="s-box">
                                                    <div class="cc" style="display:block;"><input class="inn" name=""
                                                                                                  id="js_page_url"
                                                                                                  type="text"
                                                                                                  data-share-input="path"
                                                                                                  value="http://live.dz11.com/room/share/301613"
                                                                                                  readonly="" size="30">
                                                        <a href="javascript:;" id="share-copy-btn" class="s_copy btn"
                                                           data-share-copy="btn">复制链接</a></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 主贴底部收藏 -->
                        <a class="fl post-favorite-area">
                            <span class="post-favorite-icon "></span>
                            <span class="favorite-post" id="favorite"
                                  data-meta="{&quot;qid&quot;:&quot;336464391495678964&quot;,&quot;aid&quot;:0}">
                                                                收藏
                                                            </span>
                        </a>
                    </div>--%>
                </div>
                <!--右则正文部分 END-->
            </div>
        </div>
        <!--postContent END-->
    </div>
</c:if>

<!--postReply帖子回复-->
<div class="post-reply-wrapper">
    <!--post-reply 帖子回复 Start-->
    <div class="post-reply">
        <h3 class="title"><i class="icon common"></i>主题回复</h3>
        <div class="yellow-line"></div>
        <div id="reply-dl-container">
            <%-- 回复内容 --%>
            <c:forEach var="p" items="${requestScope.posts}" varStatus="ps">

                <dl class="reply-dl clearfix" data-aid="${ps.index+2}">
                    <c:if test="${p.authorid==requestScope.tpost.authorid}">
                        <%-- 楼主标识 --%>
                        <div class="content-poster">
                            <img src="${pageContext.request.contextPath}/images/forum/poster.png" alt="楼主">
                        </div>
                    </c:if>


                    <dt class="reply-dt">
                        <img class="v2-radius3 " alt="" onerror="loadDefault(this)"
                             data-tooltip="/usercenter/ajaxuserdetail?uid=rZwYqloGrwbK&amp;tid=12"
                             src="${pageContext.request.contextPath}/images/profile/face/${p.authorid}.jpg"/>
                        <a class="user-name ellipsis v2-c333 orange-hover "
                           href="${pageContext.request.contextPath}/community/user?id=${p.authorid}" target="_blank">
                                ${p.author}
                        </a>
                    <div class="level-title" title="点击查看等级头衔说明">
                        <span>${p.rankTitle}</span>
                        <span class="lv-badge lv${p.rank}"></span>
                    </div>
                    </dt>

                    <dd class="reply-dd">
                        <!-- 回复内容 -->
                        <div class="reply-content v2-f15">
                            <p>${p.message}</p>
                        </div>
                        <!-- 编辑器 待修改区域 -->
                        <div class="answer-insert-edit" style="display:none;">
                            <textarea type="text/plain" id="a2">${p.message}</textarea>
                            <div class="answer-insert-edit-btn">
                                <a data-replynum="0" class="v2-button  larger cansel-edit-replay" href="javascript:;">取
                                    消</a>
                                <a class="v2-button reversed larger editor-publish-btn" href="javascript:;"
                                   data-meta="{&quot;qid&quot;:&quot;896129571495509494&quot;,&quot;aid&quot;:2,&quot;tid&quot;:&quot;12&quot;,&quot;create_time&quot;:1495509905}">
                                    保 存
                                </a>
                            </div>
                        </div>
                        <!-- 回复内容 footer -->
                        <div class="reply-operations shown-on-hover-wrapper">
                            <%--<a class="v2-c999 report anwser_report shown-on-hover orange-hover"
                               href="javascript:;"
                               data-meta="{&quot;qid&quot;:&quot;896129571495509494&quot;,&quot;aid&quot;:2,&quot;stype&quot;:2,&quot;uid&quot;:51888101,&quot;content&quot;:&quot;Ace\u6eda\u51fa\uff01\uff01\uff01\uff01&quot;}">
                                举报
                            </a>--%>
                            <span class=" v2-c999 reply-user-floor " id="replyFloor2">
                                            ${ps.index+2}楼
                                        </span>
                            <!--发布于-->
                            <span class="v2-c999">${p.dateline}</span>


                            <a class="v2-c999 reply-btn-comments-toggle" href="javascript:;"
                               onclick="YUBA.post.commentsToggle(this);" data-num-comments="${p.replyNum}">
                                <i class="v2-icon rtop3 comment"></i>
                                <span class="toggle-reply-content toggle-reply-content-origin">回复</span>
                            </a>


                            <%--<a class="reply-dt-buttons-up v2-c666 nohover fl" href="javascript:;"
                               onclick="YUBA.post.likeClicked(this, 2, '', true);" title="点击赞">
                                <span class="icon-alignment"><i class="v2-icon rtop3 thumbsup "></i></span>
                                <span class="reply-dt-liked-count ">
                        1                </span>
                            </a>--%>

                        </div>


                        <!-- 对楼层做回复 -->
                        <c:if test="${p.replies.size()>0}">
                            <div class="reply-comments clearfix" style="display: block;">
                                <i class="v2-icon triangle"></i>
                                <div class="reply-comments-container" data-aid="1">

                                    <c:forEach var="c1" items="${p.replies}">
                                        <dl class="reply-comments-dl" data-cid="5923f9ce9d25a0f92f3f0690">
                                            <dt class="v2-float-left reply-comments-dt">
                                                <img class="v2-radius3 " alt="${p.authorid}" onerror="loadDefault(this)"
                                                     src="${pageContext.request.contextPath}/images/profile/face/${c1.authorid}.jpg"
                                                     data-tooltip="/usercenter/ajaxuserdetail?uid=GJwkrKJn67Zj&amp;tid=1710">
                                            </dt>
                                            <dd class="reply-comments-dd">
                                                <div class="reply-comments-content v2-f13 v2-ccontent">
                                                    <a class="reply-comments-user underline-hover"
                                                       href="${pageContext.request.contextPath}/community/user?id=${c1.authorid}">
                                                            ${c1.author}
                                                    </a>
                                                    <c:if test="${c1.toid!=null}">
                                                        <span class="">回复</span>
                                                        <a class="reply-comments-user underline-hover"
                                                           href="${pageContext.request.contextPath}/community/user?id=${c1.toid}">${c1.touser}
                                                        </a>
                                                        :
                                                    </c:if>
                                                        ${c1.message}
                                                </div>

                                                <div class="reply-comments-status shown-on-hover-wrapper">
                                                    <a class="v2-c999 v2-float-right reply-btn-add-replyto orange-hover report-margin-left"
                                                       href="javascript:;"
                                                       onclick="YUBA.post.commentsAddReplyTo(this);">
                                                        回复
                                                    </a>

                                                    <span class="v2-float-right"></span>

                                                        <%--<a class="v2-c999  report comments-report shown-on-hover orange-hover report-margin-left" href="javascript:;"
                                                           data-meta="{&quot;qid&quot;:&quot;173075811495529575&quot;,&quot;aid&quot;:1,&quot;cid&quot;:&quot;5923f9ce9d25a0f92f3f0690&quot;,&quot;stype&quot;:3,&quot;uid&quot;:6628115,&quot;content&quot;:&quot;\u5927\u5144\u5f1f\u522b\u51b2\u52a8&quot;}">
                                                            举报
                                                        </a>--%>

                                                    <!-- 自己的回复可以删除 -->
                                                    <span class="v2-c999 fabuyu report-margin-left"><!--发布于-->
                                                                     ${c1.dateline}
                                                                </span>

                                                </div>

                                                <form class="reply-comments-form reply-comments-form-replyto"
                                                      style="display:none;">

                                                                <textarea
                                                                        class="v2-f13 reply-comments-form-quickreply-content"
                                                                        placeholder="请输入回复内容"
                                                                        name="commenttext"></textarea>

                                                    <div class="reply-comments-form-buttons">
                                                        <a class="v2-button reply-comments-form-button-cancel"
                                                           href="javascript:;"
                                                           onclick="YUBA.post.commentsReplyToCancel(this);">取消</a>
                                                        <a class="v2-button reply-comments-form-quickreply-btn-ok"
                                                           href="javascript:;"
                                                           onclick="YUBA.post.commentsReplyiesSubmit(this);">发布</a>
                                                    </div>
                                                </form>
                                            </dd>
                                        </dl>
                                        <c:if test="${p.replyNum>5}">
                                            <a href="javascript:;">点击查看更多回复</a>
                                        </c:if>
                                    </c:forEach>

                                    <div class="v2-pagination v2-f12" style="display:none;">
                                    </div>
                                </div>
                                <div class="reply-comments-operations">
                                    <a class="v2-float-right v2-button reversed reply-btn-comments-add-reply"
                                       href="javascript:;"
                                       onclick="YUBA.post.commentsAddReply(this);">回复一下</a>
                                    <div class="v2-clear">
                                    </div>
                                </div>

                                <form class="reply-comments-form reply-comments-form-reply" style="display:none;">
                                    <input type="hidden" name="qid" value="173075811495529575">
                                    <input type="hidden" name="aid" value="1">
                                    <textarea class="v2-f1 quick-reply-floor-trigger" placeholder="请输入评论内容"
                                              name="commenttext"></textarea>

                                    <div class="reply-comments-form-buttons">
                                        <a class="v2-button reply-comments-form-button-cancel" href="javascript:;"
                                           onclick="YUBA.post.commentsReplyCancel(this);">取消</a>
                                        <a class="v2-button reply-comments-form-button-ok" href="javascript:;"
                                           onclick="YUBA.post.commentsReplyiesSubmit(this, 'big');">发布</a>
                                    </div>
                                </form>
                            </div>
                        </c:if>
                    </dd>
                </dl>
            </c:forEach>

        </div>
    </div>
    <!--post-reply 帖子回复 end-->
</div>


</body>
</html>
