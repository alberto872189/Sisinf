package dao.postgres;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import dao.interfaces.DAOAdministrador;
import vo.Administrador;

public class DAOAdministradorPostgres extends DAOAdministrador {
	
	public DAOAdministradorPostgres(String name_, String pwd_) {
		super(name_, pwd_);
	}
	
	@Override
	public void crear(Administrador t) {
		String urlBaseDeDatos = "jdbc:postgresql://localhost:5432/sisinf_grupo_c05";
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(urlBaseDeDatos, name, pwd);
            String sql = "INSERT INTO Administrador(Correo, Contrasenia, Nombre) VALUES ('" + t.Correo + "','" + t.Contrasenia + "','" + t.Nombre + "')";//value1, value2, value3)";
            System.out.printf("%s \n", sql);
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            /*preparedStatement.setString(1, t.Correo);
            preparedStatement.setString(2, t.Contrasenia);
            preparedStatement.setString(3, t.Nombre);*/
            

            int rowsInserted = preparedStatement.executeUpdate();
            System.out.println(rowsInserted + " row(s) inserted.");
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}   
	}

	@Override
	public void modificar(Administrador t) {
		String urlBaseDeDatos = "jdbc:postgresql://localhost:5432/sisinf_grupo_c05";
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(urlBaseDeDatos, name, pwd);
            String sql = "UPDATE Administrador SET Contrasenia = '" + t.Contrasenia + "', Nombre = '" + t.Nombre + "' WHERE Correo='" + t.Correo + "'";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            /*preparedStatement.setString(1, t.Contrasenia);
            preparedStatement.setString(2, t.Nombre);
            preparedStatement.setString(3, t.Correo);*/
            

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
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(urlBaseDeDatos, name, pwd);
            String sql = "DELETE FROM Administrador WHERE Correo='" + k + "'";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            //preparedStatement.setString(1, k);
            

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
	public Administrador obtener(String k) {
		String urlBaseDeDatos = "jdbc:postgresql://localhost:5432/sisinf_grupo_c05";
		Administrador res = new Administrador();
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(urlBaseDeDatos, name, pwd);
	
			String sql = "select * from Administrador where Correo='" + k + "'";
			
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
