<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="UTF-8" %>
<!doctype html>
<html lang="zh_CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="../css/forum/main.css">

    <link rel="stylesheet" href="../css/forum/anchor.bundle.css">

    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor/lang/zh-cn/zh-cn.js"></script>



    <style>
        #header .head-logo{
            color: #111;
            font-weight: bold;
            display: block;
            padding-top: 13px;
            height: 35px;
            width: 145px;
        }
        #header .head-nav .assort .a-pop {width:145px;}


        .edui-container *{
            -webkit-box-sizing: content-box;
            -moz-box-sizing: content-box;
            box-sizing: content-box;
        }

        .edui-container *:before,
        .edui-container *:after {
            -webkit-box-sizing: content-box;
            -moz-box-sizing: content-box;
            box-sizing: content-box;
        }
    </style>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/bootstrapValidator.min.css">
    <link rel="stylesheet" href="../css/font-awesome.min.css">
    <link rel="stylesheet" href="../css/login.css">
    <script src="../js/jquery-1.12.4.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/bootstrapValidator.min.js"></script>
    <script src="../js/forum/community.js"></script>
    <script>
        $(document).ready(function () {
            $('.u-message'+'.fl').hover(function () {
                $('#noti-dropdown').css('display','block');
            },function () {
                $('#noti-dropdown').css('display','none');
            });
            $('.u-login'+ '.fl').bind('click',function () {
                if ( $('.subnav').css('display')=='none'){
                    $('.subnav').css('display','block');
                    $('.drop-triangle').addClass('rotate180');
                } else {
                    $('.subnav').css('display','none');
                    $('.drop-triangle').removeClass('rotate180');
                }
            })

        })
    </script>

    <script>
        $(document).ready(function () {
            var iTop = $('#indexfixsearch').offset().top;
            var oTop =  $(".post-fixed-wrapper").height();
            var sTop = 0;
            $(window).scroll(function(){
                sTop = $(this).scrollTop();
                if (sTop >= iTop){
                    $('#indexfixsearch').css({'position':'fixed','top':'51px','z-index':'40'});
                    $('.idx-search-shadow').css('display','block');
                    $('#searchReplace').css('display','block');
                } else {
                    $('#indexfixsearch').css('position','static');
                    $('.idx-search-shadow').css('display','none');
                    $('#searchReplace').css('display','none');
                }
                if(sTop >= oTop){
                    $(".post-fixed-wrapper").css({"position":"fixed","top":oTop-sTop});
                    $('#fixedReplacer').css('display','block');

                }else{
                    $(".post-fixed-wrapper").css({"position":"static"});
                    $('#fixedReplacer').css('display','none');

                }
            });

        });
    </script>
</head>
<body>

<div id="header">
    <div class="head">
        <a class="head-logo fl" href="${pageContext.request.contextPath}/"><span class="h4">游戏信息交流平台</span></a>
        <ul class="head-nav fl">
            <li class="fl assort ">
                <a href="${pageContext.request.contextPath}/staticdata/champions">英雄数据</a>
                <i></i>
                <div class="a-pop" style="display:none;">
                    <i></i>
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/staticdata/champions">英雄数据</a></li>
                        <li><a href="">装备数据</a></li>
                    </ul>
                </div>
            </li>
            <li class="fl funny ">
                <a href="${pageContext.request.contextPath}/leaderboard/challenger" target="">排行榜</a>
                <i></i>
            </li>
            <li class="fl live">
                <a href="${pageContext.request.contextPath}/video/videos">视频</a>
            </li>
            <li class="fl yuba current">
                <a href="${pageContext.request.contextPath}/community/index" target="_self">社区</a>
            </li>
        </ul>

        <c:if test="${sessionScope.user!=null}">
            <div id="com-userbar" class="head-oth fr">
                <div class="u-message fl" id="m4">
                    <%--<a style="color: #000">
                        <i class="fa fa-bell"></i>
                        <div class="msg" style="display: block; ">2</div>
                        消息
                    </a>--%>
                    <%--<div class="noti-dropdown" id="noti-dropdown">
                        <div class="noti-dropdown-caret"></div>
                        <div class="noti-dropdown-tabs">
                            <a href="javascript:;" data-target="noti-dropdown-messages" class="actived">
                                消息
                                <div class="noti-item-floating-label messages" style="display:none;"></div>
                            </a>
                            <a href="javascript:;" data-target="noti-dropdown-followers">
                                关注
                                <div class="noti-item-floating-label followers" style="display:none;"></div>
                            </a>
                        </div>
                        <div class="noti-dropdown-content">
                            <ul class="noti-dropdown-item" id="noti-dropdown-messages">
                            </ul>
                            <ul class="noti-dropdown-item" id="noti-dropdown-followers" style="display:none;">
                            </ul>
                        </div>
                        <div class="noti-dropdown-footer">
                            <a href="">查看全部</a>
                        </div>
                    </div>--%>
                </div>
                <div class="u-login fl">
                    <div class="u-namecard">
                        <img class="u-bar-icon"
                             src="${pageContext.request.contextPath}/images/profile/face/${sessionScope.user.icon}">
                        <span class="u-name-title" id="meDetails" href="/usercenter">${sessionScope.user.username}</span>
                        <i class="drop-triangle"></i>
                        <div class="subnav">
                            <div class="unav-dropdown-caret"></div>
                            <h4>${sessionScope.user.username}</h4>
                            <ul>
                                <li><span>
                                  <i class="fa fa-user-o"></i>
                                  <a class="user_icon1" href="${pageContext.request.contextPath}/community/user?id=${sessionScope.user.userid}"
                                     target="_blank">我的主页</a></span></li>
                                <li><span>
                                  <i class="fa fa-cog"></i>
                                  <a class="user_icon2" href="${pageContext.request.contextPath}/profile"
                                     target="_blank">个人信息</a></span></li>
                                <li><span>
                                  <i class="fa fa-sign-out"></i>
                                  <a class="user_icon3" href="javascript:;" onclick="$.getJSON('logout',null,function(data) {
                                    console.log(data);window.location.reload();
                                  })">退出账号</a></span></li>
                            </ul>
                        </div>
                    </div>
                </div>


            </div>
        </c:if>
        <c:if test="${sessionScope.user==null}">
            <div id="com-userbar" class="head-oth fr">
                <div class="u-login fl">
                    <div class="u-unlogin">
                        <nav class="unlogin-nav">
                            <ul class="">
                                <li><a class="cd-signin" href="#0">登录</a></li>
                                |
                                <li><a class="cd-signup" href="#0">注册</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </c:if>

    </div>
</div>

<!-- 顶部搜素 -->
<div class="search-out-wrapper" style="margin-left: 77px;">
    <div class="search-margin">
        <div class="idx-search" id="indexfixsearch">
            <form target="_self" action="javascript:;">
                <div class="idx-search-wrapper">
                    <input maxlength="38" id="ybsearch" autocomplete="off" type="text" class="idx-search-k"
                           placeholder="搜索感兴趣的话题">
                    <input type="button" value="搜索" class="idx-search-btn">
                    <div class="idx-search-shadow" style="display: none"></div>
                </div>
            </form>
            <div class="ybsearch" id="ybsearchwrapper" style="display: none"></div>
        </div>
        <!--当搜索fixed的时候；该部分显示占位；防止屏幕抖动-->
        <div id="searchReplace" style="height: 40px;display: none"></div>
    </div>
</div>

<div class="cd-user-modal">
    <div class="cd-user-modal-container">
        <ul class="cd-switcher">
            <li><a href="#0">用户登录</a></li>
            <li><a href="#0">注册新用户</a></li>
        </ul>

        <div id="cd-login"> <!-- 登录表单 -->
            <form class="cd-form" id="login-form" method="post">
                <div class="form-group">
                    <div class="form-group-lg">
                        <input placeholder="请输入用户名" type="text" class="form-control" name="username" />
                    </div>
                </div>
                <div class="form-group">
                   <div class="form-group-lg">
                       <input type="password" placeholder="请输入密码" class="form-control" name="password" />
                   </div>
                </div>
              <div class="form-group">
                  <div class="input-group">
                      <span id="captchaOperation" class="input-group-addon"></span>
                      <input placeholder="输入计算结果" class="input-lg form-control" type="text" value="" name="captcha">
                  </div>
              </div>
                <div class="form-group">
                    <input class="input" type="checkbox" value="">
                    <label>记住登录状态</label> <a href="" class="pull-right">忘记密码？</a>
                </div>
                <div class="form-group">
                    <button style="background-color: #337ab7" type="submit" id="login-submit" class="input-lg form-control btn btn-primary">登录</button>
                </div>
            </form>
        </div>


        <div id="cd-signup"> <!-- 注册表单 -->
            <form class="cd-form" id="register-form">
                <div class="form-group">
                    <div class="form-group-lg">
                        <input placeholder="用户名" autocomplete="false" type="text" class="form-control" name="username" />
                    </div>
                </div>
                <div class="form-group">
                    <div class="form-group-lg">
                        <input placeholder="邮箱,邮箱用于找回密码" type="email" class="form-control" name="email" />
                    </div>
                </div>
                <div class="form-group">
                    <div class="form-group-lg">
                        <input type="password" id="password-signup" placeholder="密码" class="input form-control" name="userpwd" />
                    </div>
                </div>
                <div class="form-group">
                    <div class="form-group-lg">
                        <input type="password" placeholder="确认密码" class="input form-control" name="repeat" />
                    </div>
                </div>
                <div class="form-group">
                    <input class="input" type="checkbox" name="agreement">
                    <label>我已阅读并同意 <a href="">《用户协议》</a></label>
                </div>
                <div class="form-group">
                    <button style="background-color: #337ab7" type="submit" name="submit" class="input-lg form-control btn btn-primary">注册新用户</button>
                </div>
            </form>
        </div>

        <a href="#0" class="cd-close-form">关闭</a>
    </div>
</div>


<script>

    jQuery(document).ready(function($){
        var $form_modal = $('.cd-user-modal'),
            $form_login = $form_modal.find('#cd-login'),
            $form_signup = $form_modal.find('#cd-signup'),
            $form_modal_tab = $('.cd-switcher'),
            $tab_login = $form_modal_tab.children('li').eq(0).children('a'),
            $tab_signup = $form_modal_tab.children('li').eq(1).children('a'),
            $main_nav = $('.unlogin-nav');

        //????????
        $main_nav.on('click', function(event){

            if( $(event.target).is($main_nav) ) {
                // on mobile open the submenu
                $(this).children('ul').toggleClass('is-visible');
            } else {
                // on mobile close submenu
                $main_nav.children('ul').removeClass('is-visible');
                //show modal layer
                $form_modal.addClass('is-visible');
                //show the selected form
                ( $(event.target).is('.cd-signup') ) ? signup_selected() : login_selected();
            }

        });

        //关闭modal
        $('.cd-user-modal').on('click', function(event){
            if($(event.target).is('.cd-close-form') ) {
                $form_modal.removeClass('is-visible');
            }
        });

        // 切换 tab
        $form_modal_tab.on('click', function(event) {
            event.preventDefault();
            ( $(event.target).is( $tab_login ) ) ? login_selected() : signup_selected();
        });

        function login_selected(){
            $form_login.addClass('is-selected');
            $form_signup.removeClass('is-selected');
            $tab_login.addClass('selected');
            $tab_signup.removeClass('selected');
        }

        function signup_selected(){
            $form_login.removeClass('is-selected');
            $form_signup.addClass('is-selected');
            $tab_login.removeClass('selected');
            $tab_signup.addClass('selected');
        }

        //验证码
        function randomNumber(min, max) {
            return Math.floor(Math.random() * (max - min + 1) + min);
        };
        function generateCaptcha() {
            $('#captchaOperation').html([randomNumber(1, 50), '+', randomNumber(1, 50), '='].join(' '));
        };
        generateCaptcha();

        // 表单验证
        $('#login-form').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'fa fa-ok',
                invalid: 'fa fa-remove',
                validating: 'fa fa-refresh'
            },
            fields: {
                username: {
                    message: '用户名验证失败',
                    validators: {
                        notEmpty: {
                            message: '用户名不能为空'
                        }
                    }
                },
                password: {
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        }
                    }
                },
                captcha:{
                    validators: {
                        callback: {
                            message: '验证码错误',
                            callback: function (value, validator) {
                                var items = $('#captchaOperation').html().split(' '), sum = parseInt(items[0]) + parseInt(items[2]);
                                return value == sum;
                            }
                        }
                    }
                }
            }
        }).on("success.form.bv",function(e){
            e.preventDefault();
            $.ajax({
             type:"post",
             url:"login",
             data: $('#login-form').serialize(),
             dataType:"json",
             success:function (data) {
             var d = eval("("+data+")");
             if (d.message != "登录成功！"){
             alert(d.message);
             } else {
             window.location.reload();
             }
             }
             });
        });

        $("#register-form").bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'fa fa-ok',
                invalid: 'fa fa-remove',
                validating: 'fa fa-refresh'
            },
            fields: {
                username: {
                    message: '用户名验证失败',
                    validators: {
                        notEmpty: {
                            message: '用户名不能为空'
                        },
                        stringLength: {
                            min: 3,
                            max: 18,
                            message: '用户名长度必须在3到18位之间'
                        },
                        regexp: {
                            regexp: /^[a-zA-Z0-9_]+$/,
                            message: '用户名只能包含大写、小写、数字和下划线'
                        },
                        callback: {
                            threshold : 3,
                            message: '用户名已存在',
                            callback: function (value,validator) {
                                var valid = false;
                                $.ajax({
                                    url:'checkUsername',
                                    data: {'username':value},
                                    type:'get',
                                    async: false,
                                    success:function (data) {
                                        var d = eval('('+data+')');
                                        valid =  d.valid;
                                    }
                                });
                                return valid;
                            }
                        }/*,
                        remote: {
                            url: 'checkUsername',//验证地址
                            message: '用户名已存在',//提示消息
                            delay :  2000,//每输入一个字符，就发ajax请求，服务器压力还是太大，设置2秒发送一次ajax（默认输入一个字符，提交一次，服务器压力太大）
                            type: 'get'//请求方式
                        }*/
                    }
                },
                userpwd: {
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        },
                        identical: {//相同
                            field: 'userpwd', //需要进行比较的input name值
                            message: '两次密码不一致'
                        }
                    }
                },
                email: {
                    validators: {
                        notEmpty: {
                            message: '邮箱不能为空'
                        },
                        emailAddress: {
                            message: '邮箱地址格式有误'
                        }
                    }
                },
                repeat: {
                    validators: {
                        notEmpty: {
                            message: '两次密码不一致'
                        },
                        identical: {//相同
                            field: 'userpwd', //需要进行比较的input name值
                            message: '两次密码不一致'
                        }
                    }
                },
                agreement:{
                    validators: {
                        notEmpty: {
                            message: '请先阅读并同意用户协议'
                        }
                    }
                }
            }
        }).on('success.form.bv',function (e) {
            e.preventDefault();
            $.ajax({
                type:"post",
                url:"register",
                data: $('#register-form').serialize(),
                dataType:"json",
                success:function (data) {
                    var d = eval("("+data+")");
                    console.log(d.message);
                    if (d.message == true){
                        alert("注册成功");
                    }
                }
            });
        });

       /* $('#login-submit').on('click',function () {

        })*/

        $('.assort').hover(function () {
            $('.assort .a-pop').css('display','block');
            $(this).children('i').addClass('rotate180');
        },function () {
            $('.assort .a-pop').css('display','none');
            $(this).children('i').removeClass('rotate180');
        });

    });


    //credits http://css-tricks.com/snippets/jquery/move-cursor-to-end-of-textarea-or-input/
    jQuery.fn.putCursorAtEnd = function() {
        return this.each(function() {
            // If this function exists...
            if (this.setSelectionRange) {
                // ... then use it (Doesn't work in IE)
                // Double the length because Opera is inconsistent about whether a carriage return is one character or two. Sigh.
                var len = $(this).val().length * 2;
                this.setSelectionRange(len, len);
            } else {
                // ... otherwise replace the contents with itself
                // (Doesn't work in Google Chrome)
                $(this).val($(this).val());
            }
        });
    };



</script>

</body>
</html>



