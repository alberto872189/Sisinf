import dao.interfaces.*;
import dao.postgres.*;
import vo.*;
import utils.*;

class Main {
	public static void main(String args[]) {
		DAOAdministradorPostgres test1 = new DAOAdministradorPostgres("admin", "admin");
		Administrador admint1 = new Administrador();
		admint1.Contrasenia = "contraseña";
		admint1.Correo = "correoadmin@gmail.com";
		admint1.Nombre = "nombreDeAdmin";
		test1.crear(admint1);
		Administrador admint2 = new Administrador();
		admint2 = test1.obtener("correodeadmin@gmail.com");
		admint2.Contrasenia = "contraseña2";
		admint2.Nombre = "nombreDeAdmin2";
		test1.modificar(admint2);
		admint1 = test1.obtener("correodeadmin@gmail.com");
		System.out.printf("admin final: %s, %s, %s", admint1.Nombre, admint1.Contrasenia, admint1.Correo);
		test1.borrar("correodeadmin@gmail.com");
		Administrador admint3 = new Administrador();
		admint3 = test1.obtener("correodeadmin@gmail.com");
	}
}