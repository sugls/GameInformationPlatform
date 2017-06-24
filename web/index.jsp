
<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>GameInformationPlatform</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/essentials.css">

    <script src="js/jquery-1.12.4.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/bootstrapValidator.min.js"></script>
    <link rel="stylesheet" href="css/login.css">

    <style>
        body {
            background: url(images/5.jpg) no-repeat;
            background-size: cover;
        }

        .search {
            text-align: center;
            margin-top: 250px;
        }

        .s-bar {
            width: 500px;
            height: 200px;
            margin: 0 auto;
        }

        .copyright {
            margin-top: 120px;
            text-align: center;
        }

        .copyright p {
            font-size: 0.875em;
            font-weight: 400;
            color: #fff;
        }

        .copyright p a {
            font-size: 1em;
            font-weight: 400;
            color: #8EDB15;
        }

        .copyright p a:hover {
            color: #fff;
            transition: 0.5s all;
            -webkit-transition: 0.5s all;
            -moz-transition: 0.5s all;
            -o-transition: 0.5s all;
        }

        .region-select ul li {
            padding: 0 10px;
            line-height: 25px;
            cursor: pointer;
        }
    </style>
</head>
<body>

<!-- 导航条开始 -->

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${pageContext.request.contextPath}/">游戏信息交流平台</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">英雄数据 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="${pageContext.request.contextPath}/staticdata/champions">英雄数据</a></li>
                        <li><a href="${pageContext.request.contextPath}/staticdata/items">物品数据</a></li>
                    </ul>
                </li>
                <li><a href="${pageContext.request.contextPath}/leaderboard/challenger">排行榜</a></li>
                <li><a href="${pageContext.request.contextPath}/video/videos">视频</a></li>
                <li><a href="${pageContext.request.contextPath}/community/index">社区</a></li>
            </ul>

            <c:if test="${sessionScope.user==null}">
                <nav class="unlogin-nav nav navbar-nav navbar-right" style="padding-top: 14px;color: #eee;">
                    <ul class="" style="margin: 0;">
                        <li><a style="color: #eee" class="cd-signin" href="#0">登录</a></li>
                        |
                        <li><a style="color: #eee" class="cd-signup" href="#0">注册</a></li>
                    </ul>
                </nav>

            </c:if>

            <c:if test="${sessionScope.user!=null}">
                <nav class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                            <img class="img-circle" width="26px" height="26px"
                                 src="${pageContext.request.contextPath}/images/profile/face/${sessionScope.user.icon}">
                        ${sessionScope.user.username}<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="${pageContext.request.contextPath}/summoner/account?id=${sessionScope.user.userid}"> &nbsp;&nbsp; <i class="fa fa-user"></i> &nbsp;我的账号</a></li>
                            <li><a href="${pageContext.request.contextPath}/profile"> &nbsp;&nbsp; <i class="fa fa-cog"></i> &nbsp;个人信息</a></li>
                            <li><a href="javascript:;" onclick="$.getJSON('logout',null,function(data) {
                                    console.log(data);window.location.reload();
                                  })"> &nbsp;&nbsp; <i class="fa fa-sign-out"></i> &nbsp;退出登录</a></li>
                        </ul>
                    </li>
                </nav>
            </c:if>

        </div>
    </div>
</nav>


<!-- 登录注册弹窗 -->
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
<!-- 登录注册弹窗 结束 -->

<!-- 导航条结束 -->

<!--search start here-->
<div class="container search">
    <div class="s-bar">
        <form action="${pageContext.request.contextPath}/summoner/search" method="get">
            <div class="form-group">
                <div class="input-group">
                    <div class="input-group-btn region-select">
                        <button type="button"
                                style="font-size: 20px"
                                class="btn btn-default height-60 dropdown-toggle" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">NA1 <span class="caret"></span></button>
                        <input type="hidden" id="region" name="region" value="NA1">
                        <ul class="dropdown-menu">
                            <li value="NA1">North America</li>
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

                    <input type="text" placeholder="请输入召唤师名称" onfocus="this.placeholder = '';"
                           onblur="if (this.placeholder == '') {this.placeholder = '请输入召唤师名称';}"
                           style="font-size: 18px" id="summoner" name="summoner"
                           class="form-control height-60" aria-label="...">
                    <div class="input-group-btn">
                        <input type="submit" class="btn btn-default height-60"
                                style="font-size: 20px" onclick="return validate()"
                            value="搜索"
                        >
                    </div>
                </div>
            </div>
            <p class="text-green" style="font-size: 20px" id="error-text"></p>
        </form>
    </div>
</div>
<!--search end here-->
<div class="copyright">
    <p> &copy; 2017 <a href="index.html">游戏信息交流平台</a>
        设计实现：刘少池 &bull; 指导教师：程珍
    </p>
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



    });

    $('.region-select ul li').on('click', function (e) {
        var _this = $(this);
        $('.region-select > button').html(_this.attr("value") + ' <span class="caret"></span>');
        $('#region').attr("value", _this.attr("value"));
        /*  e.stopPropagation();*/
    });
    function validate() {
        if ($('#summoner').val().trim() == '') {
            $('#error-text').text('请输入召唤师名称!');
            return false;
        }
       /* else if (!(/^[0-9\\p{L} _\\.]+$/.test($('#summoner').val().trim()))) {
            $('#error-text').text('请输入正确的召唤师名称！');
            return false;
        }*/
    }
</script>
</body>
</html>
