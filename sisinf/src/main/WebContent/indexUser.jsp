<!DOCTYPE html>
<html>
<%@ page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="dao.postgres.DAOPeliculaPostgres"%>
<%@ page import="vo.Pelicula"%>
<%@ page import="java.util.List"%>
<!-- IndexUser.jsp -->
<div class="topbar">
	<img src="/img/logo.png" width="75px" height="75px">
	<!-- Menu -->
	<div class="menu">
		<button onclick="showTab('cartelera')">CARTELERA</button>
		<button onclick="cerrarSesion()">CERRAR SESION</button>
		<button onclick="showTab('editarDatos')">EDITAR DATOS</button>
	</div>
</div>

<!-- Secciones -->
<body>
	<%
	String user = null;
	Cookie[] cookies = request.getCookies();
	if (cookies != null) {
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals("login"))
		user = cookie.getValue();
		}
	}
	if (user == null) {
		response.sendRedirect("/index.jsp");
	}
	%>
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

		<div id="editarDatos" class="tab-content">
			<h2>Editar tus datos</h2>
			<form method="post" action="editUser">

				<%!Map<String, String> errors;%>
				<%
				errors = (Map<String, String>) request.getAttribute("errors");
				%>

				<input id="login" name="nombre" placeholder="Nombre de usuario">
				<br>
				<%
				if (errors != null && errors.get("Nombre") != null) {
				%>
				<%=errors.get("Nombre")%>
				<%
				}
				%>
				<br> <input id="email" type="hidden" name="login"> <input
					id="passwd" name="passwd" type="password" placeholder="Contraseña">
				<br>
				<%
				if (errors != null && errors.get("Clave") != null) {
				%>
				<%=errors.get("Clave")%>
				<%
				}
				%>
				<br> <input id="passwd2" name="passwd2" type="password"
					placeholder="Confirmar Contraseña"> <br>
				<%
				if (errors != null && errors.get("Clave2") != null) {
				%>
				<%=errors.get("Clave2")%>
				<%
				}
				%>
				<%
				if (errors != null && errors.get("Claves") != null) {
				%>
				<%=errors.get("Claves")%>
				<%
				}
				%>
				<br>
				<button type="submit">Guardar cambios</button>
				<br> <br>
			</form>
			<form method="post" action="/deleteUser">
				<input type="hidden" value="<%=user%>" name="login" required>
				<button type="submit">Borrar cuenta</button>
			</form>
		</div>
	</div>
</body>

<!-- JavaScript -->
<script>
  document.addEventListener("DOMContentLoaded", () => {
	  let activeTab = sessionStorage.getItem("activeTabUser")
		if (activeTab) {
			showTab(activeTab);
		}
		else {
			showTab('cartelera');	
		}
  });
  function showTab(tabId) {
	  	sessionStorage.setItem("activeTabUser", tabId);
     	const tabs = document.querySelectorAll('.tab-content');
      	tabs.forEach(tab => tab.style.display = 'none');

    	document.getElementById(tabId).style.display = 'block';
  }
  
  function cerrarSesion() {
	  	document.cookie = "login=; expires=Thu, 01 Jan 1970 00:00:00 UTC;";
	  	window.location.href = "index.jsp";
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