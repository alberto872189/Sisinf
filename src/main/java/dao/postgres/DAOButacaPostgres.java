package dao.postgres;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dao.interfaces.DAOButaca;
import utils.Pair;
import vo.Butaca;
import vo.Entrada;

public class DAOButacaPostgres extends DAOButaca {

	public DAOButacaPostgres(String name_, String pwd_) {
		super(name_, pwd_);
	}

	@Override
	public int crear(Butaca t) {
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(url, name, pwd);
            String sql = "INSERT INTO Butaca(N_Butaca, Sala_N) VALUES (" + t.N_Butaca + "," + t.Sala_N + ")";
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
	public void modificar(Butaca t) {
		
        System.out.println("No es posible modificar una Butaca");
        
	}

	@Override
	public void borrar(Pair<Integer, Integer> k) {
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(url, name, pwd);
            String sql = "DELETE FROM Butaca WHERE N_Butaca=" + k.x.toString() + " and Sala_N=" + k.y.toString();
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

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
		Butaca res = new Butaca();
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(url, name, pwd);
	
			String sql = "select * from Butaca where N_Butaca=" + k.x.toString() + " and Sala_N=" + k.y.toString();
			
			Statement statement = connection.createStatement();
			
			ResultSet resultSet = statement.executeQuery(sql);

			while (resultSet.next())
			{
				res.N_Butaca = resultSet.getInt("N_Butaca");
				res.Sala_N = resultSet.getInt("Sala_N");
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
	public List<Butaca> obtenerSesion(Integer sala, String hora) {
		List<Butaca> res = new ArrayList<Butaca>();
		
		try {
			Class.forName("org.postgresql.Driver");
		
			Connection connection;
		
			connection = DriverManager.getConnection(url, name, pwd);
	
			String sql = "select * from Butaca where Sala_N=" + sala;
			
			Statement statement = connection.createStatement();
			
			ResultSet resultSet = statement.executeQuery(sql);
			
			DAOEntradaPostgres daoEntrada = new DAOEntradaPostgres("usuario", "user");
			
			List<Entrada> listaEntradas = daoEntrada.obtenerEntradasSesion(sala, hora);

			while (resultSet.next())
			{
				Butaca but = new Butaca();
				but.N_Butaca = resultSet.getInt("N_Butaca");
				but.Sala_N = resultSet.getInt("Sala_N");
				but.Ocupada = false;
				for (Entrada ent : listaEntradas) {
					if (ent.N_But == but.N_Butaca) {
						but.Ocupada = true;
						break;
					}
				}
				res.add(but);
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
