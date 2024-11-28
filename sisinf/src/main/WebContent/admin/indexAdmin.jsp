<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home admin</title>
</head>
<%@ page import="vo.Producto" %>
<%@ page import="dao.postgres.DAOProductoPostgres" %>
<%@ page import="java.util.List" %>
<%@ page import="vo.Pelicula" %>
<%@ page import="dao.postgres.DAOPeliculaPostgres" %>

<!-- Secciones -->
<main>
  	<div class="tabs">
    	<div id="seccion1" class="tab-content">
      		<h2>Peliculas</h2>
      		<ul>
      			<li><a href="/admin/peliculas/anyadirPelicula.jsp">Añadir peliculas/sesiones</a></li>
      			<li><a href="/admin/peliculas/borrarPelicula.jsp">Borrar peliculas</a></li>
      			<li><a href="/admin/peliculas/editarSesiones.jsp">Editar sesiones</a></li>
      			<li><a href="/admin/peliculas/consultarDatos.jsp">Consultar datos</a></li>
      		</ul>
      		
    	</div>
		<br>
		<br>
    	<div id="seccion2" class="tab-content">
      		<h2>Bar</h2>
      		<ul>
      			<li><a href="/admin/bar/anyadirProducto.jsp">Añadir productos</a></li>
      			<li><a href="/admin/bar/borrarProducto.jsp">Borrar productos</a></li>
      			<li><a href="/admin/bar/modificarPrecios.jsp">Editar precios</a></li>
       		</ul>
    	</div>
		<br>
		<br>
    	<div id="seccion3" class="tab-content">
    		<h2>Ofertas</h2>
    		Enviar oferta a clientes
    		<br>
    		<br>
    		<input type="text" id="nombreOferta" placeholder="Nombre oferta">
    		<br>
    		<br>
    		<div style="text-align:center;">
    			<table style="margin:0 auto;">
    				<tr>
    					<td>
    					<ul>
    					<%
				DAOPeliculaPostgres dao = new DAOPeliculaPostgres("usuario", "user");
				List<Pelicula> peliculas = dao.obtenerPeliculas();
				for (Pelicula pelicula : peliculas) {
				%>
					<%="<li><input type=\"checkbox\" name=\"peliculas\" value=\"" + pelicula.Titulo + "\">    " + pelicula.Titulo + "</li><br>" %>
				<%
				}
				%>
				</ul>
    			</td>
    			</tr>
    			<tr>
    			<td>
    			<ul>
    			<%
				DAOProductoPostgres dao2 = new DAOProductoPostgres("usuario", "user");
				List<Producto> productos = dao2.obtenerProductos();
				for (Producto producto : productos) {
					if(producto.Disponible) {
				%>
					<%="<li> <input type=\"checkbox\" name=\"productos\" value=\"" + producto.Nombre + "\">    " + producto.Nombre + ": " + producto.Precio + "</li><br>" %>
				<%
					}
				}
				%>
				</ul>
    					</td>
    				</tr>
    			</table>
    		</div>
    		<br>
    		Descuento:
    		<input type="text" placeholder="Porcentaje de descuento">
    		<br>
    		<br>
    		<button onclick="enviarDescuento()">Enviar descuento</button>
    	</div>
    	<br>
    	<br>
    	<a href="/index.jsp" onclick="cerrarSesion()">CERRAR SESION</a>
  	</div>
</main>



<!-- JavaScript -->
<script>
function cerrarSesion() {
	  document.cookie = "login=; expires=Thu, 01 Jan 1970 00:00:00 UTC;";
}
</script>
	
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
  
</style>
</html>