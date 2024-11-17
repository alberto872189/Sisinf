<!DOCTYPE html>
<html>
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
<h1>Desacine</h1>
	<!-- Menu -->
	<div class="menu">
	<button onclick="showTab('cartelera')">CARTELERA</button>
	<button onclick="showTab('inicioSes')">INICIAR SESION</button>
	<button onclick="showTab('registro')">REGISTRARSE</button>
</div>
<!-- Secciones -->
<main>
	<div id="tabs" class="tabs">
		<div id="cartelera" class="tab-content">
			<h2>CARTELERA</h2>
			<br>

			<%
			DAOPeliculaPostgres dao = new DAOPeliculaPostgres("usuario", "user");
			List<Pelicula> peliculas = dao.obtenerPeliculas();
			%>
			<table id="cartelera">
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
				<%="<td id=\"td-cartelera\"><a href=\"peliculas/pelicula.jsp?pelicula=" + pel.Titulo + "\"><img width=\"300\" height=\"300\" src=\"" + pel.Imagen
		+ "\" /> <br>" + pel.Titulo + "</a></td>"%>
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

</main>

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

<!-- CSS -->
<style>
<style>
.tabs {
	display: flex;
	flex-wrap: wrap;
}

.tab-content {
	display: none;
}

.tab-content.active {
	display: block;
}

.menu button{
	display: flex; /* Usa flexbox para centrar el contenido */
    align-items: center; /* Centra verticalmente */
    justify-content: center; /* Opcional: centra horizontalmente */
    height: 50px; /* Asegúrate de que el botón tenga suficiente altura */
    padding: 10px; /* Opcional: ajusta el espacio interno */
    font-size: 16px; 
}
.menu {
    display: flex; /* Organiza los hijos en un eje horizontal */
    gap: 10px; /* Espaciado entre los botones */
    justify-content: center; /* Opcional: centra los botones horizontalmente en el contenedor */
    align-items: center; /* Alinea los botones verticalmente */
}

html {
	display: flex;
	text-align: center;
	justify-content: center;
}

main {
	text-align: center;
	justify-content: center;
}

#tabs {
	display: flex;
	text-align: center;
	justify-content: center;
}

#td-cartelera {
	padding-bottom: 60px;
	padding-right: 10px;
	padding-left: 10px;
}
</style>
</html>