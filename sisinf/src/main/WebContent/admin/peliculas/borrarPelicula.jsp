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
	<form method="post" action="deletePel">
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
		<%= "<td id=\"td-cartelera\"><img width=\"300\" height=\"300\" src=\"" + pel.Imagen + "\" /> <br>" + pel.Titulo + "<br><input type=\"checkbox\" name=\"pelicula[]\" value=\"" + i + "\"></td>"%>
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
    <button id="delete-selected" type="submit">Borrar seleccionados</button>
    </form>
    <br>
    <br>
    <br>
    <a href="/sisinf/admin/indexAdmin.jsp">VOLVER</a>
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
  
 
  #td-cartelera {
  	padding-bottom: 60px;
  	padding-right: 10px;
  	padding-left: 10px;
  }
  </style>
</html>