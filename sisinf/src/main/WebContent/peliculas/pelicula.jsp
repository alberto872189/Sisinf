<!DOCTYPE html>
<html>
<head>
<!-- <link rel="stylesheet" type="text/css" href="css/styles.css">  -->
<meta charset="UTF-8">
<title>Pelicula</title>
</head>
<%@ page import="dao.postgres.DAOPeliculaPostgres" %>
<%@ page import="dao.postgres.DAOSesionPostgres" %>
<%@ page import="dao.postgres.DAOComentarioPostgres" %>
<%@ page import="vo.Pelicula" %>
<%@ page import="vo.Comentario" %>
<%@ page import="vo.Sesion" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Map"%>

<div class="topbar">
	<h1>Desacine</h1>
	<!-- Menu -->
	<div class="menu">
		<button onclick="regreso()">CARTELERA</button>
	</div>
</div>
<body>
<!-- OBTENER PELICULA DE request -->
<% String pel = request.getParameter("pelicula");
	DAOPeliculaPostgres dao = new DAOPeliculaPostgres("usuario", "user"); 
	Pelicula pelicula = dao.obtener(pel); 
%>

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
<div id="notTopbar">
<h1 style="text-align:left"><%=pelicula.Titulo %></h1>
	<div style="float:left">
	
		<table id="infoPeliculas">
			<tr>
				<!-- imagen de la pelÃ­cula-->
				<%= "<td><img  width=\"300\" height=\"300\" src=\"" + pelicula.Imagen + "\"/></td>"%>
			</tr>
			<tr>
				<td>
					<h2>TRAILER</h2>
					<!-- esto se saca de yt dandole a compartir->insertar si queremos sacar un trailer de yt -->
					<iframe width="560" height="315" src="<%= pelicula.Trailer %>" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
				</td>
			</tr>
			<tr>
				<td><%=pelicula.Resumen %></td>
			</tr>
			<tr>
				<%= "<td><a href=\"" + pelicula.Link_IMDB + "\">Más información</a></td>"%>
			</tr>
			<tr>
				<td><br><a href="/index.jsp">VOLVER</a></td>
			</tr>
		</table>
	</div>
	<div style="float:left">
	<%= "<button id=\"reservaBoton\" onClick=\"reservarEntrada('"+pel+"')\">Reservar entrada</button>" %>
		<table id="horarios">
			<tr>
				<td id="td-horarios">HORA</td>
				<td id="td-horarios">SALA</td>
				<td id="td-horarios">PRECIO</td>
			</tr>
	<!-- OBTENER SESIONES DE LA PELICULA -->
	<%
		DAOSesionPostgres dao2 = new DAOSesionPostgres("usuario", "user"); 
		List<Sesion> sesiones = dao2.obtenerSesionesPel(pel); 
		for (Sesion sesion : sesiones) {
	%>
		<%= "<tr>" %>
		
		<%= "<td id=\"td-horarios\">" + sesion.Sesion_Hora + "</td>"%>
		<%= "<td id=\"td-horarios\">" + sesion.N_Sala + "</td>"%>
		<%= "<td id=\"td-horarios\">" + sesion.Precio + "</td>"%>

		<%= "</tr>" %>
	<%
		}
	%>
		</table>
		<br>
		<br>
		<h2 style="text-align:left">Comentarios</h2>
		<form method="post" action="/publishComment">
			<textarea rows="10" cols="30" name="texto" style="resize: none" placeholder="Escribe aquí tu comentario" required></textarea>
			<br>
			<%="<input type=\"hidden\" name=\"pelicula\" value=\""+ pel + "\" required>" %>
			<%="<input type=\"hidden\" name=\"usuario\" value=\""+ user + "\">" %>
			<%="<input type=\"hidden\" name=\"fecha\" value=\""+ new Date().getTime() + "\" required>" %>
			<input type="submit" value="Publicar">
			<%!Map<String, String> errors;%>
			<%
			errors = (Map<String, String>) request.getAttribute("errors");
			
			if (errors != null && errors.get("Usuario") != null) {
			%>
			<%=errors.get("Usuario")%>	
			<%
			}
			%>
		</form>
		<!-- OBTENER COMENTARIOS PREVIOS -->
		<br>
		<%
		DAOComentarioPostgres dao3 = new DAOComentarioPostgres("usuario", "user"); 
		List<Comentario> comentarios = dao3.obtenerPel(pel); 
		for (Comentario comentario : comentarios) {
			String f = comentario.Fecha.toString();
			int espacio = f.indexOf(" ");
			f = f.substring(0, espacio);
		%>
		
		<%= "<fieldset max-width=\"200px\" id=\"comentario\"><legend>" + comentario.Usuario + "      " + f + "</legend><br>"%>
		 <%= comentario.Texto + "</fieldset><br>"%>
		<%
		}
		%>
	</div>
	</div>
</body>
<script>
function regreso() {
		window.location.href = "/index.jsp";	
}
function reservarEntrada(pelicula){
	window.location.href = "/peliculas/reserva/indexReserva.jsp?pelicula="+pelicula;
}
</script>
<style>
/* General Reset */
body, h1, h2, p, a, table, tr, td, button, form, input, textarea, iframe {
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
    align-items:center;
}

#notTopbar {
	padding:2em;
}
/* Topbar */
.topbar {
    background-color: #1f1f1f;
    color: #fff;
    padding: 1em 2em;
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 1.5em
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
#comentario {
	border: 3px solid #ddd;
	padding:10px;
	border-radius:8px;
	background-color: #f2f2f2;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

img {
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    max-width: 100%;
    height: auto;
}

h1 {
    font-size: 2.5em;
    color: #007bff;
    margin-bottom: 1em;
    text-align: left;
}

h2 {
    font-size: 1.8em;
    color: #333;
    margin-top: 1em;
    margin-bottom: 0.5em;
    text-align: left;
}

/* Information Table */
#infoPeliculas {
    width: 100%;
    max-width: 300px;
    margin-right: 2em;
    float: left;
}

#infoPeliculas td {
    padding: 0.5em;
    text-align: left;
}

#infoPeliculas img {
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

#infoPeliculas a {
    color: #007bff;
    font-weight: bold;
    text-decoration: none;
}

#infoPeliculas a:hover {
    text-decoration: underline;
}

/* Trailer */
iframe {
    border: none;
    border-radius: 8px;
    margin-top: 1em;
}

/* Horarios Table */
#horarios {
    width: 100%;
    border-collapse: collapse;
    margin-top: 1.5em;
    float: left;
}

#horarios tr:nth-child(1) {
    background-color: #007bff;
    color: white;
}

#horarios td {
    border: 1px solid #ddd;
    padding: 0.8em;
    text-align: center;
    font-size: 1em;
}

#horarios td#td-horarios {
    font-weight: bold;
}

#horarios tr:nth-child(even) {
    background-color: #f4f4f9;
}


/* Botón de Reservar */
#reservaBoton {
    background-color: #28a745;
    color: white;
    border: none;
    padding: 0.8em 1.5em;
    border-radius: 5px;
    font-size: 1em;
    cursor: pointer;
    margin: 1.5em 0;
}

#reservaBoton:hover {
    background-color: #218838;
}

/* Comentarios */
textarea {
    width: 100%;
    max-width: 600px;
    height: 100px;
    padding: 0.8em;
    margin-bottom: 1em;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 1em;
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

/* Comentarios previos */

.comment h3 {
    font-size: 1em;
    color: #333;
    margin-bottom: 0.5em;
}

.comment p {
    font-size: 1em;
    color: #555;
}

</style>
</html>
