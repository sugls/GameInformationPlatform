<%@ page import="community.dao.ICommunityDao" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lsc
  Date: 2017/5/29
  Time: 17:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<div class="active-user-wrapper">
    <div class="active-user-list-title">
        <p class="active-help-info" style="display: none;">
            该榜单按照活跃度进行排序<br>
            一个发帖会增长5点活跃度<br>
            一条回复会增长1点活跃度
        </p>
        <h3>用户活跃榜</h3>
        <a id="active-list-helper">
            <i id="active-list-helper-icon" class="level-question manager-help-level-right"></i>
        </a>
        <%--<div class="active-list-timetab">
            <span id="active_day_tab" class="day-tab active">日</span>
            <span id="active_week_tab" class="week-tab">周</span>
            <span id="active_month_tab" class="month-tab">月</span>
        </div>--%>
    </div>

    <div class="active-user-list">
        <ul class="list-ul">

            <%

                if (session.getAttribute("rankMember")==null){
                    ICommunityDao communityDao = (ICommunityDao) request.getAttribute("ICommunityDao");
                    session.setAttribute("rankMember",communityDao.getTopActivesMember(8));
                }

            %>

            <c:forEach items="${sessionScope.rankMember}" var="member" varStatus="status">
                <li class="active-user-item">
                    <span class="user-rank rank-${status.index+1}">${status.index+1}</span>
                    <a href="">
                        <img class="active-user-icon"
                              src="../images/profile/face/${member.icon}"
                              alt="头像">
                    </a>
                    <div class="active-user-info">
                        <span class="user-sex-none"></span>
                        <a href="${pageContext.request.contextPath}/community/user?id=${member.userid}">
                            <span class="user-name" title="${member.username}">${member.username}</span>
                        </a>
                        <div class="active-user-info-bottom">
                            <span class="user-activeness-tip">活跃值</span>
                            <span class="user-activeness" title="发帖、回复可增长活跃值">${member.actives}</span>
                        </div>
                    </div>
                    <div class="rank-change-group">
                        <span title="${member.rankTitle}" class="lv-badge lv${member.rank}"></span>
                    </div>
                </li>
            </c:forEach>
        </ul>
    </div>

</div>

</body>
</html>
