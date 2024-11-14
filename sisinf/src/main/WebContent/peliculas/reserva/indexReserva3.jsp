<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reserva</title>
</head>
<%@ page import="dao.postgres.DAOProductoPostgres" %>
<%@ page import="vo.Pelicula" %>
<%@ page import="vo.Sesion" %>
<%@ page import="java.util.List" %>
<%@ page import="vo.Butaca" %>
<%@ page import="vo.Producto" %>

<body>
<% 
	String pel = request.getParameter("pelicula");
	String entradas[] = (String[])request.getAttribute("idEntradas");
	Integer nEntradas = (Integer)request.getAttribute("nEntradas");
	String hora = (String)request.getAttribute("hora");
	String sala = (String)request.getAttribute("sala");
	String user = null;
	Cookie[] cookies = request.getCookies();
	if(cookies != null){
		for (Cookie cookie : cookies){
			if(cookie.getName().equals("login"))
				user = cookie.getValue();
		}
	}
%>

		<form name ="reserva" method="post" action="/sisinf/addProductoEntrada" >
			<h1>Productos del bar</h1> <br>
			<%
			DAOProductoPostgres dao2 = new DAOProductoPostgres("usuario", "user");
			List<Producto> productos = dao2.obtenerProductos();
			%>
			<table>
			<tr>
			<%
			int i = 1;
			for (String id : entradas) {
				%>
				<%="<td> Entrada " + i + ": " + id + "<br>" %>
				<%
				for (Producto producto : productos) {
					if (producto.Disponible) {
				%>
					<%="<input width=\"12px\" heigth=\"12px\" type=\"checkbox\" name=\"productos\" value=\"" + producto.Nombre + ";" + id + "\">" + producto.Nombre + "<br>" %>
				<%
					}
				}
				%>
				<%="</td>"%>
				<%
				i++;
			}
			%>
			</tr>
			</table>
			<input type="submit" value="Confirmar y pagar">
		</form>
		<br>
		<form method="post" action="/sisinf/borrarEntrada">
			<%
				for (String id : entradas) {
					%>
					<%="<input type=\"hidden\" name=\"idEntradas\" value=\"" + id + "\" required>"%>
					<%
				}
			%>
			
			<%
			int k = hora.indexOf(" ");
			hora = hora.substring(0, k) + "+" + hora.substring(k+1);
			%>
			<input type="hidden" name="nButacas" value="<%=nEntradas%>" required>
			<input type="hidden" name="pelicula" value="<%=pel%>" required>
			<input type="hidden" name="hora" value=<%=hora%> required>
			<input type="hidden" name="sala" value=<%=sala%> required>
			<input type="submit" value="Volver">
		</form>
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
  
  td {
  	padding-left: 50px;
  	padding-right: 50px;
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