import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DAOButacaPostgres implements DAOButaca {

	@Override
	public void crear(Butaca t) {
		String urlBaseDeDatos = "jdbc:postgresql://localhost:5432/sisinf_grupo_c05";
		String name = "user";
		String pwd = "user";
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(urlBaseDeDatos, name, pwd);
            String sql = "INSERT INTO Butaca(N_Butaca, Sala_N) VALUES (value1, value2)";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setInt(1, t.N_Butaca);
            preparedStatement.setInt(2, t.Sala_N);
            

            int rowsInserted = preparedStatement.executeUpdate();
            System.out.println(rowsInserted + " row(s) inserted.");
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}   
	}

	@Override
	public void modificar(Butaca t) {
		
        System.out.println("No es posible modificar una Butaca");
        
	}

	@Override
	public void borrar(Pair<Integer, Integer> k) {
		String urlBaseDeDatos = "jdbc:postgresql://localhost:5432/sisinf_grupo_c05";
		String name = "user";
		String pwd = "user";
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(urlBaseDeDatos, name, pwd);
            String sql = "DELETE FROM Butaca WHERE N_Butaca='value1' and Sala_N='value2'";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setInt(1, k.x);
            preparedStatement.setInt(2, k.y);
            

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
	public Butaca obtener(Pair<Integer, Integer> k) {
		String urlBaseDeDatos = "jdbc:postgresql://localhost:5432/sisinf_grupo_c05";
		String name = "user";
		String pwd = "user";
		Butaca res = new Butaca();
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(urlBaseDeDatos, name, pwd);
	
			String sql = "select * from Butaca where N_Butaca='value1' and Sala_N='value2'";
			
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, k.x);
            preparedStatement.setInt(2, k.y);
			
			ResultSet resultSet = preparedStatement.executeQuery(sql);

			while (resultSet.next())
			{
				res.N_Butaca = resultSet.getInt("N_Butaca");
				res.Sala_N = resultSet.getInt("Sala_N");
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
