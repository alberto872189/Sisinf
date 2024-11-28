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
			<h1>EDITAR SESIONES</h1>
			 <form method="post" action="/editarSesion">
			 <h2>Sesion a cambiar</h2>
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
		<a href="/admin/indexAdmin.jsp">Volver</a>
</body>


<!-- JavaScript -->
<script>
function editarSesion() {
	
}
</script>
	
<!-- CSS -->
<style>

    .inline-group {
        display: flex;
        gap: 10px; /* Espaciado entre los campos */
        align-items: center;
        text-align: center;
        justify-content: space-between;
    }
    
  /* General Reset */
body, h1, h2, p, a, table, tr, td, button, form, input, textarea, iframe {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Arial, sans-serif;
}

body {
    background-color: #f4f4f9;
    color: #333;
    line-height: 1.6;
    font-size: 16px;
    text-align: center;
    padding: 2em;
    display: flex; /* Hacemos que el body sea un contenedor flexible */
    flex-direction: column; /* Alineamos los elementos de arriba a abajo */
    align-items: center; /* Centramos los elementos horizontalmente */
    justify-content: flex-start; /* Colocamos los elementos al principio de la página */
    height: 100vh; /* Aseguramos que el body ocupe toda la altura de la ventana */
}
button {
    background-color: #28a745;
    color: white;
    border: none;
    padding: 0.5em 1em;
    border-radius: 5px;
    cursor: pointer;
    font-size: 1em;
}

/* Formulario */
form {
    background: white;
    padding: 1.5em;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    max-width: 600px;
    margin: 0 auto 1.5em auto;
    display: flex;
    text-align: center;
    justify-content: center;
    flex-direction: column;
}

button:hover {
    background-color: #218838;
}

a {
    color: #007bff;
    text-decoration: none;
}

a:hover {
    text-decoration: underline;
}

form input[type="submit"] {
    background-color: #28a745;
    color: white;
    border: none;
    padding: 0.5em 1em;
    border-radius: 5px;
    cursor: pointer;
    font-size: 1em;
}

input[type="submit"]:hover {
    background-color: #218838;
}

input[type="text"] {
    width: 300px;
    padding: 0.8em;
    margin-bottom: 1em;
    border: 1px solid #ccc;
    border-radius: 5px;
}

input[type="number"] {
    width: 300px;
    padding: 0.8em;
    margin-bottom: 1em;
    border: 1px solid #ccc;
    border-radius: 5px;
}

input[type="date"] {
    width: 300px;
    padding: 0.8em;
    margin-bottom: 1em;
    border: 1px solid #ccc;
    border-radius: 5px;
}

input[type="time"] {
    width: 300px;
    padding: 0.8em;
    margin-bottom: 1em;
    border: 1px solid #ccc;
    border-radius: 5px;
}

select {
    width: 300px;
    padding: 0.8em;
    margin-bottom: 1em;
    border: 1px solid #ccc;
    border-radius: 5px;
}

input[type="checkbox"] {
    transform: scale(1.5);
    margin: 0;
    cursor: pointer;
}

h1 {
    font-size: 2.5em;
    color: #007bff;
    margin-bottom: 1em;
    text-align: center;
}

h2 {
    font-size: 1.8em;
    color: #333;
    margin-top: 1em;
    margin-bottom: 0.5em;
    text-align: center;
}
</style>
</html>