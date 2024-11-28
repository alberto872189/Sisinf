<!DOCTYPE html>
<html>
<head>
</head>
<%@ page import="dao.postgres.DAOSesionPostgres"%>
<%@ page import="dao.postgres.DAOButacaPostgres"%>
<%@ page import="vo.Pelicula"%>
<%@ page import="vo.Sesion"%>
<%@ page import="java.util.List"%>
<%@ page import="vo.Butaca"%>
<%@ page import="vo.Producto"%>
<%@ page import="java.util.Map"%>
<div class="topbar">
	<h1>Desacine</h1>
	<!-- Menu -->
	<div class="menu">
		<button onclick="regreso()">CARTELERA</button>
	</div>
</div>
<body>
<div id="notTopbar">
	<%
	String pel = request.getParameter("pelicula");
	String nEntradas = request.getParameter("nEntradas");
	String user = null;
	Cookie[] cookies = request.getCookies();
	if (cookies != null) {
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals("login"))
		user = cookie.getValue();
		}
	}
	%>

	<form name="reserva" method="post" action="/reservarEntrada">
		<!-- OBTENER BUTACAS -->
		<%
		DAOButacaPostgres dao = new DAOButacaPostgres("usuario", "user");
		String hora = String.valueOf(request.getParameter("Hora"));
		int k = hora.indexOf(";");
		Integer sala = Integer.valueOf(hora.substring(k + 1, hora.length()));
		List<Butaca> butacas = dao.obtenerSesion(sala, hora.substring(0, k));
		%>
		<h1 style="text-align:left;"><%=pel%>, SALA
			<%=sala%>,
			<%=hora.substring(0, k)%></h1>
		<h2 style="text-align:left;">Seleccione los asientos</h2>
		<br>
		<div style="align-items:center;">
		<h1 >PANTALLA</h1>
		</div>
		<table id="asientos" align="center">
			<%
			int ncolumnas = 10;
			int i = 0;
			int fintr = 1;
			for (Butaca but : butacas) {
				int idButaca = i + 1;
				if (i % ncolumnas == 0) {
			%>
			<%="<tr>"%>
			<%
			}
			if (but.Ocupada) {
			%>
			<%="<td id=\"td-asientos\"><img src=\"/img/redSquare.png\"></td>"%>
			<%
			} else {
			%>
			<%="<td id=\"td-asientos\"><input type=\"checkbox\" name=\"butaca\" value=\"" + idButaca + "\"></td>"%>
			<%
			}
			if (fintr == ncolumnas) {
			%>
			<%="</tr>"%>
			<%
			fintr = 0;
			}
			i++;
			fintr++;
			}
			if (user == null) {
			%>
			<%="<input type=\"email\" placeholder=\"correo electronico\" name=\"usuario\" required>"%>
			<%
			} else {
			%>
			<%="<input type=\"hidden\" value=\"" + user + "\" name=\"usuario\" required>"%>
			<%
			}
			%>
		</table>
		<br> <input type="hidden" value="<%=hora.substring(0, k)%>"
			name="hora" required> <input type="hidden" value="<%=sala%>"
			name="sala" required> <input type="hidden"
			value="<%=nEntradas%>" name="nEntradas" required> <input
			type="hidden" value="<%=pel%>" name="pelicula" required> <input
			type="submit" value="Seleccionar productos">
	</form>
	<%!Map<String, String> errors;%>
	<%
	errors = (Map<String, String>) request.getAttribute("errors");
	%>
	<%
	if (errors != null && errors.get("Butacas") != null) {
	%>
	<div style="text-align:center;">
	<%=errors.get("Butacas")%>
	</div>
	<%
	}
	%>
	<br>
	<div style="text-align:center;">
		<a href="/peliculas/reserva/indexReserva.jsp?pelicula=<%=pel%>">Volver</a>
	</div>
	
</div>
</body>
<script>
function regreso() {
	window.location.href = "/index.jsp";	
}
</script>
<style>
/* General Reset */
body, h1, h2, p, a, table, tr, td, button, form, input {
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
}

#notTopbar {
	padding: 2em;
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

/* Main Content */
h1, h2 {
    margin-bottom: 1em;
    color: #007bff;
}

h1 {
    font-size: 2.5em;
}

h2 {
    font-size: 1.8em;
}

/* Asientos Table */
#asientos {
    border-collapse: collapse;
    margin: 1em auto;
    max-width: 600px;
}

#asientos td {
    width: 30px;
    height: 30px;
    text-align: center;
    padding: 5px;
}

#asientos img {
    display: block;
    margin: 0 auto;
}

/* Input Checkboxes */
#asientos input[type="checkbox"] {
    transform: scale(1.5);
    margin: 0;
    cursor: pointer;
}

/* Asientos Colors */
#td-asientos {
    padding: 0.5em;
}

#td-asientos img {
    width: 18px;
    height: 18px;
}

/* Formulario */
form {
    text-align: center;
    margin-top: 2em;
}

form input[type="text"] {
    width: 300px;
    padding: 0.8em;
    margin-bottom: 1em;
    border: 1px solid #ccc;
    border-radius: 5px;
}

form input[type="email"] {
    width: 300px;
    padding: 0.8em;
    margin-bottom: 1em;
    border: 1px solid #ccc;
    border-radius: 5px;
}

form input[type="hidden"] {
    display: none;
}

form input[type="submit"] {
    background-color: #007bff;
    color: white;
    border: none;
    padding: 0.8em 1.5em;
    border-radius: 5px;
    font-size: 1em;
    cursor: pointer;
}

form input[type="submit"]:hover {
    background-color: #0056b3;
}

/* Error Messages */
.errors {
    color: red;
    font-size: 1em;
    margin-top: 1em;
    text-align: center;
}

/* Link */
a {
    color: #007bff;
    text-decoration: none;
    font-weight: bold;
}

a:hover {
    text-decoration: underline;
}

</style>
</html>