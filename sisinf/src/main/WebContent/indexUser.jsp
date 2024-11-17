<!DOCTYPE html>
<html>
<%@ page import="java.util.Map" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="dao.postgres.DAOPeliculaPostgres" %>
<%@ page import="vo.Pelicula" %>
<%@ page import="java.util.List" %>
<!-- IndexUser.jsp -->
<h1>Desacine</h1>
<!-- Menu -->
<div class="menu">
	<button onclick="showTab('cartelera')">CARTELERA</button>
	<button onclick="cerrarSesion()">CERRAR SESION</button>
	<button onclick="showTab('editarDatos')">EDITAR DATOS</button>
</div>


<!-- Secciones -->
<main>
	<%
		String user = null;
		Cookie[] cookies = request.getCookies();
		if(cookies != null){
			for (Cookie cookie : cookies){
				if(cookie.getName().equals("login"))
					user = cookie.getValue();
			}
		}
		if (user == null) {
			response.sendRedirect("/sisinf/index.jsp");
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

    <div id="editarDatos" class="tab-content">
      <h2>Editar tus datos</h2>
      <form method="post" action="editUser">
      
      	  <%! Map<String,String> errors; %>
		  <% errors = (Map<String,String>)request.getAttribute("errors"); %>
			
	      <input id="login" name="nombre" placeholder="Nombre de usuario"> 
	   	  <br>
	   	  <% if (errors != null && errors.get("Nombre") != null) { %>
				<%= errors.get("Nombre") %>
		  <% } %>
		  <br> 
	   	  <input id="email" type="hidden" name="login">
	 	  <input id="passwd" name="passwd" type="password" placeholder="Contrasenya">
	   	  <br>
	   	  <% if (errors != null && errors.get("Clave") != null) { %>
				<%= errors.get("Clave") %>
		  <% } %> 
	   	  <br>
	   	  <input id="passwd2" name="passwd2" type="password" placeholder="Confirmar contrasenya">
	   	  <br>
	   	  <% if (errors != null && errors.get("Clave2") != null) { %>
				<%= errors.get("Clave2") %>
		  <% } %> 
		  <% if (errors != null && errors.get("Claves") != null) { %>
			  <%= errors.get("Claves") %>
		  <% } %>
		  <br>
		  <button type="submit">Guardar cambios</button>
		  <br>
		  <br>
		</form>
		<form method="post" action="/sisinf/deleteUser">
		  <input type="hidden" value="<%=user%>" name="login" required>
		  <button type="submit">Borrar cuenta</button>
      	</form> 
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
  
  function cerrarSesion() {
	  	document.cookie = "login=; expires=Thu, 01 Jan 1970 00:00:00 UTC;";
	  	window.location.href = "index.jsp";
  }
</script>

<!-- CSS -->
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