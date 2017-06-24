<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:forEach items="${threadList}" var="thread">

    <div class="zb-list-item  ">

        <!-- 置顶不需要这个 -->
        <div class="zb-list-item-user">
            <div class="zb-list-item-user-name">
                <span class="zb-icon-user"></span>
                <a href="" title="${thread.author}" target="_blank">${thread.author}</a>
            </div>
            <div class="zb-list-item-user-bottom">
                <span class="zb-list-item-user-time">${thread.dateline}</span>
            </div>
        </div>

        <div class="zb-list-item-reply">${thread.replies}</div>
        <div class="zb-list-item-content">
            <h2 class="zb-list-item-title ellipsis">

                <a title="111" target="_blank" href="${pageContext.request.contextPath}/community/thread?tid=${thread.tid}&fid=${thread.fid}&uid=${thread.authorid}">
                    ${thread.subject}
                </a>
            </h2>

            <%--<div class="zb-list-item-desc">

            </div>--%>

        </div>
        <div class="clear"></div>
    </div>

</c:forEach>