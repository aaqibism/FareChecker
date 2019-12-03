package backend;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

// NOTE: CHANGE XXX based on the description of the database

public class DbUtils {
	public static final String CREDENTIAL_STRING = "jdbc:mysql://google/FareChecker?"
			+ "cloudSqlInstance=farechecker-258720:us-west1:finalproject"
			+ "&socketFactory=com.google.cloud.sql.mysql.SocketFactory&useSSL=false&user=aaa&password=aaa";
	static Connection connection = null;

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("hi");
		DbUtils d = new DbUtils();
		d.initConnection();
		d.checkUserExists("admin");

	}
	
	public void close() {
		if (connection != null) {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public void initConnection() {
		if (connection != null) {
			System.out.println("[WARN] Connection has already been established.");
			return;
		}
    	try {
    		Class.forName("com.mysql.jdbc.Driver");
    		connection = DriverManager.getConnection(CREDENTIAL_STRING);
    		if (connection.isClosed()) {
    			System.out.println("Closed");
    		} else {
    			System.out.println("Open");
    		}
    	} catch (ClassNotFoundException | SQLException e) {
    		e.printStackTrace();
    	}
	}
	
	public int getUserID(String username) {
		int res = -1;
		try {
			PreparedStatement ps = connection.prepareStatement(
					"SELECT userID FROM logins WHERE username=?");
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				res = rs.getInt("userID");
			}
			ps.close();
			rs.close();
			return res;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return res;
	}
	
	public boolean checkUserExists(String username) {
		try {
			PreparedStatement ps = connection.prepareStatement(
					"SELECT * FROM logins WHERE username=?"
					);
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				ps.close();
				rs.close();
				System.out.println("User exists");
				return true;
			}
			System.out.println("User doesn't exists");
			ps.close();
			rs.close();
			return false;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean checkUserPassword(String username, String password) {
		try {
			PreparedStatement ps = connection.prepareStatement(
					"SELECT * FROM logins WHERE username=? AND password=?");
			ps.setString(1, username);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				ps.close();
				rs.close();
				System.out.println("Password correct");
				return true;
			}
			ps.close();
			rs.close();
			System.out.println("Password incorrect.");
			return false;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
		
	}
	
	public boolean addUser(String username, String password) {
		try {
			PreparedStatement ps = connection.prepareStatement(
					"INSERT INTO logins(username, password) VALUES (?, ?)");
			ps.setString(1, username);
			ps.setString(2, password);
			boolean status = ps.execute();
			
			ps.close();
			return status;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	// adding a favorite ride
	public boolean addFavorite(String username, String name, double lat, double lng) {
		try {
			int id = getUserID(username);
			if (id == -1)
				return false;
			
			PreparedStatement ps = connection.prepareStatement(
					"INSERT INTO locations(userID, name, latitude, longitude) VALUES (?, ?, ?, ?)");
			ps.setInt(1, id);
			ps.setString(2, name);
			ps.setDouble(3, lat);
			ps.setDouble(4, lng);
			boolean status = ps.execute();
			
			ps.close();
			return status;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	// remove a favorite
	public boolean removeFavorite(String username, String name) {
		try {
			int id = getUserID(username);
			if (id == -1)
				return false;
			PreparedStatement ps = connection.prepareStatement(
					"DELETE FROM locations WHERE userID=? AND name=?"
					);
			ps.setInt(1, id);
			ps.setString(2, name);
			boolean status = ps.execute();

			ps.close();
			return status;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	// is favorite 
	public boolean isFavorite(String username, String name) {
		try {
			int id = getUserID(username);
			if (id == -1)
				return false;
			
			PreparedStatement ps_try = connection.prepareStatement(
					"SELECT * FROM locations WHERE userID=? AND name=?"
					);
			ps_try.setInt(1, id);
			ps_try.setString(2, name);
			ResultSet rs = ps_try.executeQuery();
			if (rs.next()) {
				rs.close();
				ps_try.close();
				return true;
			}
			
			rs.close();
			ps_try.close();
			return false;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	// get all favorites of a user
	public List<String> getUserFavorites(String username) {
		List<String> favorites = new ArrayList<String>();
		try {
			int id = getUserID(username);
			if (id == -1)
				return favorites;
			
			PreparedStatement ps = connection.prepareStatement(
					"SELECT * FROM locations WHERE userID=?"
					);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				favorites.add(rs.getString("name"));
			}
			
			rs.close();
			ps.close();
			return favorites;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return favorites;
	}
}

