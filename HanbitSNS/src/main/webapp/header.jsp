<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
.affix{
margin:-8px;
height:55px;
width:1600px;
background-color:#FFFFFF;
border-bottom:1px solid #DBDBDB;
float:left;
top:0;
}
.gnb_list{
list-style: none;

}
/* .gnb_li_mypage, .gnb_li_friend{
margin-top:-30px;
} */
.gnb_li_mypage{
padding-left:32px;
margin-right:327px;
 margin-top:-10px;
}
.gnb_li_friend{
margin-top:-10px;
/* margin-right:359px; */
}
.gnb__li_logo{
margin-left:327px;
margin-top:10px;
}
.gnb_color{
 margin-left:580px;
margin-top:-28px;

}

span.gnb_red, span.gnb_orange, span.gnb_yellow, span.gnb_green, span.gnb_eme-green, span.gnb_skyblue, span.gnb_blue, span.gnb_pp, span.gnb_white, span.gnb_black{

cursor:pointer

}

</style>
</head>
<body>
<div class="affix">
 <ul class="gnb_list">
  <li class="gnb__li_logo"><a href="#"><img src="/mysns/resources/gnb_image/gnb_mypage.png" ></a></li>
  <li class="gnb_li_mypage" style="float:right;"><a href="#"><img src="/mysns/resources/gnb_image/gnb_mypage.png"></a></li>
  <li class="gnb_li_friend"style="float:right;"><a href="#"><img src="/mysns/resources/gnb_image/gnb_friend.png"></a></li>
 </ul>
 <div class="gnb_color">
 <span class="gnb_red"><img src="/mysns/resources/gnb_image/red.png"></span>
 <span class="gnb_orange"><img src="/mysns/resources/gnb_image/orange.png"></span>
 <span class="gnb_yellow"><img src="resources/gnb_image/yellow.png"></span>
 <span class="gnb_green"><img src="resources/gnb_image/green.png"></span>
 <span class="gnb_eme-green"><img src="resources/gnb_image/eme-green.png"></span>
 <span class="gnb_skyblue"><img src="resources/gnb_image/skyblue.png"></span>
 <span class="gnb_blue"><img src="resources/gnb_image/blue.png"></span>
 <span class="gnb_pp"><img src="resources/gnb_image/pp.png"></span>
 <span class="gnb_white"><img src="resources/gnb_image/white.png"></span>
 <span class="gnb_black"><img src="resources/gnb_image/black.png"></span>
 </div>
</div>

</body>
</html>