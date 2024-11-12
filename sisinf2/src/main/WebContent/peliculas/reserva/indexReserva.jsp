<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reserva</title>
</head>
<%@ page import="dao.postgres.DAOSesionPostgres" %>
<%@ page import="dao.postgres.DAOButacaPostgres" %>
<%@ page import="vo.Pelicula" %>
<%@ page import="vo.Sesion" %>
<%@ page import="java.util.List" %>
<%@ page import="vo.Butaca" %>
<%@ page import="vo.Producto" %>

<body>
<% String pel = request.getParameter("pelicula");
	String ret = request.getParameter("anteriorPagina"); %>
		<form name ="reserva" action=indexReserva2.jsp >
			 <label for="nEntradas">Número de entradas:</label><br>
			 <input type="number" name="nEntradas" value="1"><br><br>
			 <label for="dia">día:</label><br>
			 <input type="date" name="dia"><br><br>
			 Hora
			 <select name="Hora">
			 	<option value="16:00">16:00</option>
			 	<option value="18:00">18:00</option>
			 	<option value="20:00">20:00</option>
			 </select>
			 <br><br>
			Productos del bar <br>
			<input type="checkbox" name="Palomitas" > Palomitas<br>
			<input type="checkbox" name="Palomitas" > Refresco<br>	 
			 <br>
			Sala
		 	<select name="Sala">
			 	<option value="1">1</option>
			 	<option value="2">2</option>
			 	<option value="3">3</option>
			 </select>
		 	<br>
		 	<br>
		<br><br>
		<input type="submit" value="Asientos">	 
		</form>
		<br>
		<%="<a href=\"peliculas/pelicula.jsp?pelicula=\"" + pel + "\"?anteriorPagina=\"" + ret + "\">Volver</a>" %>
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
</style>
</html>