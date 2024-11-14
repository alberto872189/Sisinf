<!DOCTYPE html>
<html>
<%@ page import="dao.postgres.DAOPeliculaPostgres" %>
<%@ page import="vo.Pelicula" %>
<%@ page import="dao.postgres.DAOSalaPostgres" %>
<%@ page import="vo.Sala" %>
<%@ page import="dao.postgres.DAOSesionPostgres" %>
<%@ page import="vo.Sesion" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat"%>
<head>
<meta charset="UTF-8">
<title>editarSesiones</title>
</head>
<body>
			<h1>Editar sesion</h1>
			 <h2>Sesion a cambiar</h2>
			 	Pelicula:
			 	<select name="PeliculaVieja">
			 	<%
                    DAOPeliculaPostgres dao = new DAOPeliculaPostgres("usuario", "user");
                    List<Pelicula> peliculas = dao.obtenerPeliculas();
                    
                    for (Pelicula pel : peliculas) {
    					DAOSesionPostgres dao2 = new DAOSesionPostgres("usuario", "user"); 
    					List<Sesion> sesiones = dao2.obtenerSesionesPel(pel.Titulo); 
                        out.print("<option value='" + pel.Titulo + "'>" + pel.Titulo + "</option>");
                    }
                %>
			 </select>
			 Fecha y hora:
			 <select name="FechaHora">
			 	<% String peliculaVieja = request.getParameter("PeliculaVieja");
					DAOSesionPostgres dao3 = new DAOSesionPostgres("usuario", "user"); 
					List<Sesion> sesiones = dao3.obtenerSesionesPel(peliculaVieja); 
					%>
					<%for (Sesion sesion : sesiones) {%>
						<%="<option value=\"" + sesion.Sesion_Hora +";" + sesion.N_Sala + "\">" + sesion.Sesion_Hora + ",  sala " + sesion.N_Sala + "</option>"%>
					<%}%>
			 </select>
			 Sala
			 <select name="Sala">
			 	<%
                    DAOSalaPostgres dao2 = new DAOSalaPostgres("usuario", "user");
                    List<Sala> salas = dao2.obtenerSalas();
                    for (Sala sala : salas) {
                        out.print("<option value='" + String.valueOf(sala.n) + "'>" + String.valueOf(sala.n) + "</option>");
                    }
                %>
			 </select>
			 
			 <h2>Nueva Sesión</h2>
		<form name="editarSesion" action="post" action="editarSesion">
			 	Pelicula:
			 	<select name="PeliculaNueva" required>
			 	<%
                    for (Pelicula pel : peliculas) {
                        out.print("<option value='" + pel.Titulo + "'>" + pel.Titulo + "</option>");
                    }
                %>
			 	</select>
			 	Fecha:
			 	<input type="date" name="diaNuevo" required>
			 	Hora:
			 	<input type="time" required>
			 	Sala
			 	<select name="Sala">
			 	<%
                    for (Sala sala : salas) {
                        out.print("<option value='" + String.valueOf(sala.n) + "'>" + String.valueOf(sala.n) + "</option>");
                    }
                %>
			 </select>
			 <br>
			 <br>
		<input type="submit" value="Cambiar">
		</form>
		<br>
		<a href="/sisinf2/admin/indexAdmin.jsp">Volver</a>
</body>


<!-- JavaScript -->
<script>
function editarSesion() {
	
}
</script>
	
<!-- CSS -->
<style>
  
  
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
  	display: flex; 
  	text-align: center; 
	justify-content: center; 
  }
</style>
</html>