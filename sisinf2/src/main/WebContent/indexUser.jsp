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
<nav>
  <ul>
  	<li><a href="indexUser.jsp">CARTELERA</a></li>
    <li><a href="index.jsp">CERRAR SESION</a></li>
    <li><a href="#" class="tab-link" data-tab="seccion2">EDITAR TUS DATOS</a></li>
  </ul>
</nav>


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
	%>
  <div id="tabs" class="tabs">
    <div id="seccion1" class="tab-content">
    </div>

    <div id="seccion2" class="tab-content">
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
	   	  <input id="email" name="login" placeholder="Email">
	   	  <br>
	      <% if (errors != null && errors.get("Login") != null) { %>
				<%= errors.get("Login") %>
		  <% } %> 
		  <br>
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
		<form method="post" action="deleteUser">
		  <button type="submit">Borrar cuenta</button>
      	</form> 
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
		<%= "<td id=\"td-cartelera\"><img width=\"300\" height=\"300\" src=\"" + pel.Imagen + "\" /> <br> <a href=\"peliculas/pelicula.jsp\">" + pel.Titulo + "</a></td>"%>
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
 
  
  function editar() {
  }
  function borrarCuenta() {
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
  
  html{
  	display: flex; 
  	text-align: center; 
	justify-content: center; 
  }
  
  main{
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