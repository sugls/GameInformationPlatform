<%--
  Created by IntelliJ IDEA.
  User: lsc
  Date: 2017/5/22
  Time: 17:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<body>

    <c:forEach var="thread" items="${requestScope.threadList}">
        <div class="idx-newlist-item noimg">
            <span class="idx-newlist-play" style="display:none"></span>
            <div class="idx-newlist-item-right">
                <div class="idx-newlist-item-right-content"><span
                        class="index-list-icon index-list-icon-vote"
                        style="display:none"></span> <span
                        class="index-list-icon index-list-icon-prize"
                        style="display:none"></span> <a
                        href="${pageContext.request.contextPath}/community/thread?tid=${thread.tid}&fid=${thread.fid}&uid=${thread.authorid}"
                        target="_blank" class="idx-newlist-title"
                        title="${thread.subject}">${thread.subject}</a>
                </div>
                <div class="idx-newlist-footer"><a target="_blank"
                                                   class="idx-newlist-footertag"
                                                   href="${pageContext.request.contextPath}/community/forum?fid=${thread.fid}">${thread.fname}</a>
                    <a target="_blank" class="idex-newlist-footerlink"
                       href="${pageContext.request.contextPath}/community/user?id=${thread.authorid}">${thread.author}</a><b>·</b>
                    <span>${thread.views}阅读</span><b>·</b>
                    <span>${thread.replies}回复</span><b>·</b>
                    <span class="idex-newlist-footerlink">${thread.dateline}</span></div>
            </div>
            <div class="clear"></div>
        </div>
    </c:forEach>

</body>
</html>
