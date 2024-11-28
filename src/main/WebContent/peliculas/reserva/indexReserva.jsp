<!DOCTYPE html>
<html>
<head>
</head>
<%@ page import="dao.postgres.DAOSesionPostgres"%>
<%@ page import="dao.postgres.DAOButacaPostgres"%>
<%@ page import="vo.Pelicula"%>
<%@ page import="vo.Producto"%>
<%@ page import="vo.Sesion"%>
<%@ page import="java.util.List"%>
<%@ page import="vo.Butaca"%>
<%@ page import="vo.Producto"%>
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
	%>
	<h1 style="align: center;"><%=pel%></h1>
	<form name="reserva" action=indexReserva2.jsp>
		<label for="nEntradas">Número de entradas:</label><br> <input
			type="number" name="nEntradas" value="1"><br>
		<br>
		<%
		DAOSesionPostgres dao = new DAOSesionPostgres("usuario", "user");
		List<Sesion> sesiones = dao.obtenerSesionesPel(pel);
		%>
		Sesión: <select name="Hora" required>
			<%
			for (Sesion sesion : sesiones) {
			%>
			<%="<option value=\"" + sesion.Sesion_Hora + ";" + sesion.N_Sala + "\">" + sesion.Sesion_Hora + ",  sala "
		+ sesion.N_Sala + "</option>"%>
			<%
			}
			%>
		</select> <br>
		<br> <input type="hidden" value="<%=pel%>" name="pelicula"
			required> <input type="submit" value="Asientos">
	</form>
	<br>
	<div style="text-align:center;">
	<a href="/peliculas/pelicula.jsp?pelicula=<%=pel%>">Volver</a>
	</div>
	</div>
</body>
<script type="text/javascript">
function regreso() {
	window.location.href = "/index.jsp";	
}
</script>
<style>
/* General Reset */
body, h1, h2, p, a, table, tr, td, button, form, input, select, label {
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
h1 {
    font-size: 2.5em;
    color: #007bff;
    margin-bottom: 1em;
}

/* Formulario */
form {
    background: white;
    padding: 1.5em;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    max-width: 600px;
    margin: 0 auto 1.5em auto;
}

form label {
    display: block;
    font-weight: bold;
    margin-bottom: 0.5em;
    color: #333;
}

form input[type="number"],
form select,
form input[type="hidden"] {
    width: calc(100% - 20px);
    padding: 0.5em;
    margin-bottom: 1em;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 1em;
}

form input[type="submit"] {
    background-color: #28a745;
    color: white;
    border: none;
    padding: 0.5em 1em;
    border-radius: 5px;
    cursor: pointer;
    font-size: 1em;
    margin-top: 1em;
}

form input[type="submit"]:hover {
    background-color: #218838;
}

/* Links */
a {
    color: #007bff;
    text-decoration: none;
    font-weight: bold;
}

a:hover {
    text-decoration: underline;
}

/* Utility */
.container {
    max-width: 900px;
    margin: 0 auto;
}
</style>
</html>