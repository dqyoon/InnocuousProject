<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR" session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<script>
	$("document").ready(function() {
		$("#btn_Drop").click(function() {
			alert("���");
			if ($("#reason").val() == "���Ż��") {
				alert($("#reason").val());	
				deleteSNS.submit();
			}

		});
		$("#delete2").click(function() {
			alert("���2");
			
				
				
				
			

	});
		$(".delete2").click(function(){
			alert("3");
			$(".modal").modal();
		
		});
		$(".btn1").click(function(){
			alert("��������");
			delete2SNS.submit();
		
		});
		
		$(".delete3").click(function(){
			
			var url = "http://192.168.10.47:8000/mysns/user/profile";    
			alert("���Ŭ������"+ url+ "�� �̵�");
			$(location).attr('href',url);
		
		});
		
		
	});
</script>
<link rel="stylesheet" type="text/css" href="../resources/CSS/drop.css">

</head>
<body>
	<form action="delete.do" id="deleteSNS" method="post">
		<!-- ��ü Join -->
		<H2><img id="logo" src="../resources/gnb_image/logo.png"> Ż��</H2>
������ ��Ȱ��ȭ�Ͻðڽ��ϱ�?<br/>
<br/>
������ ��Ȱ��ȭ�ϸ� �������� ����� �� ���� �Ǹ� �Ѻ�SNS���� <br/>
�����ߴ� �Խù� ��κп��� ȸ������ �̸��� ������ ������ϴ�. <br/>
�׷��� ���� ģ���� ģ�� ����Ʈ�� ȸ������ ���� �޽������� <br/>
ȸ������ �̸��� ǥ�õǴ� �� �ٸ� ����� ȸ������ ���� �Ϻθ� ��� ���� �� �� �ֽ��ϴ�.<br/>

		<div id="joinForm">
			<ul>
				<li><!-- Ż�����  --><select id="reason" name="reason" size="1" hidden/>
						<option value="���Ż��" selected>���Ż��</option>
						

						<%-- 	<%
								for (int i = 8; i <= 100; i++) {
							%>
							<option value="<%=i%>"><%=i + "��"%></option>
							<%
								}
								%> --%>

				</select>
				</li>
			</ul>
<div id="userpic">
						

<br/>

<h1>  ${list.name}���� �ȷ����ϴ»�� </br> <span class="badge">${list.fcount}</span> ���� ���� �ƽ��� �� �� �Դϴ�.. </h1>
Ż�� �� ģ�� �ҽ��� �� �̻� ���� �� ���� �˴ϴ�.<br/>



</div>
			<span id ="btn_Drop" name ="btn_Drop" class="btn_Drop">ȸ��Ż��!</span>
		</div>

	</form>
	<form action="delete2.do" id ="delete2SNS" method="post">
	<div><span id="delete2" class="delete2">��Ȱ��ȭ</span></div>
	
	</form>
	<form action="delete3.do" id ="delete3SNS" method="post">
	<div><span id="delete3" class="delete3">���</span></div>
	<div class="modal" id="testModal" role="dialog">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">

					*���� ��Ȱ��ȭ* </br>������ 72�ð� �� �ڵ����� �Ҹ�Ǹ� ���� �α��� �ҽ� ��Ȱ��ȭ�� ��ҵ˴ϴ�. </br>�׷��� ����Ͻðڽ��ϱ�?

					<div class="modal-footer">
					<button type="button" class="btn1" data-dismiss="modal">��</button>
					<button type="button" class="btn2" data-dismiss="modal">�ƴϿ�</button>
				</div>

			</div>
		</div>
	</div>
	
	</form>
	
</body>
</html>