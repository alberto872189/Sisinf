<!DOCTYPE html>
<html>
<%@ page import="java.util.Map" %>
<!-- Index.html -->
<h1>Desacine</h1>
<!-- Menu -->
<nav>
	<ul>
		<li><a href="index.html">CARTELERA</a></li>
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
			<form method="post">
				<%! Map<String,String> errors; %>
				<% errors = (Map<String,String>)request.getAttribute("error"); %>
				<input id="usernameInput" type="text" placeholder="Nombre de usuario">
				<% if (errors != null && errors.get("Login") != null) { %>
					<%= errors.get("Login") %>
				<% } %>
				<br> <br> 
				<input id="passwordInput" type="password"
					placeholder="Contrasenya">
					<% if (errors != null && errors.get("Clave") != null) { %>
					<%= errors.get("Clave") %>
					<% } %>
				<br> <br>
					
					<% if (errors != null && errors.get("Login") == null && errors.get("Clave") == null) { %>
						<script>
						iniciarSesion();
						</script>
					<% } %>						
				
				<button type="submit">Iniciar Sesion</button>
				<br> <a href="#" class="tab-link" data-tab="seccion2">Registrarse</a>
			</form>
		</div>

		<div id="seccion2" class="tab-content">
			<h2>Registrarse</h2>
			<input id="usernameInputReg" type="text"
				placeholder="Nombre de usuario"> <br> <br> <input
				id="email" type="text" placeholder="Email"> <br> <br>
			<input id="passwordInputReg1" type="password"
				placeholder="Contrasenya"> <br> <br> <input
				id="passwordInputReg2" type="password"
				placeholder="Confirmar contrasenya"> <br> <br>
			<button onclick="registrarse()">Registrarse</button>
			<div id="registroIncorrecto"></div>
			<br> <a href="#" class="tab-link" data-tab="seccion1">Iniciar
				sesion</a>
		</div>
	</div>
	<h2>CARTELERA</h2>
	<br>
	<table id="cartelera">
		<tr>
			<td id="td-cartelera"><img width="300" height="300"
				src="peliculas/imagenes/template.jpg" /> <br> <a
				href="peliculas/templatePelicula.html">Pelicula</a></td>
			<td id="td-cartelera"><img width="300" height="300"
				src="peliculas/imagenes/template.jpg" /> <br> <a
				href="peliculas/templatePelicula.html">Pelicula</a></td>
		</tr>
		<tr>
			<td id="td-cartelera"><img width="300" height="300"
				src="peliculas/imagenes/template.jpg" /> <br> <a
				href="peliculas/templatePelicula.html">Pelicula</a></td>
			<td id="td-cartelera"><img width="300" height="300"
				src="peliculas/imagenes/template.jpg" /> <br> <a
				href="peliculas/templatePelicula.html">Pelicula</a></td>
		</tr>
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
  
  function iniciarSesion() {
	  if (username == "admin" && passwd == "admin") {
		  window.location.href= "admin/indexAdmin.html"; //dirigir a index admin
	  } else if (username == "user" && passwd == "user") {
		  window.location.href= "indexUser.html"; //dirigir a index
		  //añadir funciones de usuario registrado
	  }
  }
  
  function registrarse() {
	 var passwd1 = document.getElementById("passwordInputReg1").value;
	 var passwd2 = document.getElementById("passwordInputReg2").value;
	 if (passwd1 != passwd2) {
		 document.getElementById("registroIncorrecto").innerHTML = "La contrasenya de confirmacion no coincide con la primera.";
	 } else {
		 window.location.href= "indexUser.html"; //dirigir a index
		 //iniciar sesion y añadir funciones de usuario registrado
	 }
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