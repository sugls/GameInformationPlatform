<%@ page import="video.dto.Author" %>
<%@ page import="java.util.List" %>
<%@ page import="video.dao.IVideoDao" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lsc
  Date: 2017/5/30
  Time: 20:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>

<%

    List<Author> authors = (List<Author>) session.getAttribute("authors");
    IVideoDao videoDao = (IVideoDao) request.getAttribute("IVideoDao");
    if (authors==null){
        authors = videoDao.getAuthorList();
        session.setAttribute("authors", authors);
    }

%>

<c:forEach items="${sessionScope.authors}" var="author" end="20" varStatus="status">
    <div class="col-md-6">
        <a href="${pageContext.request.contextPath}/video/author?id=${author.id}">
            <img class="tip" title="${author.desc}" width="100" height="100" src="${author.img}" alt="">
            <p><span>${author.name}</span></p>
            <p><span>关注：${author.usernum}</span><br>
                <span>视频：${author.videonum}</span></p>
        </a>
    </div>
</c:forEach>



</body>
</html>
