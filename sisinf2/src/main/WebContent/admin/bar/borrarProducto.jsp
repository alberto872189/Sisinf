<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Borrar productos</title>
<%@ page import="vo.Producto" %>
<%@ page import="dao.postgres.DAOProductoPostgres" %>
<%@ page import="java.util.List" %>
</head>
	<h2>Borrar productos</h2>
	<form method="post" action="/sisinf2/borrarProductos">
	<ol>
	<%
		DAOProductoPostgres dao2 = new DAOProductoPostgres("usuario", "user");
		List<Producto> productos = dao2.obtenerProductos();
		for (Producto producto : productos) {
			if(producto.Disponible) {
				%>
					<%="<li><span>" + producto.Nombre + ": " + producto.Precio + "</span><input type=\"checkbox\" name=\"productos\" value=\"" + producto.Nombre + "\"></li><br>" %>
				<%
			}
		}
	%>
	</ol>

	<button id="delete-selected" type="submit">Borrar seleccionados</button>
	</form>
	<br>
	<br>
	<a href="/sisinf2/admin/indexAdmin.jsp">VOLVER</a>
<script>
	document.getElementById('delete-selected').addEventListener('click', function() {
  	const checkboxes = document.querySelectorAll('input[name="product[]"]:checked');
  	checkboxes.forEach(function(checkbox) {
    checkbox.parentNode.remove();	});
	});
</script>

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



</style>
