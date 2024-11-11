<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>editarSesiones</title>
</head>
<body>
			<h1>Editar sesión</h1>
			 <h2>Sesión a cambiar</h2>
			 	Pelicula:
			 	<select name="PeliculaVieja">
			 	<option value="Pelicula1">Pelicula1</option>
			 	<option value="Pelicula2">Pelicula2</option>
			 	<option value="Pelicula3">Pelicula3</option>
			 	<option value="Pelicula3">Pelicula4</option>
			 </select>
			 Fecha:
			 <input type="date" name="dia">
			 Hora:
			 <select name="Hora">
			 	<option value="16:00">16:00</option>
			 	<option value="18:00">18:00</option>
			 	<option value="20:00">20:00</option>
			 </select>
			 Sala
			 <select name="Sala">
			 	<option value="1">1</option>
			 	<option value="2">2</option>
			 	<option value="3">3</option>
			 </select>
			 
			 <h2>Nueva Sesión</h2>
		<form name="editarSesion" action="post" action="editarSesion">
			 	Pelicula:
			 	<select name="PeliculaNueva" required>
			 	<option value="Pelicula1">Pelicula1</option>
			 	<option value="Pelicula2">Pelicula2</option>
			 	<option value="Pelicula3">Pelicula3</option>
			 	<option value="Pelicula3">Pelicula4</option>
			 	</select>
			 	Fecha:
			 	<input type="date" name="diaNuevo" required>
			 	Hora:
			 	<input type="time" required>
			 	Sala
			 	<select name="Sala">
			 	<option value="1">1</option>
			 	<option value="2">2</option>
			 	<option value="3">3</option>
			 </select>
			 <br>
			 <br>
		<input type="submit" value="Cambiar">
		</form>
		<br>
		<a href="../indexAdmin.jsp">Volver</a>
</body>


<!-- JavaScript -->
<script>
function editarSesion() {
	
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