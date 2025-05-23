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
<h1>A�ADIR PRODUCTO</h1>
<div>
	<form method="post" action="/addProducto">
		<input type="text" name="producto" placeholder="Nombre del producto">
		<br>
		<br>
		<input type="number" step="0.01" name="precio" placeholder="Precio del producto">
		<br>
		<br>
		<input type="submit" value="A�adir">
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
    text-align: center;
    padding: 2em;
    display: flex; /* Hacemos que el body sea un contenedor flexible */
    flex-direction: column; /* Alineamos los elementos de arriba a abajo */
    align-items: center; /* Centramos los elementos horizontalmente */
    justify-content: flex-start; /* Colocamos los elementos al principio de la p�gina */
    height: 100vh; /* Aseguramos que el body ocupe toda la altura de la ventana */
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

form input[type="submit"] {
    background-color: #28a745;
    color: white;
    border: none;
    padding: 0.5em 1em;
    border-radius: 5px;
    cursor: pointer;
    font-size: 1em;
}

input[type="submit"]:hover {
    background-color: #218838;
}

input[type="text"] {
    width: 300px;
    padding: 0.8em;
    margin-bottom: 1em;
    border: 1px solid #ccc;
    border-radius: 5px;
}

input[type="number"] {
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
   
  ul {
  list-style: none;
  margin: 0;
  padding: 0;
  }

  li {
    margin-right: 20px;
  }

</style>
</html>