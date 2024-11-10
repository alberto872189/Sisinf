package dao.postgres;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dao.interfaces.DAOPelicula;
import vo.Pelicula;

public class DAOPeliculaPostgres extends DAOPelicula {
	
	public DAOPeliculaPostgres(String name_, String pwd_) {
		super(name_, pwd_);
	}
	
	@Override
	public void crear(Pelicula t) {
		String urlBaseDeDatos = "jdbc:postgresql://localhost:5432/sisinf_grupo_c05";
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(urlBaseDeDatos, name, pwd);
            String sql = "INSERT INTO Pelicula(Titulo, Resumen, Imagen, Link_IMDB, Trailer) VALUES ('" + t.Titulo + "','" + t.Resumen + "','" + t.Imagen + "','" + t.Link_IMDB + "','" + t.Trailer + "')";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            /*preparedStatement.setString(1, t.Titulo);
            preparedStatement.setString(2, t.Resumen);
            preparedStatement.setString(3, t.Imagen);
            preparedStatement.setString(4, t.Link_IMDB);
            preparedStatement.setString(5, t.Trailer);*/
            

            int rowsInserted = preparedStatement.executeUpdate();
            System.out.println(rowsInserted + " row(s) inserted.");
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}   
	}

	@Override
	public void modificar(Pelicula t) {
		String urlBaseDeDatos = "jdbc:postgresql://localhost:5432/sisinf_grupo_c05";
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(urlBaseDeDatos, name, pwd);
            String sql = "UPDATE Pelicula SET Resumen = '" + t.Resumen + "', Imagen = '" + t.Imagen + "', Link_IMDB='" + t.Link_IMDB + "', Trailer='" + t.Trailer + "' WHERE Titulo='" + t.Titulo + "'";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            /*preparedStatement.setString(1, t.Resumen);
            preparedStatement.setString(2, t.Imagen);
            preparedStatement.setString(3, t.Link_IMDB);
            preparedStatement.setString(4, t.Trailer);
            preparedStatement.setString(5, t.Titulo);*/
            

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
            String sql = "DELETE FROM Pelicula WHERE Titulo='" + k + "'";
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
	public Pelicula obtener(String k) {
		String urlBaseDeDatos = "jdbc:postgresql://localhost:5432/sisinf_grupo_c05";
		Pelicula res = new Pelicula();
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(urlBaseDeDatos, name, pwd);
	
			String sql = "select * from Pelicula where Titulo='" + k + "'";
			
			Statement statement = connection.createStatement();
			
			ResultSet resultSet = statement.executeQuery(sql);

			while (resultSet.next())
			{
				res.Titulo = resultSet.getString("Titulo");
				res.Resumen = resultSet.getString("Resumen");
				res.Imagen = resultSet.getString("Imagen");
				res.Link_IMDB = resultSet.getString("Link_IMDB");
				res.Trailer = resultSet.getString("Trailer");
				
			}
			connection.close();
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
	
	public List<Pelicula> obtenerPeliculas() {
		String urlBaseDeDatos = "jdbc:postgresql://localhost:5432/sisinf_grupo_c05";
		
		List<Pelicula> res = new ArrayList<Pelicula>();
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(urlBaseDeDatos, name, pwd);
	
			String sql = "select * from Pelicula";
			
			Statement statement = connection.createStatement();
			
			ResultSet resultSet = statement.executeQuery(sql);

			while (resultSet.next())
			{
				Pelicula pelicula = new Pelicula();
				pelicula.Titulo = resultSet.getString("Titulo");
				pelicula.Resumen = resultSet.getString("Resumen");
				pelicula.Imagen = resultSet.getString("Imagen");
				pelicula.Link_IMDB = resultSet.getString("Link_IMDB");
				pelicula.Trailer = resultSet.getString("Trailer");
				res.add(pelicula);
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
