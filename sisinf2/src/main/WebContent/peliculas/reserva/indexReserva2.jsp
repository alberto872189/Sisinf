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
<% 
	String pel = request.getParameter("pelicula");
	String nEntradas = request.getParameter("nEntradas"); 
	
	String user = null;
	Cookie[] cookies = request.getCookies();
	if(cookies != null){
		for (Cookie cookie : cookies){
			if(cookie.getName().equals("login"))
				user = cookie.getValue();
		}
	}
%>
<%=user %>

		<form name ="reserva" method="post" action="/sisinf2/reservarEntrada" >
	<!-- OBTENER BUTACAS -->
	<%	
		DAOButacaPostgres dao = new DAOButacaPostgres("usuario", "user");
		String hora = String.valueOf(request.getParameter("Hora"));
		int k = hora.indexOf(";");
		Integer sala = Integer.valueOf(hora.substring(k+1, hora.length()));
		List<Butaca> butacas = dao.obtenerSala(sala); 
	%>
	<h1><%=pel%>, SALA <%=sala%>, <%=hora.substring(0, k)%></h1>
	<h2>Asientos</h2>
	<br>
	<table id="asientos">
	<%
		int ncolumnas = 10;
		int i = 0;
		int fintr = 1;
		for (Butaca but : butacas) {
			int idButaca = i+1;
			if (i % ncolumnas == 0) {
	%>
			<%= "<tr>" %>
	<%
			}
	%>
		<%= "<td id=\"td-asientos\"><input type=\"checkbox\" name=\"butaca\" value=\"" + idButaca + "\"></td>"%>
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
		<br><br>
		<input type="hidden" value="<%=hora.substring(0, k)%>" name="hora" required>
		<input type="hidden" value="<%=sala%>" name="sala" required>
		<input type="hidden" value="<%=user%>" name="usuario" required>
		<input type="hidden" value="<%=nEntradas%>" name="nEntradas" required>
		<input type="hidden" value="<%=pel%>" name="pelicula" required>
		<input type="hidden" value="<%=request.getParameterValues("producto")%>" name="producto">
		<input type="submit" value="Pagar">	 
		</form>
		<p>${Butacas}</p>
		<br>
		<a onclick="history.back()">Volver</a>
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