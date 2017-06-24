<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lsc
  Date: 2017/5/23
  Time: 11:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <title>Game Information Community</title>
    <style>
        * {
            box-sizing: content-box !important;
        }
    </style>
</head>
<body>

<div class="outer-layer outer-layer-index">

    <!--顶部导航-->
    <div class="lift-nav lift-nav-maxwidth" style="margin-right: -594px;">
        <div class="lift-nav-item lift-top" style="display: none;">
            <i class="lift-nav-icon lift-top-icon"></i>
            <span>回到顶部</span>
        </div>
    </div>

    <!-- header -->
    <jsp:include page="header.jsp"/>


    <!-- 主体 -->


    <div style="padding-top: 0" class="clearfix common-padding-top ">
        <div class="all-main-wrapper" style="margin-left: 77px;">
            <div class="post-index-box clearfix ">

                <!--  发帖内容部分  -->
                <div class="post-index-content clearfix ">

                    <div class="post-index-top">
                        <div class="post-topic-wrapper">
                            <!--postTopic 所在话题-->
                            <!--postTopic START-->

                            <div class="post-topic">
                                <div class="topic-info">
                                    <a href="${pageContext.request.contextPath}/community/forum?fid=${requestScope.forum.fid}" class="topic-img">
                                        <img class="radius3"
                                             src="${pageContext.request.contextPath}/images/forum/${requestScope.forum.icon}"
                                             alt="${requestScope.forum.name}">
                                    </a>
                                    <a href="${pageContext.request.contextPath}/community/forum?fid=${requestScope.forum.fid}" class="topic-name orange-hover" id="topicNameWrapper"
                                       data-tid="12">${requestScope.forum.name}</a>
                                    <%-- <span>关注：<span class="orange group-friend-count">413173</span></span>--%>
                                    <span>主题：<span class="orange">${requestScope.forum.threads}</span></span>
                                    <span>
                                        帖数：<span class="orange group-friend-count">${requestScope.forum.posts}</span>
                                     </span>
                                    <div class="post-topic-level">
                                       <%-- <a href="javascript:void(0);" class="level-sign-btn" id="level-sign-btn"
                                           data-tid="12">
                                            关注
                                        </a>--%>
                                    </div>

                                </div>

                                <div class="tool">

                                    <div class="pagination" style="display: none;"></div>
                                    <div class="page-go-to clearfix">
                                        <span class="reply-count orange fl">${requestScope.totalPosts}</span>
                                        <span class="fl">回复贴，共</span>
                                        <span class="page-count orange fl">${requestScope.totalPages}</span>
                                        <span class="fl">页，跳转到</span>
                                        <input type="text" id="pageGoToInput" class="page-go-to fl">
                                        <span class="fl">页</span>
                                        <span class="white-btn-122042 page-goto fl" id="pageGoTo">确定</span>
                                    </div>
                                    <%--<div class="floor-go-to clearfix">
                                        <span class="fl">楼层直达</span>
                                        <input type="text" id="floorGoToInput" class="fl">
                                        <span class="white-btn-122042 floor-goto fl" id="floorGoTo"
                                              data-floor-count="4">确定</span>
                                    </div>--%>

                                    <a href="${pageContext.request.contextPath}/community/forum?fid=${requestScope.forum.fid}" class="back-to-topic fr orange-hover">
                                        &lt;&nbsp;返回${requestScope.forum.name}区</a>
                                </div>

                            </div>
                            <!--postTopic END-->
                        </div>
                    </div>
                    <!-- 内容 左  -->
                    <div class="post-index-main fl ">

                        <div class="post-content-header">
                            <div class="header clearfix">
                                <span title="${requestScope.thread.subject}"
                                      class="post-title fl ellipsis">${requestScope.thread.subject}</span>


                                <!-- 订阅按钮 -->
                              <%--  <span class="white-btn-122460 only-louzhu"
                                      onclick="YUBA.post.showThisUserOnly(1341819)">只看楼主</span>
--%>

                                <div class="editor" style="display: none">
                                    <input class="tex1 radius3" autocomplete="off" id="__title" name="title"
                                           placeholder="在这里输入您的标题" value="">
                                </div>

                            </div>
                        </div>


                        <input type="hidden" id="tid" value='${requestScope.tid}'>
                        <%-- 帖子内容 及 回复 --%>

                        <div id="main-content"></div>
                        <script>
                            $(document).ready(getPost(1));
                        </script>


                        <div class="post-pagination-wrapper">
                            <!--post-pagination start-->
                            <div class="post-pagination clearfix">
                                <span class="fl">
                                    <span class="reply-count orange fl">${requestScope.totalPosts}</span>
                                    <span class="fl">条回复</span>
                                </span>
                                <span class="fl anchor-post-page-count">
                                共<span class="page-count orange">${requestScope.totalPages}</span>页</span>
                                当前页<span class="orange" id="current-page">1</span>
                                <div class="pagination fl">
                                    <c:set var="pages" value="1"/>
                                    <script>
                                        var pages = 1;
                                        var totalPages = ${requestScope.totalPages};

                                        function page(p) {
                                            if (p<=1){
                                                $('#firstpage').hide();
                                                $('#prepage').hide();
                                                $('#lastpage').show();
                                                $('#nextpage').show();
                                            }
                                            if (p>=totalPages){
                                                $('#lastpage').hide();
                                                $('#nextpage').hide();
                                                $('#firstpage').show();
                                                $('#prepage').show();
                                            }
                                        }

                                    </script>
                                        <a href="javascript:;" <%--style="display: none;"--%> id="firstpage" class="next-page" onclick="pages=1;getPost(1);page(pages);$('#current-page').text(pages);">首页</a>
                                        <a href="javascript:;" id="prepage" <%--style="display: none;"--%> class="next-page" onclick="pages = pages-1;getPost(pages);page(pages);$('#current-page').text(pages);">上一页</a>
                                    <a href="javascript:;" id="nextpage" <%--<c:if test="${requestScope.totalPages<=1}">style="display: none" </c:if>--%>class="next-page" onclick="pages=pages+1;getPost(pages);page(pages);$('#current-page').text(pages);">下一页</a>
                                        <a href="javascript:;" id="lastpage" <%--<c:if test="${requestScope.totalPages<=1}">style="display: none" </c:if>--%> onclick="pages=totalPages;getPost(totalPages);page(pages);$('#current-page').text(pages);">尾页</a>
                                </div>
                                <div class="back-to-list fr">
                                    <a href="${pageContext.request.contextPath}/community/forum?fid=${requestScope.forum.fid}" class="orange-hover">
                                        &lt;&nbsp;返回${requestScope.forum.name}区
                                    </a>
                                </div>
                            </div>
                            <!--post-pagination end-->
                        </div>

                        <!--postReplyEditor 回帖编辑器-->
                        <div class="post-reply-editor-wrapper">
                            <!--post-reply-editor 帖子回复111 Start-->
                            <div class="post-reply-editor clearfix">
                                <div class="ireply-container clearfix">
                                    <div class="v2-float-left ireply-avatar">
                                        <c:choose>
                                            <c:when test="${sessionScope.user!=null}">
                                                <img class="v2-radius3 common-avatar" alt=""
                                                     src="${pageContext.request.contextPath}/images/profile/face/${sessionScope.user.icon}">
                                            </c:when>
                                            <c:otherwise>
                                                <img class="v2-radius3 common-avatar"
                                                     src="${pageContext.request.contextPath}/images/profile/face/default.jpg"
                                                     alt="">
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="v2-float-left ireply-main">

                                        <form id="ireplyForm" onsubmit="return false" action="${pageContext.request.contextPath}/community/post">
                                            <input type="hidden" name="fid" value="${requestScope.forum.fid}">
                                            <input type="hidden" name="tid" value="${requestScope.tid}">
                                            <input type="hidden" name="author" value="${requestScope.poster.username}">
                                            <input type="hidden" name="authorid" value="${requestScope.poster.userid}">
                                            <input type="hidden" name="type" value="reply">
                                            <div class="" style="width: 560px; z-index: 30;">
                                                <textarea id="replyInput" autocomplete="off" name="message"></textarea>
                                            </div>

                                            <div class="ireply-buttons">
                                                <c:if test="${sessionScope.user!=null}">
                                                <a class="v2-button reversed larger fr" href="javascript:;"
                                                   id="ireplySend">发 布</a>
                                                <div class="successtip-template"
                                                     style="text-align:left;position:relative;display:none; top:-144px; left:206px; height:48px;line-height:48px; width:130px;z-index:50; background-color:#fff;border: 1px solid #ccc;border-radius:2px;">
                                                    <div style="position: absolute; width: 99%; top: -37px; color:#f70;font-size:12px; text-align: center;"
                                                         class="successtip-experience"></div>
                                                    <div style="margin:0 0 0 50px;width: 78px;height: 27px;font-size:16px;">
                                                        <span style="color:#555;font-family: '微软雅黑';">发表成功</span>
                                                        <span class="successtip-plus-one"
                                                              style="font-size:13px;position:absolute;left:110px;top:10px"></span>
                                                    </div>
                                                </div>
                                                </c:if>
                                                <span class="poster-posting-status" style="display: none"></span>
                                            </div>
                                        </form>
                                        <script>
                                           /* $('#empty-tip').find('input[type=button]').on('click',function () {
                                                $('#empty-tip').toggleClass("i-show");
                                            });*/
                                            $('#ireplySend').on('click',function () {
                                                if (UE.getEditor('replyInput').getContent()==""){
                                                    /*$('#empty-tip').toggleClass("i-show");*/
                                                    alert("回复内容不能为空")
                                                } else {
                                                    var form = $('#ireplyForm');
                                                    console.log(form.attr('action'));
                                                    console.log(form.serialize());
                                                    $.ajax({
                                                        url: form.attr('action'),
                                                        type: 'post',
                                                        data: form.serialize(),
                                                        success: function (data) {
                                                            console.log(data);
                                                            $('.successtip-template').css('display','block');
                                                            setTimeout(function () {
                                                                window.location.reload();
                                                            },1000);
                                                        }
                                                    })
                                                }
                                            });
                                        </script>
                                    </div>
                                    <!--<div class="v2-clear">-->
                                    <!--</div>-->
                                </div>
                            </div>
                            <!--post-reply-editor 帖子回复 end-->
                        </div>


                    </div>
                    <!-- 内容 左 end   -->

                    <!-- 右侧内容 -->
                    <div class="post-index-right fr">
                        <div class="post-fixed-wrapper" style="top: -888px; position: static; left: 953px;">
                            <!--关于楼主Poster-->
                            <div class="poster-wrapper">
                                <!--poster 关于楼主 START-->
                                <div class="post-poster">
                                    <h3 class="header">
                                        关于楼主
                                    </h3>

                                    <img class="v2-float-left v2-rect54 common-avatar" alt=""
                                         src="${pageContext.request.contextPath}/images/profile/face/${requestScope.poster.icon}">

                                    <div class="aboutlz-name v2-float-left">
                                        <div class="v2-f14 clearfix">
                                            <a class="underline-hover poster-name"
                                               href="/usercenter/index?uid=0LW7rZbDl7GY" target="_blank">
                                                ${requestScope.poster.username}
                                            </a>

                                           <%-- <a href="javascript:;" class="v2-follow follow aboutlz-follow follow-user"
                                               data-meta="{&quot;des_id&quot;:&quot;0LW7rZbDl7GY&quot;}">
                                                <i>+</i>
                                                关注
                                            </a>--%>

                                        </div>
                                        <div class="aboutlz-level">
                                            <div class="level-title" <%--title="点击查看等级头衔说明"--%>>
                                                <span>${requestScope.poster.rankTitle}</span>
                                                <span class="lv-badge lv${requestScope.poster.rank}"></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="v2-clear">
                                    </div>

                                    <ul class="aboutlz-numbers">
                                        <li class="v2-float-left">

                                            <a href=" /usercenter/questionlist?uid=0LW7rZbDl7GY" target="_blank">
                                                <div class="v2-f16 v2-bold v2-c333 forcehover orange-hover">
                                                    ${requestScope.poster.posts}
                                                </div>
                                                <div class="v2-f14 ">
                                                    发帖
                                                </div>
                                            </a>
                                        </li>
                                        <li class="v2-float-left">
                                            <a href=" /usercenter/index?uid=0LW7rZbDl7GY" target="_blank">
                                                <div class="v2-f16 v2-bold v2-c333 forcehover orange-hover">
                                                    ${requestScope.poster.replies}
                                                </div>
                                                <div class="v2-f14 ">
                                                    回复
                                                </div>
                                            </a>
                                        </li>
                                        <%--  <li class="v2-float-left">
                                              <a href=" /usercenter/fans?uid=0LW7rZbDl7GY" target="_blank">
                                                  <div class="v2-f16 v2-bold v2-c333 forcehover orange-hover">
                                                      133
                                                  </div>
                                                  <div class="v2-f14 ">
                                                      关注
                                                  </div>
                                              </a>
                                          </li>
                                          <li class="v2-float-left">
                                              <a href="/usercenter/index?uid=0LW7rZbDl7GY&amp;order=hs" target="_blank">
                                                  <div class="v2-f16 v2-bold v2-c333 forcehover orange-hover">
                                                      1.0k                </div>
                                                  <div class="v2-f14 ">
                                                      赞
                                                  </div>
                                              </a>
                                          </li>--%>
                                    </ul>
                                    <div class="v2-clear">
                                    </div>
                                </div>


                                <!--poster 关于楼主 END-->
                            </div>

                            <!--吧主-->
                            <%--  <div class="post-topic-manager-wrapper">
                                  <div class="post-topic-manager">
                                      <div class="topic-user-masters">
                                          <div class="clearfix">
                                              <h3 class="header fl">大吧主</h3>
                                              <a href="javascript:;" class="fr bazhu-link" onclick="YUBA.topicManager.applyTopicManager('12')">
                                                  <i class="bazhu-huangguan"></i>[申请小吧主]
                                              </a>
                                          </div>
                                          <ul>
                                              <li>
                                                  <a class="lord-widget" href="/usercenter/index?uid=Mn7MBBRlmwj2">
                                                      <img src="https://apic.douyucdn.cn/upload/avatar/face/201608/12/090f233b7eabde1c9a35db5e160a748c_small.jpg?rltime=1495513183" class=" common-avatar" data-="/usercenter/ajaxuserdetail?uid=Mn7MBBRlmwj2&amp;tid=12">
                                                  </a>
                                                  <div class="topic-user-master-text">
                                                      <p class="member">
                                                          <a target="_blank" class="underline-hover orange-hover" href="/usercenter/index?uid=Mn7MBBRlmwj2" title="叼蟾">
                                                              叼蟾                        </a>
                                                      </p>
                                                      <p>141  人关注</p>
                                                  </div>
                                                  <div class="topic-user-popusers-button">
                                                      <a href="javascript:;" class="follow radius3 topic-user-popusers-button-item follow-user" data-meta="{&quot;des_id&quot;:&quot;Mn7MBBRlmwj2&quot;}">
                                                          <i>+</i>
                                                          关注
                                                      </a>


                                                  </div>
                                                  <div class="topic-clear"></div>
                                              </li>
                                              <li>
                                                  <a class="lord-widget" href="/usercenter/index?uid=2peApe3x47lJ">
                                                      <img src="https://apic.douyucdn.cn/upload/avatar/face/201606/01/b7c01f736ed2ba33fa88b76db3397a5b_small.jpg?rltime=1495513183" class=" common-avatar" data-="/usercenter/ajaxuserdetail?uid=2peApe3x47lJ&amp;tid=12">
                                                  </a>
                                                  <div class="topic-user-master-text">
                                                      <p class="member">
                                                          <a target="_blank" class="underline-hover orange-hover" href="/usercenter/index?uid=2peApe3x47lJ" title="kwillovip">
                                                              kwillovip                        </a>
                                                      </p>
                                                      <p>29  人关注</p>
                                                  </div>
                                                  <div class="topic-user-popusers-button">
                                                      <a href="javascript:;" class="follow radius3 topic-user-popusers-button-item follow-user" data-meta="{&quot;des_id&quot;:&quot;2peApe3x47lJ&quot;}">
                                                          <i>+</i>
                                                          关注
                                                      </a>


                                                  </div>
                                                  <div class="topic-clear"></div>
                                              </li>
                                              <li>
                                                  <a class="lord-widget" href="/usercenter/index?uid=1VwKn2RK574l">
                                                      <img src="https://apic.douyucdn.cn/upload/avanew/face/201612/01/15/941a50bd2e0774ef77f8dbf4d363b68c_small.jpg?rltime=1495513183" class=" common-avatar" data-="/usercenter/ajaxuserdetail?uid=1VwKn2RK574l&amp;tid=12">
                                                  </a>
                                                  <div class="topic-user-master-text">
                                                      <p class="member">
                                                          <a target="_blank" class="underline-hover orange-hover" href="/usercenter/index?uid=1VwKn2RK574l" title="木茶茶">
                                                              木茶茶                        </a>
                                                      </p>
                                                      <p>38  人关注</p>
                                                  </div>
                                                  <div class="topic-user-popusers-button">
                                                      <a href="javascript:;" class="follow radius3 topic-user-popusers-button-item follow-user" data-meta="{&quot;des_id&quot;:&quot;1VwKn2RK574l&quot;}">
                                                          <i>+</i>
                                                          关注
                                                      </a>


                                                  </div>
                                                  <div class="topic-clear"></div>
                                              </li>
                                          </ul>
                                      </div>
                                  </div>
                                  </div>--%>

                            <!-- 用户活跃榜 -->
                            <jsp:include page="activesRank.jsp"/>


                        </div>
                        <div id="fixedReplacer" class="bg-transparent" style="height: 1158px; display: none;"></div>

                    </div>
                    <!-- 右侧内容 -->

                    <!--隐藏的回复模板 start-->
                    <%--<div class="post-hiden">
                        <!--回复模板  start-->
                        <div class="post-reply-template">
                            <!--帖子回复评论模板 start-->
                            <div id="reply-tpl-reply" style="display:none;">
                                <dl class="reply-comments-dl">
                                    <dt class="v2-float-left reply-comments-dt">
                                        <img class="v2-radius3 " alt="" data-src="%avatar%">
                                    </dt>
                                    <dd class="reply-comments-dd">
                                        <div class="reply-comments-content v2-f13 v2-ccontent">
                                            <a class="reply-comments-user underline-hover"
                                               href="/usercenter/index?uid=%uid%">%nickname%</a>
                                            ：%commenttext%
                                        </div>
                                        <div class="reply-comments-status shown-on-hover-wrapper">
                    <span class="v2-c999 fabuyu report-margin-left">
                        <a class="v2-c999 post-edit orange-hover mydelete" onclick="YUBA.post.postDetailDelClick(this);"
                           href="javascript:;">
                            删除
                        </a>
                        <!--发布于-->刚刚
                    </span>
                                            <a href="javascript:;"
                                               class="v2-c999 qdelete-trigger masterdelete barowner">吧主删除</a>
                                            <a href="javascript:;"
                                               class="v2-c999 ban-trigger accountstop barowner">账号封停</a>
                                            <!--                    <a href="javascript:;" style="margin-right:4px" class="v2-c999 ban-trigger ipstop barowner">IP封停</a>-->
                                        </div>
                                    </dd>
                                </dl>
                            </div>
                            <!--帖子回复评论模板 end-->

                            <!--帖子回复评论的回复模板 start-->
                            <div id="reply-tpl-replyto" style="display:none;">
                                <dl class="reply-comments-dl">
                                    <dt class="v2-float-left reply-comments-dt">
                                        <img class="v2-radius3 " alt="" data-src="%avatar%">
                                    </dt>
                                    <dd class="reply-comments-dd">
                                        <div class="reply-comments-content v2-f13 v2-ccontent">
                                            <a class="reply-comments-user underline-hover"
                                               href="/usercenter/index?uid=%uid%">%nickname%</a>
                                            <span class="">回复</span>
                                            <a class="reply-comments-user underline-hover"
                                               href="/usercenter/index?uid=%to_uid%">%to_nickname%</a>
                                            ：%commenttext%
                                        </div>
                                        <div class="reply-comments-status shown-on-hover-wrapper">
                    <span class="v2-c999 fabuyu report-margin-left">
                        <a class="v2-c999 post-edit orange-hover mydelete" onclick="YUBA.post.postDetailDelClick(this);"
                           href="javascript:;">
                            删除
                        </a>
                        <!--发布于-->刚刚
                    </span>
                                            <a href="javascript:;"
                                               class="v2-c999 qdelete-trigger masterdelete barowner">吧主删除</a>
                                            <a href="javascript:;"
                                               class="v2-c999 ban-trigger accountstop barowner">账号封停</a>
                                            <!--                    <a href="javascript:;" style="margin-right:4px" class="v2-c999 ban-trigger ipstop barowner">IP封停</a>-->
                                        </div>
                                    </dd>
                                </dl>
                            </div>
                            <!--帖子回复评论的回复模板 end-->
                        </div>
                        <!--回复模板 end-->
                    </div>--%>
                    <!--隐藏的回复模板 end-->

                    <!--postReplyNavigator 楼层导航-->
                    <div class="post-reply-navigator-wrapper">
                        <!--postReplyNavigator 右侧-快速回复 START-->
                        <div class="post-reply-navigator lift-nav lift-nav-append lift-nav-maxwidth"
                             style="margin-right: -594px;">
                           <%-- <div class="lift-nav-item">
                                <i class="lift-nav-icon lift-reply-icon"></i>
                                <span>快速回复</span>
                            </div>--%>
                        </div>
                        <!--postReplyNavigator 右侧-快速回复 END-->                    <!--postSideShare   右侧分享    start-->
                        <%--<div class="post-side-share lift-nav lift-nav-share lift-nav-maxwidth" data-name="DOTA2"
                             style="margin-right: -594px;">
                            <div class="lift-nav-item">
                                <a href="javascript:;" class="lift-nav-icon lift-share-icon"></a>
                                <a href="javascript:;" data-to="weixin"
                                   class="yb-side-shareicons yb-side-shareicons-weixin"></a>
                                <a href="javascript:;" data-to="tqq"
                                   class="yb-side-shareicons yb-side-shareicons-tweibo" target="_blank"></a>
                                <a href="javascript:;" data-to="qzone"
                                   class="yb-side-shareicons yb-side-shareicons-qzone" target="_blank"></a>
                                <a href="javascript:;" data-to="cqq" class="yb-side-shareicons yb-side-shareicons-qq"
                                   target="_blank"></a>
                                <a href="javascript:;" data-to="tsina"
                                   class="yb-side-shareicons yb-side-shareicons-weibo" target="_blank"></a>
                            </div>--%>
                            <div class="post-side-share-qrcode"></div>
                        </div>
                        <!--postSideShare   右侧分享    end-->
                    </div>
                    <!--postReplyNavigator 楼层导航 END-->


                </div>
                <!--  发帖内容部分  end   -->
            </div>
        </div>
    </div>


    <div id="empty-tip" class="i-dialog i-scale"
         style="z-index: 503; width: 300px; height: auto; position: fixed; display: block; top: 140px; left: 524px;">
        <div class="i-target"><h2 class="i-title">提示</h2><a href="javascript:void(0);" title="关闭" class="i-close">×</a>
        </div>
        <div class="i-content" style="padding: 20px;">回复内容不能为空</div>
        <div class="i-wrapBtn"><input type="button" value="确定" class="btn btn-orange"></div>
    </div>


    <!-- footer -->
    <jsp:include page="footer.jsp"/>

</div>

<script type="text/javascript">
    window.UEDITOR_HOME_URL = "../ueditor/";
    UE.getEditor('replyInput').ready(function () {
        //this是当前创建的编辑器实例
        if ("${sessionScope.user}"=="") {
            this.setDisabled();
            this.setContent('<div style="text-align: center;">登录才可以回复哦~</div>');
        } else {
            this.setEnabled();
           /* this.setContent('输入回复内容');*/
        }
    });
</script>

</body>
</html>
