<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>entrada</title>
</head>
<body>
		<%
		String user = null;
		Cookie[] cookies = request.getCookies();
		if(cookies != null){
			for (Cookie cookie : cookies){
				if(cookie.getName().equals("login"))
					user = cookie.getValue();
			}
		}
		%>
		La compra se ha realizado correctamente y se ha enviado a su correo electrónico
		<button onclick="regreso()">HOME</button>
</body>

<script type="text/javascript">
	function regreso() {
		if(user == null){
			window.location.href = "index.jsp";
		}
		else{
			window.location.href = "indexUser.jsp";
		}
  		
	}
</script>

<style>
html {
	display: flex;
	text-align: center;
	justify-content: center;
}
</style>
</html>
