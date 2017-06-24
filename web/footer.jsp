<%--
  Created by IntelliJ IDEA.
  User: lsc
  Date: 2017/5/16
  Time: 19:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>GameInformationPlatform</title>
</head>
<body>

<div class="FooterWrap">

    <footer id="footer">
        <div class="copyright">
            <div class="container">
                <ul class="pull-right nomargin list-inline mobile-block">
                    <li>设计实现：刘少池</li>
                    <li>&bull;</li>
                    <li>指导教师：程珍</li>
                </ul>
                &copy; 2017 游戏信息交流平台
            </div>
        </div>
    </footer>

</div>

<script>!function(e,o,n){window.HSCW=o,window.HS=n,n.beacon=n.beacon||{};var t=n.beacon;t.userConfig={},t.readyQueue=[],t.config=function(e){this.userConfig=e},t.ready=function(e){this.readyQueue.push(e)},o.config={docs:{enabled:!0,baseUrl:"//sugl.helpscoutdocs.com/"},contact:{enabled:!0,formId:"e473a14e-36c8-11e7-9841-0ab63ef01522"}};var r=e.getElementsByTagName("script")[0],c=e.createElement("script");c.type="text/javascript",c.async=!0,c.src="https://djtflbt20bdde.cloudfront.net/",r.parentNode.insertBefore(c,r)}(document,window.HSCW||{},window.HS||{});</script>
<script>
    HS.beacon.config({
        icon: 'message',
        showName : true,
        /*translation: {
         messageLabel: '有什么问题需要帮助?',
         },*/
        topics: [
            { val: 'need-help', label: 'Need help with the product' },
            { val: 'bug', label: 'I think I found a bug'}
        ],
        attachment: true,
        instructions:'Contact me'
    });
</script>

</body>
</html>
