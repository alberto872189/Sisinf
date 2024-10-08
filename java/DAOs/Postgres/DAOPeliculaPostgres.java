import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DAOPeliculaPostgres implements DAOPelicula {

	@Override
	public void crear(Pelicula t) {
		String urlBaseDeDatos = "jdbc:postgresql://localhost:5432/sisinf_grupo_c05";
		String name = "user";
		String pwd = "user";
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(urlBaseDeDatos, name, pwd);
            String sql = "INSERT INTO Pelicula(Titulo, Resumen, Imagen, Link_IMDB, Trailer) VALUES (value1, value2, value3, value4, value 5)";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1, t.Titulo);
            preparedStatement.setString(2, t.Resumen);
            preparedStatement.setBytes(3, t.Imagen);
            preparedStatement.setString(4, t.Link_IMDB);
            preparedStatement.setBytes(5, t.Trailer);
            

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
		String name = "user";
		String pwd = "user";
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(urlBaseDeDatos, name, pwd);
            String sql = "UPDATE Pelicula SET Resumen = 'value1', Imagen = 'value2', Link_IMDB='value3', Trailer='value4' WHERE Titulo='value5'";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1, t.Resumen);
            preparedStatement.setBytes(2, t.Imagen);
            preparedStatement.setString(3, t.Link_IMDB);
            preparedStatement.setBytes(4, t.Trailer);
            preparedStatement.setString(5, t.Titulo);
            

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
            String sql = "DELETE FROM Pelicula WHERE Titulo='value1'";
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
	public Pelicula obtener(String k) {
		String urlBaseDeDatos = "jdbc:postgresql://localhost:5432/sisinf_grupo_c05";
		String name = "user";
		String pwd = "user";
		Pelicula res = new Pelicula();
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(urlBaseDeDatos, name, pwd);
	
			String sql = "select * from Pelicula where Titulo="+k;
			
			Statement statement = connection.createStatement();
			
			ResultSet resultSet = statement.executeQuery(sql);

			while (resultSet.next())
			{
				res.Titulo = resultSet.getString("Titulo");
				res.Resumen = resultSet.getString("Resumen");
				res.Imagen = resultSet.getBytes("Imagen");
				res.Link_IMDB = resultSet.getString("Link_IMDB");
				res.Trailer = resultSet.getBytes("Trailer");
				
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

}
