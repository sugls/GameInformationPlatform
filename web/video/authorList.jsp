<%@ page import="video.dto.Video" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: lsc
  Date: 2017/5/29
  Time: 20:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>游戏信息交流平台</title>
    <style>
        .margin-top-50 {
            margin-top: 50px;
        }
        .height-250{
            height: 250px;
        }
    </style>
</head>
<body>

<div class="LayoutWrap CurrentMenu-summoner">
    <jsp:include page="../header.jsp"/>
    <div class="container margin-top-50">

        <div>
            <form action="${pageContext.request.contextPath}/video/search">
                <input type="text" name="keyword" class=" col-md-11 input-lg" placeholder="输入关键字搜索视频">
                <button type="submit" class="col-md-1 btn-lg btn btn-primary">搜索</button>
            </form>
        </div>
        <br><br><br><br><br>

        <div class="row">

                <c:if test="${sessionScope.authors.size()<=0}">
                    <div class="row">
                        <h3>没有更多视频了。</h3>
                    </div>
                </c:if>
                <c:if test="${sessionScope.authors.size()>0}">
                    <div class="row">
                        <c:forEach items="${sessionScope.authors}" var="author" varStatus="status">
                            <div class="col-md-3">
                                <div class="thumbnail height-250" style="width: 100%">
                                    <p>
                                        <img style="max-height: 135px; max-width: 244px;overflow: hidden;" src="${author.img}" alt="..." <%--width="183" height="108"--%>>
                                    </p>
                                    <div class="videoContent" style="display: none">
                                            ${author.desc}
                                    </div>
                                    <div class="caption">
                                        <p>${author.name}</p>
                                        <p>
                                            <span class="label label-default">关注：${author.usernum}</span>
                                            <span class="label label-info">视频：${author.videonum}</span>
                                        </p>
                                        <p><button class="btn btn-warning" onclick="location.href='${pageContext.request.contextPath}/video/author?id=${author.id}'">观看TA的视频</button></p>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:if>



                <nav aria-label="...">
                    <ul class="pager">
                        <li <c:if test="${requestScope.pages-1<=0}">class="disabled"</c:if> ><a <c:if test="${requestScope.pages-1<=0}">onclick="return false" </c:if> href="${pageContext.request.contextPath}/video/${requestScope.url}&pages=${requestScope.pages-1}">上一页</a></li>
                        <li><a href="${pageContext.request.contextPath}/video/${requestScope.url}&pages=${requestScope.pages+1}">下一页</a></li>
                    </ul>
                </nav>
            </div>

    </div>


    <jsp:include page="../footer.jsp"/>

</div>


</body>
</html>
