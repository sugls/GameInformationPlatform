<%--
  Created by IntelliJ IDEA.
  User: lsc
  Date: 2017/5/16
  Time: 19:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>GameInformationPlatform</title>
    <%--<link rel="stylesheet" href="../css/sprite.css">--%>
    <link rel="stylesheet" href="../css/champion.css">
    <style>

        .Item .sbg {
            display: none;
            position: absolute;
            top: 0;
            left: 0;
            background: #00A383;
            width: 83px;
            height: 83px;
            opacity: .8;
            cursor: pointer;
        }

        .sbg .fa-search {
            position: absolute;
            top: 50%;
            left: 50%;
            margin: -15px 0 0 -15px;
            color: #fff;
        }
    </style>
</head>
<body>


<div class="LayoutWrap CurrentMenu-summoner">
    <jsp:include page="../header.jsp"/>

    <div class="PageHeaderWrap" style="min-height: 600px">

        <div class="Menu">
            <ol class="MenuList">
                <li class="Item active">
                    <a href="${pageContext.request.contextPath}/staticdata/champions" class="Link">英雄数据</a>
                </li>
            </ol>
        </div>

        <div class="ChampionDetailLayout tabWrap">


            <script>
                String.prototype.replaceAll = function(search, replace){
                    //if replace is not sent, return original string otherwise it will
                    //replace search string with 'undefined'.
                    if (replace === undefined) {
                        return this.toString();
                    }

                    return this.replace(new RegExp('[' + search + ']', 'g'), replace);
                };

                $(function(){

                    var allChampions = $(".ChampionIndexGrid > .Item");
                    allChampions.each(function (i, o) {
                        $(o).hover(function () {
                                $(o).find('.sbg').css('display','block');
                            },
                            function () {
                                $(o).find('.sbg').css('display','none');
                            })
                    });

                    $(".ChampionIndexListTable .Navigation .List ").on("click", ".Item", function(){
                        var $ChampionGrid = $(".ChampionIndexGrid"),
                            $itemList = $(this).closest(".List"),
                            roleClass = $(this).data("role-class"),
                            removeRoleClass = function(){
                                $ChampionGrid.removeClass(function(index, css){
                                    return (css.match(/(^|\s)Role\S+/g) || []).join(' ');
                                });
                            },
                            deactiveAllItems = function(){
                                $(">.Item", $itemList).removeClass('active');
                                updateSearchKeyword();
                            };

                        deactiveAllItems();
                        $(this).addClass("active");

                        if (roleClass !== "Role-ALL") {
                            removeRoleClass();
                            $ChampionGrid.addClass("Role");
                            $ChampionGrid.addClass(roleClass);
                            $(this).closest('.Navigation').addClass('Role');
                        } else {
                            removeRoleClass();
                            $ChampionGrid.removeClass("Role");
                            $(this).closest('.Navigation').removeClass('Role');
                        }

                        return false;
                    });


                    String.prototype.replaceAll = function(search, replace){
                        //if replace is not sent, return original string otherwise it will
                        //replace search string with 'undefined'.
                        if (replace === undefined) {
                            return this.toString();
                        }

                        return this.replace(new RegExp('[' + search + ']', 'g'), replace);
                    };
                    var updateSearchKeyword = function(){
                        var keyword = $(".SearchChampionInput >.InputTextWrap >.Input").val().toLowerCase();
                        var isOnlyFreeToPlay = $("#isOnlyRotation").is(':checked');
                       /* for (var doubleChosung in doubleChosungArray) {
                            if (doubleChosungArray.hasOwnProperty(doubleChosung)) {
                                var spritedChosung = doubleChosungArray[doubleChosung];
                                keyword = keyword.replaceAll(doubleChosung, spritedChosung);
                            }
                        }*/


                        var allChampions = $(".ChampionIndexGrid > .Item");

                        allChampions.each(function(i, o){
                            var championName = $(o).data('champion-name'),
                                championKey = $(o).data('champion-key'),
                                /*championNameChosung = $(o).data('champion-name-chosung'),*/
                                isFreeToPlay = $(o).data('free-to-play'),
                                championTitle = $(o).data('champion-title');
                            if (
                                ((isOnlyFreeToPlay && isFreeToPlay) || (!isOnlyFreeToPlay && !isFreeToPlay) )
                                &&
                                (championName.indexOf(keyword) >= 0 || championKey.indexOf(keyword) >= 0 || championTitle.indexOf(keyword) >= 0 /*|| (championNameChosung && championNameChosung.indexOf(keyword) >= 0)*/)
                            ) {
                                $(o).removeClass('hide');
                                $(o).addClass('showc');
                            } else {
                                $(o).removeClass('showc');
                                $(o).addClass('hide');
                            }
                        });

                        if ($(".ChampionIndexGrid > .Item.showc").length == 0) {
                            $(".ChampionNotFound").show();
                        } else {
                            $(".ChampionNotFound").hide();
                        }

                    };

                    $(".SearchChampionInput >.InputTextWrap >.Input").on('keyup keydown change', function(){
                        updateSearchKeyword();
                    });

                    $("#isOnlyRotation").on('change', function(){
                        /*if (this.checked) {
                            $(".ChampionIndexGrid").addClass('isOnlyRotation');
                        } else {
                            $(".ChampionIndexGrid").removeClass('isOnlyRotation');
                        }*/
                        updateSearchKeyword();
                    });

                    /*$('.ChampionTrendChangeButton').on('click', function(){
                        var $button = $(this);

                        $('#ChampionTrendSummary').toggle();
                        $('#ChampionRankingSummary').toggle();

                        if ($button.data('type')) {
                            switch ($button.data('type')) {
                                case 'win':
                                    $('.tabHeader[data-tab-show-class="ChampionTrendSummary-WinRatio"]').trigger('click');
                                    break;
                                case 'pick':
                                    $('.tabHeader[data-tab-show-class="ChampionTrendSummary-PickRatio"]').trigger('click');
                                    break;
                                case 'ban':
                                    $('.tabHeader[data-tab-show-class="ChampionTrendSummary-BanRatio"]').trigger('click');
                                    break;
                            }
                        }
                    });*/
                });

            </script>




            <div class="RealContent">
                <div class="ChampionIndexListTable Box">
                    <div class="Navigation">
                        <ul class="List">
                            <li class="Item active" data-role-class="Role-ALL">
                                <a href="#" class="Link">全部</a>
                            </li>
                            <li class="Item " data-role-class="Role-FIGHTER">
                                <a href="#" class="Link">战士</a>
                            </li>
                            <li class="Item " data-role-class="Role-TANK">
                                <a href="#" class="Link">坦克</a>
                            </li>
                            <li class="Item " data-role-class="Role-MAGE">
                                <a href="#" class="Link">法师</a>
                            </li>
                            <li class="Item " data-role-class="Role-ASSASSIN">
                                <a href="#" class="Link">刺客</a>
                            </li>
                            <li class="Item" data-role-class="Role-MARKSMAN">
                                <a href="#" class="Link">射手</a>
                            </li>
                            <li class="Item " data-role-class="Role-SUPPORT">
                                <a href="#" class="Link">辅助</a>
                            </li>
                        </ul>
                        <div class="Rotation">
                            <label><input type="checkbox" id="isOnlyRotation" ><span>周免英雄</span></label>
                        </div>
                    </div>
                    <div class="Content">
                        <div class="ChampionIndexGrid">
                            <div class="SearchChampionInput">
                                <div class="InputTextWrap">
                                    <input type="text" class="Input" placeholder="搜索英雄">
                                </div>
                            </div>



                                <c:forEach var="champion" items="${sessionScope.get('allChampions')}">

                                    <div class="Item showc <c:forEach var="tag" items="${champion.tags}">Role-${tag} </c:forEach>" data-champion-name="${champion.name}" data-champion-key="${champion.key}" data-champion-title="${champion.title}">
                                        <a href="${pageContext.request.contextPath}/staticdata/champion?id=${champion.id}" class="Champion Link" title="${champion.name} ${champion.title}">
                                            <div class="ChampionImage">
                                                    <%--<div style="background: url(http://ddragon.leagueoflegends.com/cdn/7.9.2/img/sprite/${champion.champion2.image.sprite}) ${champion.champion2.image.x}px ${champion.champion2.image.y}px; width:${champion.champion2.image.w}px;height:${champion.champion2.image.h}px;"

                                                    ></div>--%>

                                                <img src="http://ossweb-img.qq.com/images/lol/img/champion/${champion.key}.png" alt="${champion.key}" width="82px" height="82px">
                                            </div>

                                            <div class="ChampionName">${champion.name}</div>

                                            <div class="Positions">
                                                <c:forEach var="tag" items="${champion.tags}">
                                                    <div class="Position">
                                                        <span>${tag}</span>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                            <span class="sbg">
                                            <i class="fa fa-search fa-3x"></i>
                                            </span>
                                        </a>
                                    </div>

                                </c:forEach>


                                <c:forEach var="champion" items="${sessionScope.get('freeChampions')}">
                                    <div class="Item hide <c:forEach var="tag" items="${champion.tags}">Role-${tag} </c:forEach>" data-champion-name="${champion.name}" data-champion-key="${champion.key}" data-champion-title="${champion.title}"
                                    data-free-to-play="true">
                                        <a href="${pageContext.request.contextPath}/staticdata/champion?id=${champion.id}" class="Champion Link" title=" ${champion.name} ${champion.title}">
                                            <div class="ChampionImage">
                                                <img src="http://ossweb-img.qq.com/images/lol/img/champion/${champion.key}.png" alt="${champion.key}" width="82px" height="82px">
                                            </div>

                                            <div class="ChampionName">${champion.name}</div>

                                            <div class="Positions">
                                                <c:forEach var="tag" items="${champion.tags}">
                                                    <div class="Position">
                                                        <span>${tag}</span>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                            <span class="sbg">
                                            <i class="fa fa-search fa-3x"></i>
                                            </span>
                                        </a>
                                        <div class="FreeToPlayIcon tip __tipped__"></div>


                                    </div>
                                </c:forEach>



                            <div class="ChampionNotFound" style="display: none;">
                            <div class="ErrorMessage">
                                这只英雄似乎不存在
                            </div>
                        </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>


    </div>

    <jsp:include page="../footer.jsp"/>

</div>

</body>
</html>
