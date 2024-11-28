<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Borrar pelicula</title>
</head>
<%@ page import="dao.postgres.DAOPeliculaPostgres" %>
<%@ page import="vo.Pelicula" %>
<%@ page import="java.util.List" %>
<body>
	<h2>CARTELERA</h2>
	<%	
		DAOPeliculaPostgres dao = new DAOPeliculaPostgres("usuario", "user"); 
		List<Pelicula> peliculas = dao.obtenerPeliculas(); 
	%>
	<form method="post" action="/sisinf/borrarPelicula">
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
		<%= "<td id=\"td-cartelera\"><img width=\"300\" height=\"300\" src=\"" + pel.Imagen + "\" /> <br>" + pel.Titulo + "<br><input type=\"checkbox\" name=\"pelicula[]\" value=\""+pel.Titulo+"\"></td>"%>
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
    <br>
    <p>${mensajeBorrarPel}</p>
    <br>
    <button id="delete-selected" type="submit">Borrar seleccionados</button>
    </form>
    <br>
    <br>
    <br>
    <a href="/admin/indexAdmin.jsp">VOLVER</a>
</body>

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
}

/* Cartelera Table */
#cartelera {
    width: 100%;
    border-collapse: collapse;
    margin-top: 1em;
}

#cartelera td {
    padding: 10px;
    text-align: center;
}

#cartelera img {
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    max-width: 100%;
    height: auto;
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

input[type="text"] {
    width: 300px;
    padding: 0.8em;
    margin-bottom: 1em;
    border: 1px solid #ccc;
    border-radius: 5px;
}

input[type="email"] {
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
  
 
  #td-cartelera {
  	padding-bottom: 60px;
  	padding-right: 10px;
  	padding-left: 10px;
  }
  </style>
</html>