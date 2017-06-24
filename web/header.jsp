<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lsc
  Date: 2017/5/16
  Time: 19:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>GameInformationPlatform</title>


    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
    <link href="${pageContext.request.contextPath}/css/op.common.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/op.summoner.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">

    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/echarts.js"></script>

    <script src="${pageContext.request.contextPath}/js/tipped.js"></script>

    <script src="${pageContext.request.contextPath}/js/layout.js"></script>

    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrapValidator.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">

</head>
<body>

    <div class="GlobalHeader">
    <div class="HeaderWrap headerScrollFix">
        <div class="Header container">
            <h1 class="navbar-header">
                <a href="${pageContext.request.contextPath}/" class="navbar-brand">
                    <span style="color: #fff">游戏信息交流平台</span> </a>
            </h1>

            <div class="GlobalNavigation">
                <ul class="Menu">
                    <li class="Menu dropdown ">
                        <h2>
                            <a href="${pageContext.request.contextPath}/staticdata/champions" style="" onclick="">
                                英雄数据
                            </a>
                        </h2>

                        <ul class="DropDown">
                            <li class="Item ">
                                <a href="${pageContext.request.contextPath}/staticdata/champions" style="" onclick="">
                                    英雄数据
                                </a>
                            </li>
                            <li class="Item ">
                                <a href="${pageContext.request.contextPath}/staticdata/items" style="" onclick="">
                                    物品数据
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="Menu normal ">
                        <h2>
                            <a href="${pageContext.request.contextPath}/leaderboard/challenger" style="" onclick="">
                                排行榜
                            </a>
                        </h2>

                    </li>
                    <li class="Menu normal ">
                        <h2>
                            <a href="${pageContext.request.contextPath}/video/videos" style="" onclick="">
                                视频
                            </a>
                        </h2>

                    </li>
                    <li class="Menu normal ">
                        <h2>
                            <a href="${pageContext.request.contextPath}/community/index" style="" onclick="">
                                社区
                            </a>
                        </h2>

                    </li>
                </ul>
            </div>

            <div class="GlobalTools">

                <div class="SearchTool">
                    <form action="${pageContext.request.contextPath}/summoner/search" class="Form">
                        <div class="SearchInputWrap">
                            <select style="color: #666;width: 28%;margin-right: 5px;" name="region" id="region">
                                <option value="NA1">NA</option>
                                <option value="GLOBAL">ALL</option>
                                <option value="BR1">BR</option>
                                <option value="EUN1">EUNE</option>
                                <option value="EUW1">EUW</option>
                                <option value="LA1">LAN</option>
                                <option value="LA2">LAS</option>
                                <option value="OC1">OCE</option>
                                <option value="RU">RU</option>
                                <option value="TR1">TR</option>
                                <option value="JP1">JP</option>
                                <option value="KR">KR</option>
                            </select>
                            <input type="text"
                                   onfocus="$('.Form').css('width','300px')"
                                   onblur="$('.Form').css('width', '220px')"
                                   name="summoner" class="SearchInput _suggest" placeholder="召唤师名称">
                        </div>
                        <button class="Button" type="submit">
                            <i class="fa fa-search" style="color: #666"></i>
                        </button>
                    </form>
                </div>

                <div class="HeaderTools">
                    <dl>
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
                            <dd class="Button Login DropDown">
                                <a href="#" onclick="$(this).closest('.DropDown').toggleClass('active');return false;" class="Button">
                                    <img class="img-circle" width="26px" height="26px"
                                         src="${pageContext.request.contextPath}/images/profile/face/${sessionScope.user.icon}">
                                ${sessionScope.user.username}</a>

                                <div class="DropDownItem">
                                    <div class="AccountTool">
                                        <div class="Content"><a class="Summoner" href="${pageContext.request.contextPath}/summoner/account?id=${sessionScope.user.userid}">我的账号</a>
                                            <ul class="List">
                                                <li class="Item">
                                                    <a target="_blank" href="${pageContext.request.contextPath}/profile">
                                                        <i class="fa fa-user"></i> &nbsp;个人信息
                                                    </a>
                                                </li>
                                                <li class="Item Logout">
                                                    <a href="javascript:;" onclick="$.getJSON('logout',null,function(data) {
                                    console.log(data);window.location.reload();
                                  })"> <i class="fa fa-sign-out"></i> &nbsp;退出登录</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </dd>
                        </c:if>
                    </dl>
                </div>
            </div>

        </div>
    </div>
</div>

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
    </script>

</body>
</html>
