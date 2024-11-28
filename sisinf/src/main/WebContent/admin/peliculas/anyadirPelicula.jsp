<!DOCTYPE html>
<html>

<%@ page import="java.util.Map" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="dao.postgres.DAOPeliculaPostgres" %>
<%@ page import="vo.Pelicula" %>
<%@ page import="dao.postgres.DAOSalaPostgres" %>
<%@ page import="vo.Sala" %>
<%@ page import="java.util.List" %>

<head>
<meta charset="UTF-8">
<title>Añadir Película y Sesión</title>
</head>
<body>
<h2>GESTIÓN DE PELÍCULAS</h2>
<div>
    <div class ="buttons">
        <button onclick="showTab('anyadirPel')">Añadir Película</button>
        <button onclick="showTab('anyadirSes')">Crear Sesión</button>
    </div>

    <div id="anyadirPel" class="tab-content">
        <h3>AÑADIR PELÍCULA</h3>
        <form method="post" action="/anyadirPelicula" enctype="multipart/form-data">
            Nombre:
            <br>
            <input type="text" id="titulo" name="titulo" placeholder="Nombre de la película" required>
            <br>
            Resumen:
            <br>
            <input type="text" id="resumen" name="resumen" placeholder="Resumen de la película" required>
            <br>
            Imagen:
            <br>
            <div class="file-upload">
    			<input type="file" id="imagen" class="file-label" name="imagen" accept="image/*" required>
    			<label for="imagen" class="file-label">Seleccionar archivo</label>
			</div>
            Trailer:
            <br>
            <input type="url" id="trailer" name="trailer" placeholder="Enlace al trailer" required>
            <br>
            Imdb:
            <br>
            <input type="url" id="imdb" name="imdb" placeholder="Imdb" required>
            <br>
            <button type="submit">Añadir Película</button>
            
            <p>${mensaje}</p>
        </form>
    </div>

    <div id="anyadirSes" class="tab-content">
        <h3>CREAR SESIÓN</h3>
        <form method="post" action="/anyadirSesion">
            Película:
            <br>
            <select id="pelicula" name="pelicula" required>
                <%
                    DAOPeliculaPostgres dao = new DAOPeliculaPostgres("usuario", "user");
                    List<Pelicula> peliculas = dao.obtenerPeliculas();
                    for (Pelicula pel : peliculas) {
                        out.print("<option value='" + pel.Titulo + "'>" + pel.Titulo + "</option>");
                    }
                %>
            </select>
            <br>
            Hora:
            <br>
            <input type="time" id="hora" name="hora" required>
            <br>
            Fecha:
            <br>
            <input type="date" id="dia" name="dia" required>
            <br>
            Sala:
            <br>
            <select id="sala" name="sala" required>
                <%
                    DAOSalaPostgres dao2 = new DAOSalaPostgres("usuario", "user");
                    List<Sala> salas = dao2.obtenerSalas();
                    for (Sala sala : salas) {
                        out.print("<option value='" + String.valueOf(sala.n) + "'>" + String.valueOf(sala.n) + "</option>");
                    }
                %>
            </select>
            <br>
            Precio:
            <br>
            <input type="number" step="0.01" id="precio" name="precio" placeholder="Precio de la película" required>
            <br>
            <button type="submit">Crear Sesión</button>
        </form>
    </div>
    <br>

    <a href="/admin/indexAdmin.jsp">VOLVER</a>
</div>
</body>

<script>

	document.addEventListener("DOMContentLoaded", () => {
    	showTab('anyadirPel');
	});

    function showTab(tabId) {
        const tabs = document.querySelectorAll('.tab-content');
        tabs.forEach(tab => tab.style.display = 'none');

        document.getElementById(tabId).style.display = 'block';
    }
</script>

<style>
    /*form {
        display: flex;
        flex-direction: column;
        width: 400px;
        margin: 0 auto;
    }

    input, select {
        width: 100%;
        padding: 4px;
        box-sizing: border-box;
    }
    
    input[id="resumen"] {
        width: 100%;
        padding: 20px;
        box-sizing: border-box;
    }

    h2, h3, a {
        display: flex;
        text-align: center;
        justify-content: center;
    }

    #cartelera, #cartelera td{
        margin: 0 auto;
        text-align: center;
        justify-content: center;
    }


    button {
    	margin: 5px;
	}

	.buttons {
    	display: flex;
   	 	justify-content: center;
    	margin-bottom: 20px; /* Espaciado debajo del conjunto de botones */
	}*/
	
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
    padding:2em;
    display: flex; 
  	text-align: center; 
	justify-content: center; 
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

input[type="url"] {
    width: 300px;
    padding: 0.8em;
    margin-bottom: 1em;
    border: 1px solid #ccc;
    border-radius: 5px;
}

.file-upload {
    position: relative;
    display: inline-block;
}

/* Estilos del input de tipo file (oculto) */
#imagen {
    display: none;
}

/* Estilo para el label que actúa como el botón de carga */
.file-label {
    background-color: #007bff;
    color: white;
    border: none;
    padding: 0.5em 1em;
    border-radius: 5px;
    cursor: pointer;
    font-size: 1em;
    transition: background-color 0.3s;
    display: inline-block;
}

.file-label:hover {
    background-color: #0056b3;
}

.file-label:active {
    background-color: #003d82;
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
