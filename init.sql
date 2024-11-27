insert into administrador(correo, contrasenia, nombre) values ('admin@gmail.com', 'admin', 'admin');

insert into cliente(correo, contrasenia, nombre) values ('user@gmail.com', 'user', 'user');

insert into sala(n_sala) values (1);
insert into sala(n_sala) values (2);
insert into sala(n_sala) values (3);
insert into sala(n_sala) values (4);

insert into pelicula(Titulo, Resumen, Imagen, Link_IMDB, Trailer) values ('Cars',
'El aspirante a campeón de carreras Rayo McQueen parece que está a punto de conseguir el éxito. Su actitud arrogante se desvanece cuando llega a una pequeña comunidad olvidada que le enseña las cosas importantes de la vida que había olvidado.', 
'/peliculas/imagenes/Cars.png',
'https://www.imdb.com/title/tt0317219/',
'https://www.youtube.com/embed/W_H7_tDHFE8?si=a-Vq9kH5PLkAFwj4');

insert into pelicula(Titulo, Resumen, Imagen, Link_IMDB, Trailer) values ('Vengadores',
'Cuando un enemigo inesperado surge como una gran amenaza para la seguridad mundial, Nick Fury, director de la Agencia SHIELD, decide reclutar a un equipo para salvar al mundo de un desastre casi seguro. Adaptación del cómic de Marvel "Los Vengadores", el legendario grupo de superhéroes formado por Ironman, Hulk, Thor y el Capitán América entre otros.', 
'/peliculas/imagenes/Vengadores.png',
'https://www.imdb.com/title/tt4154796/',
'https://www.youtube.com/embed/eOrNdBpGMv8?si=Yc9FiKUAsI6dgOZi');

insert into pelicula(Titulo, Resumen, Imagen, Link_IMDB, Trailer) values ('Titanic',
'Jack es un joven artista que gana un pasaje para viajar a América en el Titanic, el transatlántico más grande y seguro jamás construido. A bordo del buque conoce a Rose, una chica de clase alta que viaja con su madre y su prometido Cal, un millonario engreído a quien solo interesa el prestigio de la familia de su prometida. Jack y Rose se enamoran a pesar de las trabas que ponen la madre de ella y Cal en su relación. Mientras, el lujoso transatlántico se acerca a un inmenso iceberg.', 
'/peliculas/imagenes/Titanic.png',
'https://www.imdb.com/title/tt0120338/',
'https://www.youtube.com/embed/wMZuro21wtE?si=NBGA-r5ASWDdZIRs');

insert into pelicula(Titulo, Resumen, Imagen, Link_IMDB, Trailer) values ('Piraña 3D',
'Un terremoto submarino libera a una especie prehistórica de pez carnívoro y un grupo de desconocidos une fuerzas para evitar convertirse en su comida.', 
'/peliculas/imagenes/Piranya.png',
'https://www.imdb.com/title/tt0464154/',
'https://www.youtube.com/embed/3ksuNWRzc3s?si=R_EYdqaiiKwNpic7');

insert into pelicula(Titulo, Resumen, Imagen, Link_IMDB, Trailer) values ('Joker',
'En Gotham, Arthur Fleck, un comediante con problemas de salud mental, es marginado y maltratado por la sociedad. Se adentra en una espiral de crimen que resulta revolucionaria. Pronto conoce a su alter-ego, el Joker.', 
'/peliculas/imagenes/Joker.png',
'https://www.imdb.com/title/tt7286456/',
'https://www.youtube.com/embed/ygUHhImN98w?si=SBlodj7ze_SvHVra');

insert into pelicula(Titulo, Resumen, Imagen, Link_IMDB, Trailer) values ('Drive',
'Durante el día, Driver es conductor especialista de cine, pero de noche se convierte en chófer para delincuentes. El mundo de Driver cambia el día en que conoce a Irene, una vecina que tiene un hijo pequeño y a su marido en la cárcel.', 
'/peliculas/imagenes/Drive.png',
'https://www.imdb.com/title/tt0780504/',
'https://www.youtube.com/embed/--XQKuqUrMo?si=0B5HsM_DhefbMl7A');

insert into sesion(Sesion_Hora, Tit_Pel, N_Sala, Precio) values ('2025-10-10 11:30:00', 'Cars', 1, 5.5);
insert into sesion(Sesion_Hora, Tit_Pel, N_Sala, Precio) values ('2025-10-10 13:30:00', 'Cars', 2, 6.5);

insert into sesion(Sesion_Hora, Tit_Pel, N_Sala, Precio) values ('2025-10-10 11:30:00', 'Vengadores', 3, 5);
insert into sesion(Sesion_Hora, Tit_Pel, N_Sala, Precio) values ('2025-10-10 13:30:00', 'Vengadores', 4, 5.5);

insert into sesion(Sesion_Hora, Tit_Pel, N_Sala, Precio) values ('2025-10-10 16:30:00', 'Titanic', 1, 6.5);
insert into sesion(Sesion_Hora, Tit_Pel, N_Sala, Precio) values ('2025-10-10 18:30:00', 'Titanic', 2, 6.5);

insert into sesion(Sesion_Hora, Tit_Pel, N_Sala, Precio) values ('2025-10-10 16:30:00', 'Piraña 3D', 3, 5.5);
insert into sesion(Sesion_Hora, Tit_Pel, N_Sala, Precio) values ('2025-10-10 18:30:00', 'Piraña 3D', 4, 5);

insert into sesion(Sesion_Hora, Tit_Pel, N_Sala, Precio) values ('2025-10-11 11:30:00', 'Joker', 1, 5.5);
insert into sesion(Sesion_Hora, Tit_Pel, N_Sala, Precio) values ('2025-10-11 13:30:00', 'Joker', 2, 5.5);

insert into sesion(Sesion_Hora, Tit_Pel, N_Sala, Precio) values ('2025-10-11 16:30:00', 'Drive', 3, 5);
insert into sesion(Sesion_Hora, Tit_Pel, N_Sala, Precio) values ('2025-10-11 18:30:00', 'Drive', 4, 5.5);

insert into producto(Nombre, Precio, Disponible) values ('Palomitas', 3, True);
insert into producto(Nombre, Precio, Disponible) values ('Refresco', 2.5, True);

insert into butaca(n_butaca, sala_n) values (1, 1);
insert into butaca(n_butaca, sala_n) values (2, 1);
insert into butaca(n_butaca, sala_n) values (3, 1);
insert into butaca(n_butaca, sala_n) values (4, 1);
insert into butaca(n_butaca, sala_n) values (5, 1);
insert into butaca(n_butaca, sala_n) values (6, 1);
insert into butaca(n_butaca, sala_n) values (7, 1);
insert into butaca(n_butaca, sala_n) values (8, 1);
insert into butaca(n_butaca, sala_n) values (9, 1);
insert into butaca(n_butaca, sala_n) values (10, 1);
insert into butaca(n_butaca, sala_n) values (11, 1);
insert into butaca(n_butaca, sala_n) values (12, 1);
insert into butaca(n_butaca, sala_n) values (13, 1);
insert into butaca(n_butaca, sala_n) values (14, 1);
insert into butaca(n_butaca, sala_n) values (15, 1);
insert into butaca(n_butaca, sala_n) values (16, 1);
insert into butaca(n_butaca, sala_n) values (17, 1);
insert into butaca(n_butaca, sala_n) values (18, 1);
insert into butaca(n_butaca, sala_n) values (19, 1);
insert into butaca(n_butaca, sala_n) values (20, 1);
insert into butaca(n_butaca, sala_n) values (21, 1);
insert into butaca(n_butaca, sala_n) values (22, 1);
insert into butaca(n_butaca, sala_n) values (23, 1);
insert into butaca(n_butaca, sala_n) values (24, 1);
insert into butaca(n_butaca, sala_n) values (25, 1);
insert into butaca(n_butaca, sala_n) values (26, 1);
insert into butaca(n_butaca, sala_n) values (27, 1);
insert into butaca(n_butaca, sala_n) values (28, 1);
insert into butaca(n_butaca, sala_n) values (29, 1);
insert into butaca(n_butaca, sala_n) values (30, 1);
insert into butaca(n_butaca, sala_n) values (31, 1);
insert into butaca(n_butaca, sala_n) values (32, 1);
insert into butaca(n_butaca, sala_n) values (33, 1);
insert into butaca(n_butaca, sala_n) values (34, 1);
insert into butaca(n_butaca, sala_n) values (35, 1);
insert into butaca(n_butaca, sala_n) values (36, 1);
insert into butaca(n_butaca, sala_n) values (37, 1);
insert into butaca(n_butaca, sala_n) values (38, 1);
insert into butaca(n_butaca, sala_n) values (39, 1);
insert into butaca(n_butaca, sala_n) values (40, 1);
insert into butaca(n_butaca, sala_n) values (41, 1);
insert into butaca(n_butaca, sala_n) values (42, 1);
insert into butaca(n_butaca, sala_n) values (43, 1);
insert into butaca(n_butaca, sala_n) values (44, 1);
insert into butaca(n_butaca, sala_n) values (45, 1);
insert into butaca(n_butaca, sala_n) values (46, 1);
insert into butaca(n_butaca, sala_n) values (47, 1);
insert into butaca(n_butaca, sala_n) values (48, 1);
insert into butaca(n_butaca, sala_n) values (49, 1);
insert into butaca(n_butaca, sala_n) values (50, 1);

insert into butaca(n_butaca, sala_n) values (1, 2);
insert into butaca(n_butaca, sala_n) values (2, 2);
insert into butaca(n_butaca, sala_n) values (3, 2);
insert into butaca(n_butaca, sala_n) values (4, 2);
insert into butaca(n_butaca, sala_n) values (5, 2);
insert into butaca(n_butaca, sala_n) values (6, 2);
insert into butaca(n_butaca, sala_n) values (7, 2);
insert into butaca(n_butaca, sala_n) values (8, 2);
insert into butaca(n_butaca, sala_n) values (9, 2);
insert into butaca(n_butaca, sala_n) values (10, 2);
insert into butaca(n_butaca, sala_n) values (11, 2);
insert into butaca(n_butaca, sala_n) values (12, 2);
insert into butaca(n_butaca, sala_n) values (13, 2);
insert into butaca(n_butaca, sala_n) values (14, 2);
insert into butaca(n_butaca, sala_n) values (15, 2);
insert into butaca(n_butaca, sala_n) values (16, 2);
insert into butaca(n_butaca, sala_n) values (17, 2);
insert into butaca(n_butaca, sala_n) values (18, 2);
insert into butaca(n_butaca, sala_n) values (19, 2);
insert into butaca(n_butaca, sala_n) values (20, 2);
insert into butaca(n_butaca, sala_n) values (21, 2);
insert into butaca(n_butaca, sala_n) values (22, 2);
insert into butaca(n_butaca, sala_n) values (23, 2);
insert into butaca(n_butaca, sala_n) values (24, 2);
insert into butaca(n_butaca, sala_n) values (25, 2);
insert into butaca(n_butaca, sala_n) values (26, 2);
insert into butaca(n_butaca, sala_n) values (27, 2);
insert into butaca(n_butaca, sala_n) values (28, 2);
insert into butaca(n_butaca, sala_n) values (29, 2);
insert into butaca(n_butaca, sala_n) values (30, 2);
insert into butaca(n_butaca, sala_n) values (31, 2);
insert into butaca(n_butaca, sala_n) values (32, 2);
insert into butaca(n_butaca, sala_n) values (33, 2);
insert into butaca(n_butaca, sala_n) values (34, 2);
insert into butaca(n_butaca, sala_n) values (35, 2);
insert into butaca(n_butaca, sala_n) values (36, 2);
insert into butaca(n_butaca, sala_n) values (37, 2);
insert into butaca(n_butaca, sala_n) values (38, 2);
insert into butaca(n_butaca, sala_n) values (39, 2);
insert into butaca(n_butaca, sala_n) values (40, 2);
insert into butaca(n_butaca, sala_n) values (41, 2);
insert into butaca(n_butaca, sala_n) values (42, 2);
insert into butaca(n_butaca, sala_n) values (43, 2);
insert into butaca(n_butaca, sala_n) values (44, 2);
insert into butaca(n_butaca, sala_n) values (45, 2);
insert into butaca(n_butaca, sala_n) values (46, 2);
insert into butaca(n_butaca, sala_n) values (47, 2);
insert into butaca(n_butaca, sala_n) values (48, 2);
insert into butaca(n_butaca, sala_n) values (49, 2);
insert into butaca(n_butaca, sala_n) values (50, 2);

insert into butaca(n_butaca, sala_n) values (1, 3);
insert into butaca(n_butaca, sala_n) values (2, 3);
insert into butaca(n_butaca, sala_n) values (3, 3);
insert into butaca(n_butaca, sala_n) values (4, 3);
insert into butaca(n_butaca, sala_n) values (5, 3);
insert into butaca(n_butaca, sala_n) values (6, 3);
insert into butaca(n_butaca, sala_n) values (7, 3);
insert into butaca(n_butaca, sala_n) values (8, 3);
insert into butaca(n_butaca, sala_n) values (9, 3);
insert into butaca(n_butaca, sala_n) values (10, 3);
insert into butaca(n_butaca, sala_n) values (11, 3);
insert into butaca(n_butaca, sala_n) values (12, 3);
insert into butaca(n_butaca, sala_n) values (13, 3);
insert into butaca(n_butaca, sala_n) values (14, 3);
insert into butaca(n_butaca, sala_n) values (15, 3);
insert into butaca(n_butaca, sala_n) values (16, 3);
insert into butaca(n_butaca, sala_n) values (17, 3);
insert into butaca(n_butaca, sala_n) values (18, 3);
insert into butaca(n_butaca, sala_n) values (19, 3);
insert into butaca(n_butaca, sala_n) values (20, 3);
insert into butaca(n_butaca, sala_n) values (21, 3);
insert into butaca(n_butaca, sala_n) values (22, 3);
insert into butaca(n_butaca, sala_n) values (23, 3);
insert into butaca(n_butaca, sala_n) values (24, 3);
insert into butaca(n_butaca, sala_n) values (25, 3);
insert into butaca(n_butaca, sala_n) values (26, 3);
insert into butaca(n_butaca, sala_n) values (27, 3);
insert into butaca(n_butaca, sala_n) values (28, 3);
insert into butaca(n_butaca, sala_n) values (29, 3);
insert into butaca(n_butaca, sala_n) values (30, 3);
insert into butaca(n_butaca, sala_n) values (31, 3);
insert into butaca(n_butaca, sala_n) values (32, 3);
insert into butaca(n_butaca, sala_n) values (33, 3);
insert into butaca(n_butaca, sala_n) values (34, 3);
insert into butaca(n_butaca, sala_n) values (35, 3);
insert into butaca(n_butaca, sala_n) values (36, 3);
insert into butaca(n_butaca, sala_n) values (37, 3);
insert into butaca(n_butaca, sala_n) values (38, 3);
insert into butaca(n_butaca, sala_n) values (39, 3);
insert into butaca(n_butaca, sala_n) values (40, 3);
insert into butaca(n_butaca, sala_n) values (41, 3);
insert into butaca(n_butaca, sala_n) values (42, 3);
insert into butaca(n_butaca, sala_n) values (43, 3);
insert into butaca(n_butaca, sala_n) values (44, 3);
insert into butaca(n_butaca, sala_n) values (45, 3);
insert into butaca(n_butaca, sala_n) values (46, 3);
insert into butaca(n_butaca, sala_n) values (47, 3);
insert into butaca(n_butaca, sala_n) values (48, 3);
insert into butaca(n_butaca, sala_n) values (49, 3);
insert into butaca(n_butaca, sala_n) values (50, 3);

insert into butaca(n_butaca, sala_n) values (1, 4);
insert into butaca(n_butaca, sala_n) values (2, 4);
insert into butaca(n_butaca, sala_n) values (3, 4);
insert into butaca(n_butaca, sala_n) values (4, 4);
insert into butaca(n_butaca, sala_n) values (5, 4);
insert into butaca(n_butaca, sala_n) values (6, 4);
insert into butaca(n_butaca, sala_n) values (7, 4);
insert into butaca(n_butaca, sala_n) values (8, 4);
insert into butaca(n_butaca, sala_n) values (9, 4);
insert into butaca(n_butaca, sala_n) values (10, 4);
insert into butaca(n_butaca, sala_n) values (11, 4);
insert into butaca(n_butaca, sala_n) values (12, 4);
insert into butaca(n_butaca, sala_n) values (13, 4);
insert into butaca(n_butaca, sala_n) values (14, 4);
insert into butaca(n_butaca, sala_n) values (15, 4);
insert into butaca(n_butaca, sala_n) values (16, 4);
insert into butaca(n_butaca, sala_n) values (17, 4);
insert into butaca(n_butaca, sala_n) values (18, 4);
insert into butaca(n_butaca, sala_n) values (19, 4);
insert into butaca(n_butaca, sala_n) values (20, 4);
insert into butaca(n_butaca, sala_n) values (21, 4);
insert into butaca(n_butaca, sala_n) values (22, 4);
insert into butaca(n_butaca, sala_n) values (23, 4);
insert into butaca(n_butaca, sala_n) values (24, 4);
insert into butaca(n_butaca, sala_n) values (25, 4);
insert into butaca(n_butaca, sala_n) values (26, 4);
insert into butaca(n_butaca, sala_n) values (27, 4);
insert into butaca(n_butaca, sala_n) values (28, 4);
insert into butaca(n_butaca, sala_n) values (29, 4);
insert into butaca(n_butaca, sala_n) values (30, 4);
insert into butaca(n_butaca, sala_n) values (31, 4);
insert into butaca(n_butaca, sala_n) values (32, 4);
insert into butaca(n_butaca, sala_n) values (33, 4);
insert into butaca(n_butaca, sala_n) values (34, 4);
insert into butaca(n_butaca, sala_n) values (35, 4);
insert into butaca(n_butaca, sala_n) values (36, 4);
insert into butaca(n_butaca, sala_n) values (37, 4);
insert into butaca(n_butaca, sala_n) values (38, 4);
insert into butaca(n_butaca, sala_n) values (39, 4);
insert into butaca(n_butaca, sala_n) values (40, 4);
insert into butaca(n_butaca, sala_n) values (41, 4);
insert into butaca(n_butaca, sala_n) values (42, 4);
insert into butaca(n_butaca, sala_n) values (43, 4);
insert into butaca(n_butaca, sala_n) values (44, 4);
insert into butaca(n_butaca, sala_n) values (45, 4);
insert into butaca(n_butaca, sala_n) values (46, 4);
insert into butaca(n_butaca, sala_n) values (47, 4);
insert into butaca(n_butaca, sala_n) values (48, 4);
insert into butaca(n_butaca, sala_n) values (49, 4);
insert into butaca(n_butaca, sala_n) values (50, 4);