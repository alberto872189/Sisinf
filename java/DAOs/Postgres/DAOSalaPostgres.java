import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DAOSalaPostgres implements DAOSala {

	@Override
	public void crear(Sala t) {
		String urlBaseDeDatos = "jdbc:postgresql://localhost:5432/sisinf_grupo_c05";
		String name = "user";
		String pwd = "user";
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(urlBaseDeDatos, name, pwd);
            String sql = "INSERT INTO Sala(N_Sala) VALUES (value1)";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setInt(1, t.n.intValue());
            

            int rowsInserted = preparedStatement.executeUpdate();
            System.out.println(rowsInserted + " row(s) inserted.");
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}   
	}

	@Override
	public void modificar(Sala t) {
		/*String urlBaseDeDatos = "jdbc:postgresql://localhost:5432/sisinf_grupo_c05";
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
		}   */
		
	}

	@Override
	public void borrar(Long k) {
		String urlBaseDeDatos = "jdbc:postgresql://localhost:5432/sisinf_grupo_c05";
		String name = "user";
		String pwd = "user";
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(urlBaseDeDatos, name, pwd);
            String sql = "DELETE FROM Salaa WHERE N_Sala='value1'";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setInt(1, k.intValue());
            

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
	public Sala obtener(Long k) {
		String urlBaseDeDatos = "jdbc:postgresql://localhost:5432/sisinf_grupo_c05";
		String name = "user";
		String pwd = "user";
		Sala res = new Sala();
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(urlBaseDeDatos, name, pwd);
	
			String sql = "select * from Sala where N_Sala="+k;
			
			Statement statement = connection.createStatement();
			
			ResultSet resultSet = statement.executeQuery(sql);

			while (resultSet.next())
			{
				res.n = resultSet.getLong("N_Sala");
				
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
