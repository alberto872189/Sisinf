<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reserva</title>
</head>
<%@ page import="dao.postgres.DAOSesionPostgres" %>
<%@ page import="dao.postgres.DAOButacaPostgres" %>
<%@ page import="vo.Pelicula" %>
<%@ page import="vo.Producto" %>
<%@ page import="vo.Sesion" %>
<%@ page import="java.util.List" %>
<%@ page import="vo.Butaca" %>
<%@ page import="vo.Producto" %>

<body>
<% String pel = request.getParameter("pelicula"); %>
		<form name ="reserva" action=indexReserva2.jsp >
			 <label for="nEntradas">Número de entradas:</label><br>
			 <input type="number" name="nEntradas" value="1"><br><br>
			 <%
			DAOSesionPostgres dao = new DAOSesionPostgres("usuario", "user"); 
			List<Sesion> sesiones = dao.obtenerSesionesPel(pel); 
			%>
			Sesión:
			<select name="Hora" required>
			<%
			for (Sesion sesion : sesiones) {
			%>
				<%="<option value=\"" + sesion.Sesion_Hora +";" + sesion.N_Sala + "\">" + sesion.Sesion_Hora + ",  sala " + sesion.N_Sala + "</option>"%>
			<%
			}
			%>
			 </select>
		<br><br>
		<input type="hidden" value="<%=pel%>" name="pelicula" required>
		<input type="submit" value="Asientos">	 
		</form>
		<br>
		<a href="/sisinf2/index.jsp">Volver</a>
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