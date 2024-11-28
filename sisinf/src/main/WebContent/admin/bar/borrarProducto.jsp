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
	<form method="post" action="/borrarProductos">
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
	<a href="/admin/indexAdmin.jsp">VOLVER</a>
<script>
	document.getElementById('delete-selected').addEventListener('click', function() {
  	const checkboxes = document.querySelectorAll('input[name="product[]"]:checked');
  	checkboxes.forEach(function(checkbox) {
    checkbox.parentNode.remove();	});
	});
</script>

<style>
  /* General Reset */
body, h1, h2, p, a, table, tr, td, button, form, input, textarea, iframe {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Arial, sans-serif;
}

body {
    background-color: #f4f4f9;
    color: #333;
    line-height: 1.6;
    font-size: 16px;
    padding:2em;
    display: flex; 
  	text-align: center; 
	justify-content: center; 
}

button {
    background-color: #28a745;
    color: white;
    border: none;
    padding: 0.5em 1em;
    border-radius: 5px;
    cursor: pointer;
    font-size: 1em;
}

/* Formulario */
form {
    background: white;
    padding: 1.5em;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    max-width: 600px;
    margin: 0 auto 1.5em auto;
}

button:hover {
    background-color: #218838;
}

a {
    color: #007bff;
    text-decoration: none;
}

a:hover {
    text-decoration: underline;
}

input[type="text"] {
    width: 300px;
    padding: 0.8em;
    margin-bottom: 1em;
    border: 1px solid #ccc;
    border-radius: 5px;
}

input[type="email"] {
    width: 300px;
    padding: 0.8em;
    margin-bottom: 1em;
    border: 1px solid #ccc;
    border-radius: 5px;
}


input[type="checkbox"] {
    transform: scale(1.5);
    margin: 0;
    cursor: pointer;
}

h1 {
    font-size: 2.5em;
    color: #007bff;
    margin-bottom: 1em;
    text-align: center;
}

h2 {
    font-size: 1.8em;
    color: #333;
    margin-top: 1em;
    margin-bottom: 0.5em;
    text-align: center;
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
