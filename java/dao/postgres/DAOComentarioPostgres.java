package dao.postgres;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;

import dao.interfaces.DAOComentario;
import vo.Comentario;

public class DAOComentarioPostgres extends DAOComentario {
	
	public DAOComentarioPostgres(String name_, String pwd_) {
		super(name_, pwd_);
	}
	@Override
	public void crear(Comentario t) {
		String urlBaseDeDatos = "jdbc:postgresql://localhost:5432/sisinf_grupo_c05";
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(urlBaseDeDatos, name, pwd);
            String sql = "INSERT INTO Comentario(Texto, Pelicula, Usuario, Fecha) VALUES ('" + t.Texto + "','" + t.Pelicula + "','" + t.Usuario + "','" + t.Fecha + "')";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            /*preparedStatement.setString(1, t.Texto);
			preparedStatement.setString(2, t.Pelicula);
			preparedStatement.setString(3, t.Usuario);
            preparedStatement.setTimestamp(4, t.Fecha);*/
			
            int rowsInserted = preparedStatement.executeUpdate();
            System.out.println(rowsInserted + " row(s) inserted.");
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}   
	}

	@Override
	public void modificar(Comentario t) {
		String urlBaseDeDatos = "jdbc:postgresql://localhost:5432/sisinf_grupo_c05";
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(urlBaseDeDatos, name, pwd);
            String sql = "UPDATE Comentario SET Texto = '" + t.Texto + "', Pelicula = '" + t.Pelicula + "', Usuario = '" + t.Usuario + "', Fecha = '" + t.Fecha + "' WHERE ID=" + t.ID;
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            /*preparedStatement.setString(1, t.Texto);
			preparedStatement.setString(2, t.Pelicula);
			preparedStatement.setString(3, t.Usuario);
            preparedStatement.setTimestamp(4, t.Fecha);
			preparedStatement.setInt(5, t.ID);*/
            
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
	public void borrar(Integer k) {
		String urlBaseDeDatos = "jdbc:postgresql://localhost:5432/sisinf_grupo_c05";
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(urlBaseDeDatos, name, pwd);
            String sql = "DELETE FROM Comentario WHERE ID=" + k;
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            //preparedStatement.setInt(1, k);

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
	public Comentario obtener(Integer k) {
		String urlBaseDeDatos = "jdbc:postgresql://localhost:5432/sisinf_grupo_c05";
		Comentario res = new Comentario();
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(urlBaseDeDatos, name, pwd);
	
			String sql = "select * from Comentario where ID=" + k;
			
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			//preparedStatement.setInt(1, k);
			
			ResultSet resultSet = preparedStatement.executeQuery(sql);

			while (resultSet.next())
			{
				res.Fecha = resultSet.getTimestamp("Fecha");
				res.Usuario = resultSet.getString("Usuario");
				res.Pelicula = resultSet.getString("Pelicula");
				res.Texto = resultSet.getString("Texto");
			}
			connection.close();
			resultSet.close();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return res;
	}

}
