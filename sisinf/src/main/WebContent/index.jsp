<!DOCTYPE html>
<html>
<%@ page import="java.util.Map" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="dao.postgres.DAOPeliculaPostgres" %>
<%@ page import="vo.Pelicula" %>
<%@ page import="java.util.List" %>

<%
		String user = null;
		Cookie[] cookies = request.getCookies();
		if(cookies != null){
			for (Cookie cookie : cookies){
				if(cookie.getName().equals("login"))
					user = cookie.getValue();
			}
		}
		if (user != null) {
			response.sendRedirect("/sisinf/indexUser.jsp");
		}
	%>

<!-- Index.jsp -->
<h1>Desacine</h1>
<!-- Menu -->
<nav>
	<ul>
		<li><a href="index.jsp">CARTELERA</a></li>
		<li><a href="#" class="tab-link" data-tab="seccion1">INICIO
				DE SESION</a></li>
		<li><a href="#" class="tab-link" data-tab="seccion2">REGISTRARSE</a></li>
	</ul>
</nav>


<!-- Secciones -->
<main>
	
	<div id="tabs" class="tabs">
		<div id="seccion1" class="tab-content">
			<h2>Inicio de sesion</h2>
			<form method="post" action="login">
			
				<%! Map<String,String> errors; %>
				<% errors = (Map<String,String>)request.getAttribute("errors"); %>
				<input id="login" name="login" type="text" placeholder="Nombre de usuario" required>
				<br>
				<% if (errors != null && errors.get("Login") != null) { %>
					<%= errors.get("Login") %>
				<% } %> 
				
				<br> 
				<input id="passwd" name="passwd" type="password"
					placeholder="Contrasenya" required>
				<br>	
				<% if (errors != null && errors.get("Clave") != null) { %>
					<%= errors.get("Clave") %>
				<% } %> 
					
				<br>				
				
				<button type="submit">Iniciar Sesion</button>
			</form>
				
			<br>
			<a href="#" class="tab-link" data-tab="seccion2">Registrarse</a>
		</div>

		<div id="seccion2" class="tab-content">
			<h2>Registrarse</h2>
			<form method="post" action="registroUsuario">
				<input id="nombre" name="nombre" type="text"
					placeholder="Nombre de usuario" required> <br> <br>
				<input id="email" name="login" type="text"
					placeholder="Email" required> <br> 
				<% if (errors != null && errors.get("Login") != null) { %>
					<%= errors.get("Login") %>
				<% } %>
					 <br>
				<input id="passwd-reg" name="passwd" type="password"
					placeholder="Contrasenya" required> <br> <br> 
				<input id="passwd2-reg" name="passwd2" type="password"
					placeholder="Confirmar contrasenya" required> <br> 
				<% if (errors != null && errors.get("Claves") != null) { %>
					<%= errors.get("Claves") %>
				<% } %> 
					<br>
				<button type="submit">Registrarse</button>
			</form>
			<br> <a href="#" class="tab-link" data-tab="seccion1">Iniciar sesion</a>
		</div>
	</div>
	
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
			<%= "<tr>" %>
	<%
			}
	%>
		<%= "<td id=\"td-cartelera\"><img width=\"300\" height=\"300\" src=\"" + pel.Imagen + "\" /> <br> <a href=\"peliculas/pelicula.jsp?pelicula=" + pel.Titulo + "\">" + pel.Titulo + "</a></td>"%>
	<%		
			if (fintr == ncolumnas) {
	%>
			<%= "</tr>" %>
	<%
			fintr = 0;
			}
			i++;
			fintr++;
		}
	%>
	</table>
</main>

<!-- JavaScript -->
<script>
  const tabs = document.querySelectorAll('.tab-link');
  const tabContents = document.querySelectorAll('.tab-content');

  tabs.forEach((tab) => {
    tab.addEventListener('click', (e) => {
      e.preventDefault();
      const tabId = tab.getAttribute('data-tab');
      tabContents.forEach((content) => {
        content.classList.remove('active');
      });
      document.getElementById(tabId).classList.add('active');
    });
  });
  
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

ul {
	list-style: none;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: space-between;
}

li {
	margin-right: 20px;
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