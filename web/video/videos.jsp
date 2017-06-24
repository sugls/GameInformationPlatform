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

        <div class="modal fade" id="myModal" tabindex="-1" aria-hidden="true"  role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" onclick="$(this).parent().next('.modal-body').html('')" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel"></h4>
                    </div>
                    <div class="modal-body">

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" onclick="$(this).parent().parent().find('.modal-body').html('');" data-dismiss="modal">关闭</button>
                        <%--<button type="button" class="btn btn-primary">Save changes</button>--%>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">

            <div class="col-md-9">
                <c:if test="${requestScope.videos.size()<=0}">
                    <div class="row">
                        <h3>没有更多视频了。</h3>
                    </div>
                </c:if>
                <c:if test="${requestScope.videos.size()>0}">
                    <div class="row">
                        <c:forEach items="${requestScope.videos}" var="video" varStatus="status">
                            <div class="col-md-3">
                                <div class="thumbnail height-250" style="width: 100%">
                                    <p>
                                        <img src="${video.img}" alt="..." width="183" height="108">
                                    </p>
                                    <div class="videoContent" style="display: none">
                                            ${video.content}
                                    </div>
                                    <div class="caption">
                                        <p>${video.title}</p>
                                        <p><a href="#" onclick="$('#myModal').find('.modal-body').html($(this).parent().parent().parent().find('.videoContent').html());
                            $('#myModal').find('.modal-title').html($(this).parent().parent().children().eq(0).html());
                            $('#myModal').modal({backdrop: 'static', keyboard: false});" <%--target="_blank"--%> <%--data-toggle="modal" data-target="#myModal"--%> class="btn btn-primary" role="button">观看</a>
                                                <%--<a href="#" class="btn btn-default"
                                                   role="button">Button</a>--%>
                                            <span>${video.author.name}</span>
                                            <span class="label label-warning">${fn:replace(video.createdate, "T", " ")}</span>
                                        </p>
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

            <div class="col-md-3">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">解说视频</h3>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <jsp:include page="authors.jsp"/>
                        </div>
                    </div>
                    <div class="panel-footer">
                        <a style="margin-left: 170px" href="${pageContext.request.contextPath}/video/authors">>>更多</a>
                    </div>
                </div>
            </div>

        </div>

    </div>


    <jsp:include page="../footer.jsp"/>

</div>


</body>
</html>
