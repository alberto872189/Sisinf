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
        <form method="post" action="/sisinf2/anyadirPelicula" enctype="multipart/form-data">
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
            <input type="file" id="imagen" name="imagen" accept="image/*" required>
            <br>
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
        <form method="post" action="/sisinf2/anyadirSesion">
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

    <a href="/sisinf2/admin/indexAdmin.jsp">VOLVER</a>
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
    form {
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
	}

</style>

</html>
