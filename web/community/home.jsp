<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <title>Game Information Community</title>
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



    <%--<div class="web-message-wrapper">
        <div class="message-active">
            <span id="webMsgIcon" class="web-message-icon-active"></span>

            <span class="web-message-active-title">站内信</span>

        </div>
        <div class="message-frame-wrapper">
            <iframe id="web_message_frame" name="web_message_frame" class="message-frame"
                    src="./鱼吧-斗鱼社区,直播爱好者的聚集地_files/saved_resource.html" data-src="//msg.douyu.com/web/index.html"
                    frameborder="0"></iframe>
        </div>

    </div>--%>
    <!-- 主体 -->
    <div id="indexmaincontainer" class="homepage-padding-top" style="min-height: 1200px;">
        <div class="all-main-wrapper" style="margin-left: 77px;">
            <div class="homepage-content">
                <!--中间板块-->
                <div id="idxdefaultcontent">
                    <div class="idx-hotgroup">
                        <div class="idx-hotgroup-header">
                            <strong>版块分类</strong>
                        </div>
                        <!--热门推荐-->
                        <div class="idx-hotgroup-content">
                            <div class="idx-hotgroup-items" id="indexhotgroup">
                                <c:forEach var="forum" items="${sessionScope.get('forums')}">

                                    <a target="" href="${pageContext.request.contextPath}/community/forum?fid=${forum.fid}">
                                        <div class="idx-hotgroup-item fl">
                                            <div class="idx-hotgroup-photo">
                                                <img class="fl idx-avatarborder"
                                                     src="../images/forum/${forum.icon}"
                                                     alt="">
                                                <div class="cover"></div>
                                                <div class="not-join-icon"></div>
                                            </div>

                                            <div class="fl idx-hotgroup-item-desc">
                                                <strong><i></i> <span>${forum.name}</span></strong>
                                                <p class="idx-hotgroup-item-text">${forum.desc}</p>
                                                <p class="idx-hotgroup-item-focus-hot">
                                                    <span class="idx-hotgroup-item-title">主题</span><span
                                                        class="idx-hotgroup-item-num">${forum.threads}</span>
                                                    <b>|</b>
                                                    <span class="idx-hotgroup-item-title">贴数</span><span
                                                        class="idx-hotgroup-item-num">${forum.posts}</span>
                                                </p>
                                            </div>
                                        </div>
                                    </a>


                                </c:forEach>
                            </div>
                            <div class="clear"></div>
                        </div>


                    </div>


                    <div class="index-content-block">
                        <!--内容列表-->
                        <div class="index-content-tab">
                            <div class="content-nav" id="index-maintab">
                                <a target="_self" href="javascript:;" data-ajax-url="${pageContext.request.contextPath}/community/getThreads?type=hot" class="active" id="firsttab">热门帖子</a>
                                <a target="_self" href="javascript:;" id="dynamictab">我的板块</a>
                                <a target="_self" href="javascript:;" id="anchortab">我的关注</a>
                                <a target="_self" href="javascript:;" data-ajax-url="${pageContext.request.contextPath}/community/getThreads?type=newest" id="fourthtab">最新帖子</a>

                                <script>
                                    

                                    
                                </script>

                            </div>
                            <div class="idx-list">
                                <div class="idx-list-wrapper" id="contentList" style="min-height: 0px;">
                                    <div id="idxlist_2">

                                    </div>
                                </div>
                                <div id="showmore" class="idx-list-more">
                                    <div id="loading" style="display: none" class="idx-list-more"><img src="../images/loader.white.gif" alt=""></div>
                                    <a href="javascript:;" data-pages="1" id="indexLoadmoreBtn" class="idx-list-more"
                                       style="display: block;">点击加载更多</a>
                                    <div id="nodata" style="display: none" class="idx-list-more">没有更多数据了😂</div>
                                </div>
                            </div>
                        </div>

                        <!-- 首页右侧区域-->
                        <div class="index-content-right post-index-right">

                            <div class="post-fixed-wrapper" style="top: -327px; position: static;">
                                <!-- 首页用户活跃榜-->
                                <jsp:include page="activesRank.jsp"/>

                            </div>
                            <div id="fixedReplacer" class="bg-transparent" style="height: 934px; display: none;"></div>
                        </div>

                    </div>
                </div>


                <!--搜索使用这段 隐藏默认段-->
                <div id="idxsearchcontent" style="display:none"></div>

            </div>
        </div>
    </div>


    <!-- footer -->
    <jsp:include page="footer.jsp"/>

</div>

<script>

    $(function () {
       function loadHot() {
           $.get("${pageContext.request.contextPath}/community/getThreads?type=hot",{'pages':1},function (result) {
               $('#idxlist_2').html(result);
           });
       }
       var showMoreReset = function () {
           $('#showmore').css('display','block');
           $('#loading').css('display','none');
           $('#nodata').css('display','none');
           $('#indexLoadmoreBtn').css('display','block');
           $('#indexLoadmoreBtn').data('pages',1);
       };
       function loadNewest() {
           $.ajax('${pageContext.request.contextPath}/community/getThreads?type=newest',{
               data:{'pages':'1'},
               beforeSend: function () {

               },
               success: function (result) {
                   $('#idxlist_2').html(result);
                   showMoreReset();
               }
           })
       }
       loadHot();
       $('#indexLoadmoreBtn').bind('click',function () {
           var pages = $(this).data('pages');
           $(this).data('pages',pages+1);
           var url = $('#index-maintab').children('.active').data('ajax-url');
           $.ajax({
               type: 'get',
               url: url,
               data: {'pages':$(this).data('pages')},
               beforeSend: function () {
                   $("#loading").css('display','block');
                   $('#indexLoadmoreBtn').css('display','none');
               },
               success:function (result) {
                   console.log(result);
                   var body = result.substring(result.indexOf('<body>')+6,result.indexOf('</body>')).trim();
                       console.log(body);
                   if (body==""){
                        $('#indexLoadmoreBtn').css('display','none');
                        $('#nodata').css('display','block');
                        $('#loading').css('display','none');

                    } else {
                        $('#idxlist_2').append(body);
                        $('#indexLoadmoreBtn').css('display','block');
                        $('#loading').css('display','none');
                    }
               },
               error: function (data) {
                   $('#showmore').html("error: " + data.responseText);
               }
           });
       });





        $('#firsttab').on('click',function () {
            $(this).parent().children('.active').removeClass('active');
            $(this).addClass('active');
            loadHot();
            showMoreReset();
        });


        $('#fourthtab').on('click',function () {
            $(this).parent().children('.active').removeClass('active');
            $(this).addClass('active');
            loadNewest();
            showMoreReset();
        })
       
    });


</script>
</body>
</html>