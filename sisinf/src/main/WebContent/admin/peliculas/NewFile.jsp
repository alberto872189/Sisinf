<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Añadir Pelicula</title>
    <style>
        /* Estilos generales para el formulario */
        form {
            display: flex;
            flex-direction: column;
            width: 400px;
            margin: 0 auto;
        }

        /* Estilos para los campos de entrada */
        input[type="text"], input[type="number"], input[type="url"], input[type="time"], input[type="date"], select {
            width: 100%;
            padding: 8px;
            margin: 8px 0;
            box-sizing: border-box;
        }

        /* Para hacer que el campo de 'precio' sea más pequeño */
        input[type="number"]#precio {
            width: 60%;
        }

        /* Alineación de los campos 'nombre' y 'precio' */
        .form-row {
            display: flex;
            justify-content: space-between;
        }

        .form-row input {
            width: 48%; /* Hacemos que ambos campos ocupen el 48% de la fila */
        }

        /* Campo de imagen */
        #imagen {
            width: 100%;
        }

        /* Campo de trailer */
        #trailer {
            width: 100%;
        }

        /* Estilos de las secciones */
        .section {
            margin-bottom: 16px;
        }

        /* Para los botones y enlaces */
        button {
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            margin-top: 20px;
        }

        button:hover {
            background-color: #45a049;
        }

        a {
            text-decoration: none;
            color: #4CAF50;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h2>AÑADIR PELICULA</h2>
    <div>
        <form method="post" action="añadirPelicula" enctype="multipart/form-data">
            <div class="section">
                <label for="nombre">Nombre:</label>
                <input type="text" id="nombre" name="nombre" placeholder="Nombre de la película" required>
            </div>

            <div class="section form-row">
                <div>
                    <label for="precio">Precio:</label>
                    <input type="number" id="precio" name="precio" placeholder="Precio de la película" required>
                </div>
            </div>

            <div class="section">
                <label for="imagen">Imagen:</label>
                <input type="file" id="imagen" name="imagen" accept="image/*" required>
            </div>

            <div class="section">
                <label for="trailer">Trailer:</label>
                <input type="url" id="trailer" name="trailer" placeholder="Enlace al trailer" required>
            </div>

            <div class="section">
                <h3>Sesiones:</h3>
                <div class="form-row">
                    <div>
                        <label for="hora">Hora:</label>
                        <input type="time" id="hora" name="hora" required>
                    </div>
                    <div>
                        <label for="dia">Fecha:</label>
                        <input type="date" id="dia" name="dia" required>
                    </div>
                </div>
            </div>

            <div class="section">
                <label for="sala">Sala:</label>
                <select id="sala" name="sala" required>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                </select>
            </div>

            <button type="submit">Añadir Película</button>
        </form>

        <br>
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
</html>