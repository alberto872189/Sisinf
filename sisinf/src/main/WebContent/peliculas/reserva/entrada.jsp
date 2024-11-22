<!DOCTYPE html>
<html>
<head>
</head>
<div class="topbar">
	<h1>Desacine</h1>
	<!-- Menu -->
	<div class="menu">
		<button onclick="regreso()">CARTELERA</button>
	</div>
</div>
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
	window.location.href = "/sisinf/index.jsp";	
}
</script>
<style>
/* General Reset */
body, h1, p, button {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Arial, sans-serif;
}

/* Body */
body {
    background-color: #f4f4f9;
    color: #333;
    line-height: 1.6;
    font-size: 16px;
    padding: 2em;
    text-align: center;
}

/* Topbar */
.topbar {
    background-color: #1f1f1f;
    color: #fff;
    padding: 1em 2em;
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 1.5em;
}

.topbar h1 {
    font-size: 2em;
    margin: 0;
}

.menu {
    display: flex;
    gap: 1em;
}

.menu button {
    background-color: #007bff;
    color: white;
    border: none;
    padding: 0.5em 1em;
    border-radius: 5px;
    cursor: pointer;
    font-size: 1em;
}

.menu button:hover {
    background-color: #0056b3;
}

/* Confirmation Message */
body p {
    margin: 2em 0;
    font-size: 1.2em;
    color: #4caf50;
    font-weight: bold;
}

/* Home Button */
body button {
    background-color: #007bff;
    color: white;
    border: none;
    padding: 0.8em 1.5em;
    border-radius: 5px;
    cursor: pointer;
    font-size: 1em;
}

body button:hover {
    background-color: #0056b3;
}

</style>
</html>
