import dao.interfaces.*;
import dao.postgres.*;
import vo.*;
import utils.*;

class Main {
	public static void main(String args[]) {
		System.out.println("ADMINISTRADORES");
		DAOAdministradorPostgres test1 = new DAOAdministradorPostgres("admin", "admin");
		Administrador admint1 = new Administrador();
		admint1.Contrasenia = "contraseña";
		admint1.Correo = "correoadmin@gmail.com";
		admint1.Nombre = "nombreDeAdmin";
		System.out.printf("admin 1: %s, %s, %s \n", admint1.Nombre, admint1.Contrasenia, admint1.Correo);
		System.out.println("crear");
		test1.crear(admint1);
		System.out.println("creado");
		Administrador admint2 = new Administrador();
		System.out.println("obtener");
		admint2 = test1.obtener("correoadmin@gmail.com");
		System.out.println("obtenido");
		admint2.Contrasenia = "contraseña2";
		admint2.Nombre = "nombreDeAdmin2";
		System.out.println("modificar");
		test1.modificar(admint2);
		System.out.println("modificado");
		admint1 = test1.obtener("correoadmin@gmail.com");
		System.out.printf("admin final: %s, %s, %s \n", admint1.Nombre, admint1.Contrasenia, admint1.Correo);
		System.out.println("borrar");
		test1.borrar("correoadmin@gmail.com");
		System.out.println("borrado");
		Administrador admint3 = new Administrador();
		admint3 = test1.obtener("correoadmin@gmail.com");
		System.out.printf("admin borrado: %s, %s, %s \n", admint3.Nombre, admint3.Contrasenia, admint3.Correo);
		
		System.out.println();
		System.out.println("SALAS");
		DAOSalaPostgres test3 = new DAOSalaPostgres("admin", "admin");
		Sala salat1 = new Sala();
		salat1.n = 1;
		System.out.printf("butaca 1: %s \n", salat1.n);
		System.out.println("crear");
		test3.crear(salat1);
		System.out.println("creado");
		Sala salat2 = new Sala();
		System.out.println("obtener");
		salat2 = test3.obtener(1);
		System.out.println("obtenido");
		System.out.printf("butaca final: %s \n",salat2.n);
		System.out.println("borrar");
		test3.borrar(1);
		System.out.println("borrado");
		Sala salat3 = new Sala();
		salat3 = test3.obtener(1);
		System.out.printf("butaca borrada: %s \n", salat3.n);
		test3.crear(salat1); //Para pruebas posteriores
		
		System.out.println();
		System.out.println("BUTACAS");
		DAOButacaPostgres test2 = new DAOButacaPostgres("admin", "admin");
		Butaca butacat1 = new Butaca();
		butacat1.N_Butaca = 1;
		butacat1.Sala_N = 1;
		System.out.printf("butaca 1: %s, %s \n", butacat1.N_Butaca, butacat1.Sala_N);
		System.out.println("crear");
		test2.crear(butacat1);
		System.out.println("creado");
		Butaca butacat2 = new Butaca();
		System.out.println("obtener");
		Pair<Integer, Integer> claveBut = new Pair<Integer, Integer>(1, 1);
		butacat2 = test2.obtener(claveBut);
		System.out.println("obtenido");
		System.out.printf("butaca final: %s, %s \n", butacat1.N_Butaca, butacat1.Sala_N);
		System.out.println("borrar");
		test2.borrar(claveBut);
		System.out.println("borrado");
		Butaca butacat3 = new Butaca();
		butacat3 = test2.obtener(claveBut);
		System.out.printf("butaca borrada: %s, %s \n", butacat3.N_Butaca, butacat3.Sala_N);
		test2.crear(butacat1); //Para pruebas posteriores
		
		System.out.println();
		System.out.println("PELICULAS");
		DAOPeliculaPostgres test4 = new DAOPeliculaPostgres("admin", "admin");
		Pelicula pelit1 = new Pelicula();
		pelit1.Titulo = "titulo";
		pelit1.Resumen = "resumen";
		pelit1.Imagen = "Imagen";
		pelit1.Link_IMDB = "Link";
		pelit1.Trailer = "trailer";
		System.out.printf("pelicula 1: %s, %s, %s, %s, %s \n", pelit1.Titulo, pelit1.Resumen, pelit1.Imagen, pelit1.Link_IMDB, pelit1.Trailer);
		System.out.println("crear");
		test4.crear(pelit1);
		System.out.println("creado");
		Pelicula pelit2 = new Pelicula();
		System.out.println("obtener");
		pelit2 = test4.obtener("titulo");
		System.out.println("obtenido");
		pelit2.Resumen = "resumen2";
		pelit2.Imagen = "Imagen2";
		pelit2.Link_IMDB = "link2";
		pelit2.Trailer = "trailer2";
		System.out.println("modificar");
		test4.modificar(pelit2);
		System.out.println("modificado");
		pelit1 = test4.obtener("titulo");
		System.out.printf("pelicula final: %s, %s, %s, %s, %s \n", pelit1.Titulo, pelit1.Resumen, pelit1.Imagen, pelit1.Link_IMDB, pelit1.Trailer);
		System.out.println("borrar");
		test4.borrar("titulo");
		System.out.println("borrado");
		Pelicula pelit3 = new Pelicula();
		pelit3 = test4.obtener("titulo");
		System.out.printf("pelicula borrada: %s, %s, %s, %s, %s \n", pelit3.Titulo, pelit3.Resumen, pelit3.Imagen, pelit3.Link_IMDB, pelit3.Trailer);
		test4.crear(pelit1); //Para pruebas posteriores
		
		//Borrado de elementos para pruebas
		test4.borrar("titulo");
		test2.borrar(claveBut);
		test3.borrar(1);
	}
}