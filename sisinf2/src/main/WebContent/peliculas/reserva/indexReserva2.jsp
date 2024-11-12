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
		<form name ="reserva" action=entrada.html >
			 Asientos
			 <table id="asientos">
			
	<!-- OBTENER BUTACAS -->
	<%	
		DAOButacaPostgres dao = new DAOButacaPostgres("usuario", "user");
		Integer sala = Integer.valueOf(request.getParameter("Sala"));
		List<Butaca> butacas = dao.obtenerSala(sala); 
	
		int ncolumnas = 10;
		int i = 0;
		int fintr = 1;
		int nfila = 1;
		for (Butaca but : butacas) {
			if (i % ncolumnas == 0) {
	%>
			<%= "<tr>" %>
	<%
			}
	%>
		<%= "<td id=\"td-asientos\"><input type=\"checkbox\" name=\"" + nfila + "-" + i+1 + "\"></td>"%>
	<%		
			if (fintr == ncolumnas) {
				nfila++;
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
		<br><br>
		<input type="submit" value="Pagar">	 
		</form>
		<br>
		<%="<a href=\"peliculas/reserva/indexReserva.jsp?pelicula=\"" + pel + "\"?anteriorPagina=\"" + ret + "\">Volver</a>" %>
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