<!DOCTYPE html>
<html>
<head>
</head>
<%@ page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="dao.postgres.DAOPeliculaPostgres"%>
<%@ page import="vo.Pelicula"%>
<%@ page import="java.util.List"%>
<%@ page import="dao.postgres.DAOAdministradorPostgres"%>
<%@ page import="vo.Administrador"%>

<%
String user = null;
Cookie[] cookies = request.getCookies();
if (cookies != null) {
	for (Cookie cookie : cookies) {
		if (cookie.getName().equals("login"))
	user = cookie.getValue();
	}
}
if (user != null) {
	DAOAdministradorPostgres daoAdmin = new DAOAdministradorPostgres("usuario", "user");
	Administrador admin = daoAdmin.obtener(user);
	if (admin.Correo != null && admin.Correo.equals(user)) {
		Cookie cookie = new Cookie("login", "");
		cookie.setMaxAge(0);
		response.addCookie(cookie);
		user = null;
	} else {
		response.sendRedirect("/sisinf/indexUser.jsp");
	}
}
%>

<!-- Index.jsp -->
<div class="topbar">
	<h1>Desacine</h1>
	<!-- Menu -->
	<div class="menu">
		<button onclick="showTab('cartelera')">CARTELERA</button>
		<button onclick="showTab('inicioSes')">INICIAR SESION</button>
		<button onclick="showTab('registro')">REGISTRARSE</button>
	</div>
</div>
<!-- Secciones -->
<body>
	<div id="tabs" class="tabs">
		<div id="cartelera" class="tab-content">
			<h2>CARTELERA</h2>
			<br>

			<%
			DAOPeliculaPostgres dao = new DAOPeliculaPostgres("usuario", "user");
			List<Pelicula> peliculas = dao.obtenerPeliculas();
			%>
			<table id="table_cartelera">
				<%
				int ncolumnas = 2;
				int i = 0;
				int fintr = 1;
				for (Pelicula pel : peliculas) {
					if (i % ncolumnas == 0) {
				%>
				<%="<tr>"%>
				<%
				}
				%>
				<%="<td id=\"td-cartelera\"><a href=\"peliculas/pelicula.jsp?pelicula=" + pel.Titulo
		+ "\"><img width=\"300\" height=\"300\" src=\"" + pel.Imagen + "\" /> <br>" + pel.Titulo + "</a></td>"%>
				<%
				if (fintr == ncolumnas) {
				%>
				<%="</tr>"%>
				<%
				fintr = 0;
				}
				i++;
				fintr++;
				}
				%>
			</table>
		</div>

		<div id="inicioSes" class="tab-content">
			<h2>Inicio de sesion</h2>
			<form method="post" action="login">

				<%!Map<String, String> errors;%>
				<%
				errors = (Map<String, String>) request.getAttribute("errors");
				%>
				<input id="login" name="login" type="text" placeholder="Correo"
					required> <br>
				<%
				if (errors != null && errors.get("Login") != null) {
				%>
				<%=errors.get("Login")%>
				<%
				}
				%>

				<br> <input id="passwd" name="passwd" type="password"
					placeholder="Contrasenya" required> <br>
				<%
				if (errors != null && errors.get("Clave") != null) {
				%>
				<%=errors.get("Clave")%>
				<%
				}
				%>

				<br>

				<button type="submit">Iniciar Sesion</button>
			</form>

			<br> <a href="#" class="tab-link" data-tab="registro">Registrarse</a>
		</div>

		<div id="registro" class="tab-content">
			<h2>Registrarse</h2>
			<form method="post" action="registroUsuario">
				<input id="nombre" name="nombre" type="text"
					placeholder="Nombre de usuario" required> <br> <br>
				<input id="email" name="login" type="text" placeholder="Email"
					required> <br>
				<%
				if (errors != null && errors.get("Login") != null) {
				%>
				<%=errors.get("Login")%>
				<%
				}
				%>
				<br> <input id="passwd-reg" name="passwd" type="password"
					placeholder="Contrasenya" required> <br> <br> <input
					id="passwd2-reg" name="passwd2" type="password"
					placeholder="Confirmar contrasenya" required> <br>
				<%
				if (errors != null && errors.get("Claves") != null) {
				%>
				<%=errors.get("Claves")%>
				<%
				}
				%>
				<br>
				<button type="submit">Registrarse</button>
			</form>
			<br> <a href="#" class="tab-link" data-tab="inicioSes">Iniciar
				sesion</a>
		</div>
	</div>

</body>

<!-- JavaScript -->
<script>
	document.addEventListener("DOMContentLoaded", () => {
		showTab('cartelera');
	});
	function showTab(tabId) {
        const tabs = document.querySelectorAll('.tab-content');
        tabs.forEach(tab => tab.style.display = 'none');

        document.getElementById(tabId).style.display = 'block';
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

/* Topbar */
.topbar {
    background-color: #1f1f1f;
    color: #fff;
    padding: 1em 2em;
    display: flex;
    justify-content: space-between;
    align-items: center;
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

/* Tabs */
main {
    padding: 2em;
}

.tabs {
    max-width: 900px;
    margin: 0 auto;
}

.tab-content {
    display: none;
    background: white;
    padding: 1.5em;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.tab-content h2 {
    margin-bottom: 1em;
    color: #007bff;
}

.tab-content form {
    margin-top: 1em;
}

.tab-content form input {
    width: calc(100% - 20px);
    padding: 0.5em;
    margin-bottom: 1em;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 1em;
}

.tab-content form button {
    background-color: #28a745;
    color: white;
    border: none;
    padding: 0.5em 1em;
    border-radius: 5px;
    cursor: pointer;
    font-size: 1em;
}

.tab-content form button:hover {
    background-color: #218838;
}

.tab-content a {
    color: #007bff;
    text-decoration: none;
}

.tab-content a:hover {
    text-decoration: underline;
}

/* Cartelera Table */
#table_cartelera {
    width: 100%;
    border-collapse: collapse;
    margin-top: 1em;
}

#table_cartelera td {
    padding: 10px;
    text-align: center;
}

#table_cartelera img {
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    max-width: 100%;
    height: auto;
}

#table_cartelera a {
    text-decoration: none;
    color: #333;
    font-weight: bold;
}

#table_cartelera a:hover {
    color: #007bff;
}

/* Active Tab */
.tab-content.active {
    display: block;
}

/* Buttons Hover Effect */
button {
    transition: background-color 0.3s;
}

button:hover {
    background-color: #0056b3;
}
</style>
</html>