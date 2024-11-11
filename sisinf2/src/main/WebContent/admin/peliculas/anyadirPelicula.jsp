<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Anyadir Pelicula</title>
</head>
<body>
<h2>AÃ‘ADIR PELICULA</h2>
<div>
	<form method="post" action="añadirPelicula">
            Nombre:
            <br>
            <input type="text" id="nombre" name="nombre" placeholder="Nombre de la película" required>
            <br><br>

            Precio:
            <br>
            <input type="text" id="precio" name="precio" placeholder="Precio de la película" required>
            <br><br>

            Sesiones:
            <br>
            Hora:
            <input type="time" id="hora" name="hora" required>
            <br><br>

            Fecha:
            <input type="date" id="dia" name="dia" required>
            <br><br>

            Sala:
            <select id="sala" name="sala" required>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
            </select>
            <br><br>

            <button type="submit">Añadir Sesión</button>
        </form>
	<br>
	<br>
	<h3>Peliculas previamente disponibles:</h3>
	<ul>
		<li>Pelicula 1: 5â‚¬</li>
		<li>Pelicula 2: 6â‚¬</li>
	</ul>
	<br>
	<br>
	<a href="../indexAdmin.jsp">VOLVER</a>
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

<script>
function anyadirSesion() {
	var username = document.getElementById("dia").value;
	document.getElementById("texto").innerHTML = username;	
}


</script>
</html>