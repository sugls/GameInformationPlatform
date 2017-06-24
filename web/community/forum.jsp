<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <title>游戏信息交流平台</title>
</head>
<body>

<div class="outer-layer outer-layer-index">

    <!-- header -->
    <jsp:include page="header.jsp"/>

    <!--顶部导航-->
    <div class="lift-nav lift-nav-maxwidth" style="margin-right: -594px;">
        <div class="lift-nav-item lift-top" style="display: none;">
            <i class="lift-nav-icon lift-top-icon"></i>
            <span>回到顶部</span>
        </div>
    </div>


    <div class="all-main-wrapper" style="margin-left: 77px;">
        <div class="anchor-out-wrapper">
            <div class="anchor-topic-wrapper">

                <div class="anchor-header">
                    <img class="anchor-header-bgimg" src="../images/forum/${requestScope.forum.icon}" alt="">
                    <div class="anchor-icon-img-out">
                        <img class="anchor-icon-img" src="../images/forum/${requestScope.forum.icon}" alt="">
                    </div>
                    <div class="anchor-info-div">
                        <span id="topicNameWrapper" class="anchor-name" data-tid="1063"
                              data-fid="515">${requestScope.forum.name}</span>
                        <div class="anchor-properties">
                            <span class="anchor-focusers-num">${requestScope.forum.threads}</span>
                            <span class="anchor-focusers-label">主题</span>
                            <span class="anchor-header-splitLine"></span>
                            <span class="anchor-postCount-num">${requestScope.forum.posts}</span>
                            <span class="anchor-postCount-label">帖子</span>
                        </div>
                        <span class="anchor-info-shadow"><p class="anchor-info" readonly=""
                                                            cols="0">${requestScope.forum.desc}</p></span>
                    </div>
                </div>
                <div class="anchor-nav">
                    <div class="anchor-nav-tab">
                        <ul class="anchor-nav-inner" id="thread-nav">
                            <li class="anchor-nav-tab-item">
                                <a class="anchor-nav-tab-itema active" data-type="newest">
                                    <span class="anchor-nav-tab-homepage ">最新</span>
                                </a>
                            </li>
                            <li class="anchor-nav-tab-item">
                                <a class="anchor-nav-tab-itema" data-type="hot">
                                    <span class="anchor-nav-tab-dynamic-state">最热</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <%--<div class="anchor-nav-right">
                        <!--<span class="anchor-orgBtn anchor-signBtn">签到</span>-->
                        &lt;%&ndash;<a href="javascript:void(0);" class="level-sign-btn anchor-signBtn" id="level-sign-btn" data-tid="1063">
                            签到
                        </a>&ndash;%&gt;

                        &lt;%&ndash;<div class="post-topic-level-profile">
                            <div class="anchor-nav-level">
                                <span class="level-title" title="点击查看等级头衔说明">尚未加入</span>
                                <span class="lv-badge"></span>
                            </div>
                            <div class="anchor-progress-wrapper">
                                <div class="lv-progress-wrapper">
                                    <div class="lv-progress" style="width: 0px;"></div>
                                    <div class="lv-progress-content">0/0</div>
                                </div>
                                <a href="javascript:void(0);" id="level-helper">
                                    <i class="level-question"></i>
                                </a>
                            </div>
                        </div>&ndash;%&gt;
                    </div>--%>
                </div>

                <div class="anchor-topic-tabs-wrapper">

                    <div class="anchor-list-div">
                        <div class="zb-content fl">
                            <div class="zb-content-list">
                                <div class="zb-content-header">
                                    <i></i>
                                    全部帖子
                                </div>
                            </div>

                            <div class="zb-list" id="zballtiezi">
                                <%-- 帖子列表  forumthreadslist.jsp --%>
                            </div>


                            <div id="showmore" class="idx-list-more">
                                <div id="loading" style="display: none" class="idx-list-more"><img
                                        src="../images/loader.white.gif" alt=""></div>
                                <a href="javascript:;" data-pages="1" id="indexLoadmoreBtn" class="idx-list-more"
                                   style="display: block;">点击加载更多</a>
                                <div id="nodata" style="display: none" class="idx-list-more">没有更多数据了😂</div>
                            </div>

                        </div>

                        <div class="clear"></div>

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
                                            <%--<input type="hidden" name="tid" value="${requestScope.tid}">--%>
                                            <input type="hidden" name="author" value="${sessionScope.user.username}">
                                            <input type="hidden" name="authorid" value="${sessionScope.user.userid}">
                                            <input type="hidden" name="type" value="post">

                                            <div class="" style="width: 560px; /*z-index: 30;*/">
                                                <input type="text" name="subject" id="subject" placeholder="输入帖子标题" style="width: 560px;height: 30px;margin-bottom: 10px;text-indent: 1em;">
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
                                            $('#ireplySend').on('click', function () {
                                                if ($('#subject').val().trim()==''){
                                                    alert("发帖标题不能为空");
                                                } else if (UE.getEditor('replyInput').getContent() == "") {
                                                    /*$('#empty-tip').toggleClass("i-show");*/
                                                    alert("发帖内容不能为空")
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
                                                            $('.successtip-template').css('display', 'block');
                                                            alert("发表成功！");
                                                            /*setTimeout(function () {*/
                                                                window.location.reload();
                                                           /* }, 1000);*/
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

                </div>

                <div class="anchor-index-right post-index-right">

                    <div class="post-fixed-wrapper" style="top: -343px; position: static; left: 953px;">

                        <%--<div class="anchor-wrapper">
                            <div class="anchor-info-title">
                                <h3>管理员</h3>
                                <span class="anchor-manager-count">0人</span>
                                <a href="javascript:void(0);" id="manager-helper">
                                    <i class="level-question manager-help-level-right"></i>
                                </a>

                                <a href="javascript:;" class="fr anchor-manager-apply-entry" data-tid="1063">
                                    <i class="anchor-manager-apply-icon"></i>[申请管理员]
                                </a>
                            </div>

                            <div class="anchor-manager-list-wrapper">
                                <p class="anchor-manager-right-tip">暂时没有有管理员呢~</p>
                            </div>

                        </div>--%>

                        <!-- 用户活跃榜 -->
                        <jsp:include page="activesRank.jsp"/>

                    </div>

                    <div id="fixedReplacer" class="bg-transparent" style="height: 922px; display: none;"></div>
                </div>

            </div>
        </div>
    </div>

    <!-- footer -->
    <jsp:include page="footer.jsp"/>

</div>
<script type="text/javascript">
    window.UEDITOR_HOME_URL = "../ueditor/";
    UE.getEditor('replyInput').ready(function () {
        //this是当前创建的编辑器实例
        if ("${sessionScope.user}" == "") {
            this.setDisabled();
            this.setContent('<div style="text-align: center;">登录才可以发帖哦~</div>');
        } else {
            this.setEnabled();
            /* this.setContent('输入回复内容');*/
        }
    });

    $(function () {
        var fid = ${requestScope.forum.fid};
        function loadHot(pages) {
            $.ajax({
                url: '${pageContext.request.contextPath}/community/getThreadsByFid',
                type: 'get',
                data: {
                    'type': 'hot',
                    'pages': pages,
                    'fid': fid
                },
                success: function (data) {
                    $('#zballtiezi').append(data);
                }
            })
        }
        var showMoreReset = function () {
            $('#showmore').css('display','block');
            $('#loading').css('display','none');
            $('#nodata').css('display','none');
            $('#indexLoadmoreBtn').css('display','block');
            $('#indexLoadmoreBtn').data('pages',1);
        };
        function loadNewest(pages) {
            $.ajax({
                url: '${pageContext.request.contextPath}/community/getThreadsByFid',
                type: 'get',
                data:{
                    'pages':pages,
                    'type': 'newest',
                    'fid': fid
                },
                beforeSend: function () {

                },
                success: function (data) {
                    $('#zballtiezi').append(data);
                    showMoreReset();
                }
            })
        }

        loadNewest(1);  // 初始页面

        $('#indexLoadmoreBtn').bind('click',function () {
            var pages = $(this).data('pages');
            $(this).data('pages',pages+1);
            var type = $('#thread-nav li').children('.active').data('type');
            $.ajax({
                type: 'get',
                url: '${pageContext.request.contextPath}/community/getThreadsByFid',
                data: {
                    'type': type,
                    'pages': $(this).data('pages'),
                    'fid': fid
                },
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
                        $('#zballtiezi').append(body);
                        $('#indexLoadmoreBtn').css('display','block');
                        $('#loading').css('display','none');
                    }
                },
                error: function (data) {
                    $('#showmore').html("error: " + data.responseText);
                }
            });
        });
        // 最新
        $('#thread-nav').children().eq(0).on('click',function () {
            $(this).parent().find('.active').removeClass('active');
            $(this).children('a').addClass('active');
            $('#zballtiezi').html('');
            loadNewest(1);
            showMoreReset();
        });
        // 最热
        $('#thread-nav').children().eq(1).on('click',function () {
            $(this).parent().find('.active').removeClass('active');
            $(this).children('a').addClass('active');
            $('#zballtiezi').html('');
            loadHot(1);
            showMoreReset();
        });

    });


</script>
</body>
</html>