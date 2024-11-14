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
      			<li><a href="/sisinf/admin/peliculas/anyadirPelicula.jsp">Añadir peliculas</a></li>
      			<li><a href="/sisinf/admin/peliculas/borrarPelicula.jsp">Borrar peliculas</a></li>
      			<li><a href="/sisinf/admin/peliculas/editarSesiones.jsp">Editar sesiones</a></li>
      			<li><a href="/sisinf/admin/peliculas/consultarDatos.jsp">Consultar datos</a></li>
      		</ul>
      		
    	</div>
		<br>
		<br>
    	<div id="seccion2" class="tab-content">
      		<h2>Bar</h2>
      		<ul>
      			<li><a href="/sisinf/admin/bar/anyadirProducto.jsp">Añadir productos</a></li>
      			<li><a href="/sisinf/admin/bar/borrarProducto.jsp">Borrar productos</a></li>
      			<li><a href="/sisinf/admin/bar/modificarPrecios.jsp">Editar precios</a></li>
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
					<%="<li><span>" + pelicula.Titulo + "</span><input type=\"checkbox\" name=\"peliculas\" value=\"" + pelicula.Titulo + "\"></li><br>" %>
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
					<%="<li><span>" + producto.Nombre + ": " + producto.Precio + "</span><input type=\"checkbox\" name=\"productos\" value=\"" + producto.Nombre + "\"></li><br>" %>
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
    	<a href="/sisinf/index.jsp" onclick="cerrarSesion()">CERRAR SESION</a>
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