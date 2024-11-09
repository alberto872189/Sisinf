<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home admin</title>
</head>

<!-- Secciones -->
<main>
  	<div class="tabs">
    	<div id="seccion1" class="tab-content">
      		<h2>Peliculas</h2>
      		<ul>
      			<li><a href="/admin/peliculas/anyadirPelicula.jsp">Añadir peliculas</a></li>
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
    					Pelicula 1
    					<input type="checkbox" name="pelicula1">
    					</td>
    					<td>
    					Pelicula 2
    					<input type="checkbox" name="pelicula2">
    					</td>
    					<td>
    					Pelicula 3
    					<input type="checkbox" name="pelicula2">
    					</td>
    					<td>
    					Pelicula 4
    					<input type="checkbox" name="pelicula2">
    					</td>
    				</tr>
    				<tr>
    					<td></td>
    					<td>
    					Palomitas
    					<input type="checkbox" name="pelicula2">
    					</td>
    					<td>
    					Refresco
    					<input type="checkbox" name="pelicula2">
    					</td>
    					<td></td>
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
    	<a href="/index.jsp">CERRAR SESION</a>
  	</div>
</main>



<!-- JavaScript -->
<script>
function enviarDescuento() {
	
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