package backend;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Set;
import javax.ws.rs.*;
import javax.ws.rs.core.Application;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.sql.*;

@ApplicationPath("/")
public class RainDataService {
	@GET
	@Path("/raindata")
	@Produces("application/json")
	public ArrayList<RainData> getAllRainData() {
		ArrayList<RainData> lst = new ArrayList<RainData>();
		
		String connectionUrl = "jdbc:sqlserver://localhost:1433;" + "databaseName=RainSensor;";

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
	
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			con = DriverManager.getConnection(connectionUrl,"sa","1");
			String SQL = "SELECT * FROM DBO.RAINDATA"; //TEN BANG TRONG CSDL
			stmt = con.createStatement();
			rs = stmt.executeQuery(SQL);
			System.out.println("===Assets====");
			while(rs.next()) {
				int ID = rs.getInt("ID");
				String Raining = rs.getString("Raining");
				int Humidity = rs.getInt("Humidity");
				String TimeAt = rs.getString("TimeAt");
				
				lst.add(new RainData(ID, Raining, Humidity, TimeAt));
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		finally {
			if (rs != null) try { rs.close(); } catch(Exception e) {}
			if (stmt != null) try { stmt.close(); } catch(Exception e) {}
			if (con != null) try { con.close(); } catch(Exception e) {}
			}
		return lst;
	}
}
