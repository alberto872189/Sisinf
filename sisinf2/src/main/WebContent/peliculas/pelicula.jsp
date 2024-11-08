<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pelicula</title>
</head>

<body>
<h1 style="text-align:left">TITULO PELICULA</h1>
	<div style="float:left">
	<!-- OBTENER PELICULA DE COOKIE -->
		<table id="infoPeliculas">
			<tr>
				<!-- imagen de la película-->
				<%= "<td><img width=\"300\" height=\"300\" src=\"" + pelicula.Imagen + "/></td>"%>
			</tr>
			<tr>
				<!-- video local -->
				<!-- <td><video width="500" height="500" src="videos/template.mp4" poster="imagenes/template.jpg" controls></video></td> -->
			</tr>
			<tr>
				<td>
					<h2>TRAILER</h2>
					<!-- esto se saca de yt dandole a compartir->insertar si queremos sacar un trailer de yt -->
					<iframe width="560" height="315" src="https://www.youtube.com/embed/KAOdjqyG37A?si=uU6kTZnh_b9hMLR9" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
				</td>
			</tr>
			<tr>
				<td>Resumen de la pelicula</td>
			</tr>
			<tr>
				<td><a href="https://www.imdb.com">Más información</a></td>
			</tr>
			<tr>
				<td><a href="reserva/indexReserva.html">Rerservar entrada</a></td>
			</tr>
			<tr>
				<td><br><a onclick="volver()">VOLVER</a></td>
			</tr>
		</table>
	</div>
	<div style="float:left">
		<table id="horarios">
			<tr>
				<td id="td-horarios">DIA</td>
				<td id="td-horarios">HORA</td>
				<td id="td-horarios">SALA</td>
			</tr>
			<tr>
				<td id="td-horarios">5/5/2025</td>
				<td id="td-horarios">12:30</td>
				<td id="td-horarios">1</td>
			</tr>
			<tr>
				<td id="td-horarios">5/6/2025</td>
				<td id="td-horarios">16:30</td>
				<td id="td-horarios">2</td>
			</tr>
			<tr>
				<td id="td-horarios">5/7/2025</td>
				<td id="td-horarios">17:30</td>
				<td id="td-horarios">3</td>
			</tr>
		</table>
		<br>
		<br>
		<h2 style="text-align:left">Comentarios</h2>
		<form>
			<textarea rows="10" cols="30" placeholder="Escribe aqu� tu comentario"></textarea>
			<br>
			<input type="submit" value="Publicar">
		</form>
	</div>
</body>

<script>
function volver() {
	window.history.back();
}
</script>

<style>
body {
  	text-align: center;  
  	margin-left: 30px;
}
  
#infoPeliculas {
	width: 400px;
	padding-right: 200px;
}

#horarios {
	border: 2px solid;
	border-collapse: collapse;
}
	
#td-horarios {
	border: 1px solid;
}
</style>

</html>
