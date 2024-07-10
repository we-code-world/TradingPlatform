<%@ page language="java" pageEncoding="GBK"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>交流</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <!-- Favicons -->
    <link href="${pageContext.request.contextPath}/img/favicon.jpg" rel="icon">
    <link href="${pageContext.request.contextPath}/img/favicon.jpg" rel="apple-touch-icon">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/font-awesome/css/font-awesome.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/emoji/emoji.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/chathome.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/chat.css" />

    <!-- bootstrap -->
    <link href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap-3.3.7.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/lib/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap-paginator.min.js" type="text/javascript"></script>

    <style>
        #user_content .share .share_content .yes_share .message{
            color: black;
            width: 550px;
            word-wrap: break-word
        }

    </style>
</head>
<body>
<div id="cover" style="min-height:639px;background:antiquewhite">
    <div id="user_area">
        <div id="user_content">
            <div class="share">
                <!--交流-->
                <div class="share_content">
                    <c:if test="${notice!=null}">
                        <div class="yes_share">
                            <!--买家说-->
                            <h1 style="text-align: center;">聊天记录</h1><hr>

                            <p style="text-align:left;color:#4fbef6;">发送时间：${item.createAt}</p>
                            <button type="button" class="btn btn-info" style="background-color: blue;border:0px;outline:none;">发送方:</button>
                            <div class="message">${item.context}</div>
                            <hr>
                            <!--卖家说-->
                            <p style="text-align:right;color:#4fbef6;">发送时间：${item.createAt}</p>
                            <p style="text-align:right">
                                <button type="button" class="btn btn-info"  style="background-color:orangered;border:0px;outline:none;">接收方:</button>
                            <div class="message">aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</div><br>

                            </p>

                        </div>
                    </c:if>
                </div>

                <!--发布-->
                <div class="publish" style="background:antiquewhite">
                    <form role="form" id="contextForm">
                        <div class="pub_content">
                            <div class="text_pub lead emoji-picker-container">
                                <input type="text" name="context" data-emojiable="converted"  class="form-control" data-type="original-input" style="display: none;"/>
                                <div class="emoji-wysiwyg-editor form-control" data-type="input" id="mycontext" contenteditable="true"></div>
                                <!-- <i class="emoji-picker-icon emoji-picker face" data-type="picker" style="top: 153px;"></i> -->
                                <div class="tag"></div>
                            </div>
                            <div class="img_pub">
                                <ul></ul>
                            </div>
                        </div>
                    </form>
                    <div class="button" style="background:antiquewhite">
                        <div class="checkbox" style="width:135px;">
                            <button onclick="sendContext()">发送</button>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>