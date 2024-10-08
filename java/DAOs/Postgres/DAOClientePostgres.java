import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DAOClientePostgres implements DAOCliente {

	@Override
	public void crear(Cliente t) {
		String urlBaseDeDatos = "jdbc:postgresql://localhost:5432/sisinf_grupo_c05";
		String name = "user";
		String pwd = "user";
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(urlBaseDeDatos, name, pwd);
            String sql = "INSERT INTO Cliente(Correo, Contrasenia, Nombre) VALUES (value1, value2, value3)";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1, t.Correo);
            preparedStatement.setString(2, t.Contrasenia);
            preparedStatement.setString(3, t.Nombre);
            

            int rowsInserted = preparedStatement.executeUpdate();
            System.out.println(rowsInserted + " row(s) inserted.");
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}   
	}

	@Override
	public void modificar(Cliente t) {
		String urlBaseDeDatos = "jdbc:postgresql://localhost:5432/sisinf_grupo_c05";
		String name = "user";
		String pwd = "user";
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(urlBaseDeDatos, name, pwd);
            String sql = "UPDATE Cliente SET Contrasenia = 'value1', Nombre = 'value2' WHERE Correo='value3'";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1, t.Contrasenia);
            preparedStatement.setString(2, t.Nombre);
            preparedStatement.setString(3, t.Correo);
            

            int rowsUpdated = preparedStatement.executeUpdate();
            System.out.println(rowsUpdated + " row(s) updated.");
            connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}   
		
	}

	@Override
	public void borrar(String k) {
		String urlBaseDeDatos = "jdbc:postgresql://localhost:5432/sisinf_grupo_c05";
		String name = "user";
		String pwd = "user";
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(urlBaseDeDatos, name, pwd);
            String sql = "DELETE FROM Cliente WHERE Correo='value1'";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1, k);
            

            int rowsDeleted = preparedStatement.executeUpdate();
            System.out.println(rowsDeleted + " row(s) deleted.");
            connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}   
		
	}

	@Override
	public Cliente obtener(String k) {
		String urlBaseDeDatos = "jdbc:postgresql://localhost:5432/sisinf_grupo_c05";
		String name = "user";
		String pwd = "user";
		Cliente res = new Cliente();
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(urlBaseDeDatos, name, pwd);
	
			String sql = "select * from Cliente where Correo="+k;
			
			Statement statement = connection.createStatement();
			
			ResultSet resultSet = statement.executeQuery(sql);

			while (resultSet.next())
			{
				res.Correo = resultSet.getString("Correo");
				res.Contrasenia = resultSet.getString("Contrasenia");
				res.Nombre = resultSet.getString("Nombre");
				
			}
			resultSet.close();
			statement.close();
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return res;
	}

}
