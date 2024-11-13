<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Anyadir Pelicula</title>
</head>
<body>
<h2>AÑADIR PELICULA</h2>
<div>
	<form method="post" action="añadirPelicula" enctype="multipart/form-data">
            Nombre:
            <br>
            <input type="text" id="nombre" name="nombre" placeholder="Nombre de la película" required>
			<br>
            Precio:
            <br>
            <input type="number" id="precio" name="precio" placeholder="Precio de la película" required>
			<br>
            Imagen:
            <br>
			<input type="file" id="imagen" name="imagen" accept="image/*" required>
			<br>
			Trailer:
			<br>
    		<input type="url" id="trailer" name="trailer" placeholder="Enlace al trailer" required>
			<br>
            Sesiones: 
            Hora:
            <br>
            <input type="time" id="hora" name="hora" required>
			<br>
            Fecha:
            <br>
            <input type="date" id="dia" name="dia" required>
			<br>
            Sala:
            <br>
            <select id="sala" name="sala" required>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
            </select>
			<br>
            <button type="submit">Añadir Sesión</button>
        </form>
	<br>

	<h3>Peliculas previamente disponibles:</h3>
	<ul>
		<li>Pelicula 1: ***</li>
		<li>Pelicula 2: ***</li>
	</ul>
	<br>
	<br>
	<a href="/sisinf2/admin/indexAdmin.jsp">VOLVER</a>
</div>
</body>

<!-- CSS -->
<style>
        form {
            display: flex;
            flex-direction: column;
            width: 400px;
            margin: 0 auto;
        }

        input, select {
            width: 100%;
            padding: 4px;
            box-sizing: border-box;
        }
        
        h2{
  			display: flex; 
  			text-align: center; 
			justify-content: center; 
  		}
  		div {
  			text-align: center; 
			justify-content: center; 
  		}

</style>
</html>