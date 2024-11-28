<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Anyadir producto</title>
</head>
<%@ page import="vo.Producto" %>
<%@ page import="dao.postgres.DAOProductoPostgres" %>
<%@ page import="java.util.List" %>
<body>
<h2>AÑADIR PRODUCTO</h2>
<div>
	<form method="post" action="/addProducto">
		<input type="text" name="producto" placeholder="Nombre del producto">
		<br>
		<br>
		<input type="number" step="0.01" name="precio" placeholder="Precio del producto">
		<br>
		<br>
		<input type="submit" value="Añadir">
	</form>
	<br>
	<br>
	<h3>Productos previamente disponibles:</h3>
	<ul>
	<%
		DAOProductoPostgres dao2 = new DAOProductoPostgres("usuario", "user");
		List<Producto> productos = dao2.obtenerProductos();
		for (Producto producto : productos) {
			if (producto.Disponible) {
				%>
					<%="<li>" + producto.Nombre + ": " + producto.Precio + "</li><br>" %>
				<%
			}
		}
	%>
	</ul>
	<br>
	<br>
	<a href="/admin/indexAdmin.jsp">VOLVER</a>
</div>
</body>


<!-- CSS -->
<style>
  
  
  ul {
  list-style: none;
  margin: 0;
  padding: 0;
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