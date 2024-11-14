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
			 <form method="post" action="/sisinf2/editarSesion">
			 	<select id="sesionVieja" name="sesionVieja" required>
			 	<%
                    DAOPeliculaPostgres dao = new DAOPeliculaPostgres("usuario", "user");
                    List<Pelicula> peliculas = dao.obtenerPeliculas();
                	DAOSesionPostgres dao2 = new DAOSesionPostgres("usuario", "user"); 
                    for (Pelicula pel : peliculas) {
    					List<Sesion> sesiones = dao2.obtenerSesionesPel(pel.Titulo); 
    					for (Sesion sesion : sesiones) {
    						out.print("<option value=\""+sesion.Sesion_Hora+";"+sesion.N_Sala+"\">" + pel.Titulo + ", Fecha y Hora " + sesion.Sesion_Hora + ",  Sala " + sesion.N_Sala + ", Precio" + sesion.Precio + " $</option>");
    					}
                    }
                %>
			 </select>
			 <h2>Nueva Sesión</h2>
			 	Pelicula:
			 	<select id="peliculaNueva" name="peliculaNueva" required>
			 	<%
                    for (Pelicula pel : peliculas) {
                        out.print("<option value='" + pel.Titulo + "'>" + pel.Titulo + "</option>");
                    }
                %>
			 	</select>
			 	<br>
			 <div class="inline-group">
			 	Sala:
			 	<select id="salaNueva" name="salaNueva">
			 	<%
			 		DAOSalaPostgres dao3 = new DAOSalaPostgres("usuario", "user"); 
			 		List<Sala> salas = dao3.obtenerSalas();
                    for (Sala sala : salas) {
                        out.print("<option value='" + String.valueOf(sala.n) + "'>" + String.valueOf(sala.n) + "</option>");
                    }
                %>
			 	</select>
				 Precio:
			 	<input type="number" step="0.01" id="precioNuevo" name="precioNuevo" required>
			</div>
			<br>
			<div class="inline-group">
			 	Fecha:
			 	<input type="date" id="diaNuevo" name="diaNuevo" required>
			 	Hora:
			 	<input type="time" id="horaNueva" name="horaNueva" required>
			 </div>
			 <br>
			 <br>
		<input type="submit" value="Cambiar">
		</form>
		<br>
		<p>${mensajeEditarSesion}</p>
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

	form {
        display: flex;
        flex-direction: column;
        width: 450px;
        margin: 0 auto;
    }
    
    .inline-group {
        display: flex;
        gap: 10px; /* Espaciado entre los campos */
        align-items: center;
        justify-content: space-between;
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