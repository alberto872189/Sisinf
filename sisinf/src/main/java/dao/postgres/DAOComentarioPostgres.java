package dao.postgres;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dao.interfaces.DAOComentario;
import vo.Comentario;

public class DAOComentarioPostgres extends DAOComentario {
	
	public DAOComentarioPostgres(String name_, String pwd_) {
		super(name_, pwd_);
	}
	@Override
	public int crear(Comentario t) {
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(url, name, pwd);
            String sql = "INSERT INTO Comentario(Texto, Pelicula, Usuario, Fecha) VALUES ('" + t.Texto + "','" + t.Pelicula + "','" + t.Usuario + "','" + t.Fecha + "')";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            int rowsInserted = preparedStatement.executeUpdate();
            System.out.println(rowsInserted + " row(s) inserted.");
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return 1;
	}

	@Override
	public void modificar(Comentario t) {
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(url, name, pwd);
            String sql = "UPDATE Comentario SET Texto = '" + t.Texto + "', Pelicula = '" + t.Pelicula + "', Usuario = '" + t.Usuario + "', Fecha = '" + t.Fecha + "' WHERE ID=" + t.ID;
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

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
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(url, name, pwd);
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
		Comentario res = new Comentario();
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(url, name, pwd);
	
			String sql = "select * from Comentario where ID=" + k;
			
			Statement statement = connection.createStatement();
			
			ResultSet resultSet = statement.executeQuery(sql);

			while (resultSet.next())
			{
				res.Fecha = resultSet.getTimestamp("Fecha");
				res.Usuario = resultSet.getString("Usuario");
				res.Pelicula = resultSet.getString("Pelicula");
				res.Texto = resultSet.getString("Texto");
				res.ID = resultSet.getInt("ID");
			}
			connection.close();
			resultSet.close();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return res;
	}

	public List<Comentario> obtenerPel(String k) {
		
		List<Comentario> res = new ArrayList<Comentario>();
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(url, name, pwd);
	
			String sql = "select * from Comentario where Pelicula='" + k + "'";
			
			Statement statement = connection.createStatement();
			
			ResultSet resultSet = statement.executeQuery(sql);

			while (resultSet.next())
			{
				Comentario comment = new Comentario();
				comment.Fecha = resultSet.getTimestamp("Fecha");
				comment.Usuario = resultSet.getString("Usuario");
				comment.Pelicula = resultSet.getString("Pelicula");
				comment.Texto = resultSet.getString("Texto");
				res.add(comment);
			}
			connection.close();
			resultSet.close();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return res;
	}

}