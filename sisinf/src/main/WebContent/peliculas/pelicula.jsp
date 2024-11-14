<!DOCTYPE html>
<html>
<head>
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

<h1 style="text-align:left"><%=pelicula.Titulo %></h1>
	<div style="float:left">
	
		<table id="infoPeliculas">
			<tr>
				<!-- imagen de la pelÃ­cula-->
				<%= "<td><img width=\"300\" height=\"300\" src=\"" + pelicula.Imagen + "\"/></td>"%>
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
				<%= "<td><a href=\"/sisinf/peliculas/reserva/indexReserva.jsp?pelicula=" + pel + "\">Reservar entrada</a></td>" %>
			</tr>
			<tr>
				<td><br><a href="/sisinf/index.jsp">VOLVER</a></td>
			</tr>
		</table>
	</div>
	<div style="float:left">
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
		<form method="post" action="/sisinf/publishComment">
			<textarea rows="10" cols="30" name="texto" placeholder="Escribe aquí tu comentario"></textarea>
			<br>
			<%="<input type=\"hidden\" name=\"pelicula\" value=\""+ pel + "\">" %>
			<%="<input type=\"hidden\" name=\"usuario\" value=\""+ user + "\">" %>
			<%="<input type=\"hidden\" name=\"fecha\" value=\""+ new Date().getTime() + "\">" %>
			<input type="submit" value="Publicar">
		</form>
		<!-- OBTENER COMENTARIOS PREVIOS -->
		<br>
		<%
		DAOComentarioPostgres dao3 = new DAOComentarioPostgres("usuario", "user"); 
		List<Comentario> comentarios = dao3.obtenerPel(pel); 
		for (Comentario comentario : comentarios) {
		%>
		
		<%= comentario.Fecha + " Usuario:" + comentario.Usuario%>
		 <br>
		 <%= comentario.Texto %>
		 <br>
		 <br>	
		<%
		}
		%>
	</div>
</body>


<style>
body {
  	text-align: center;  
  	margin-left: 30px;
}
  
#infoPeliculas {
	width: 400px;
	padding-right: 200px;
}

#horarios {
	border: 2px solid;
	border-collapse: collapse;
}
	
#td-horarios {
	border: 1px solid;
}
</style>

</html>
