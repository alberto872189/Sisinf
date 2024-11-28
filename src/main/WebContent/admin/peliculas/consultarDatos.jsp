<!DOCTYPE html>
<html>
<%@ page import="java.util.Map" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="dao.postgres.DAOPeliculaPostgres" %>
<%@ page import="dao.postgres.DAOEntradaPostgres" %>
<%@ page import="vo.Pelicula" %>
<%@ page import="java.util.List" %>
<head>
<meta charset="UTF-8">
<title>Consultar datos</title>
</head>
<main>
	<h2>CARTELERA</h2>
	<br>
	
	<%	
		DAOPeliculaPostgres dao = new DAOPeliculaPostgres("usuario", "user"); 
		List<Pelicula> peliculas = dao.obtenerPeliculas(); 
	%>
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
		<%= "<td id=\"td-cartelera\"><img width=\"300\" height=\"300\" src=\"" + pel.Imagen + "\" /><br>"+pel.Titulo+"<br>"%>
	<%		DAOEntradaPostgres dao2 = new DAOEntradaPostgres("usuario", "user");
			int numEntPel = dao2.obtenerNumEntradasPelicula(pel.Titulo);
	%>
		<%= "Entradas vendidas: " + numEntPel + "<br></td>" %>
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
    <a href="/admin/indexAdmin.jsp">VOLVER</a>
</main>

<!-- CSS -->
<style>

html {
	display: flex;
	text-align: center;
	justify-content: center;
}

main {
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