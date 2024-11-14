<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modificar productos</title>
<%@ page import="vo.Producto" %>
<%@ page import="dao.postgres.DAOProductoPostgres" %>
<%@ page import="java.util.List" %>
</head>
<body>
<h2>Modificar productos</h2>
<form method="post" action="/sisinf2/editarProductos">
<ol>
  		<%
		DAOProductoPostgres dao2 = new DAOProductoPostgres("usuario", "user");
		List<Producto> productos = dao2.obtenerProductos();
		for (Producto producto : productos) {
			if(producto.Disponible) {
				%>
					<%="<input type=\"hidden\" name=\"productos\" value=\"" + producto.Nombre + "\" required>" %>
					<%="<li><span>" + producto.Nombre + ": " + producto.Precio + "</span><input type=\"number\" step=\"0.01\" name=\"precios\" value=\"" + producto.Precio + "\" required></li><br>" %>
				<%
			}
		}
	%>
</ol>
<input type="submit" value="Confirmar">
</form>
	<br>
  	<a href="/sisinf2/admin/indexAdmin.jsp">VOLVER</a>
</body>

<style>
html {
  display: flex;
  text-align: center; 
  justify-content: center;
}

ol {
  padding: 80px;
  position: relative;
  text-align: left;  
}

li {
  margin-bottom: 40px;
}

.modify-button {
  display: flex; 
  margin-left: 250px; 
}

</style>
