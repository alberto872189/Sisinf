//clase para el acceso a datos de la base de datos postgresql en java

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class accesoDatosPlantilla {
	public static void main() {
		
		String urlBaseDeDatos = "jdbc:postgresql://localhost:5432/sisinf_grupo_c05";
		String name = "user";
		String pwd = "user";
		
		Class.forName("org.postgresql.Driver");
		
		Connection connection = DriverManager.getConnection(urlBaseDeDatos, name, pwd);
		
		String sql = "sentencia");
		
		Statement statement = connection.createStatement();
		
		ResultSet resultSet = statement.executeQuery(sql);
		
		while (resultSet.next())
		{
			String columnvalue = resultSet.getString("columna");
			
		}
		connection.close();
	}
}