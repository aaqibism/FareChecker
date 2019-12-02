

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
	static Connection connection;

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("hi");
		DbUtils.initConnection();
		DbUtils.checkUserExists("admin");

	}
	
	public static void initConnection() {
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
	
	public static Integer getUserID(String username) {
		Integer res = -1;
		try {
			PreparedStatement ps = connection.prepareStatement(
					"SELECT userID FROM logins WHERE username=?");
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				res = rs.getInt("userID");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return res;
	}
	
	public static Boolean checkUserExists(String username) {
		Boolean exists = false;
		try {
			PreparedStatement ps = connection.prepareStatement(
					"SELECT 1 username FROM logins WHERE username=?"
					);
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				exists = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return exists;
	}
	
	// -1 if user does not exist, 0 if password does not match, 1 if password matches
	public static int checkUserPassword(String username, String password) {
		String resPassword = "";
		// See if user exists
		if (!checkUserExists(username)) {
			return -1;
		}
		// See if user password matches the stored password
		try {
			PreparedStatement ps = connection.prepareStatement(
					"SELECT username, password FROM logins WHERE username=?");
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				resPassword = rs.getString("password");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (resPassword.contentEquals(password)) {
			return 1;
		} else {
			return 0;
		}
	}
	
	// return 0 if user already exists, 1 if successfully added user
	public static int addUser(String username, String password) {
		if (checkUserExists(username)) {
			return 0;
		}
		try {
			PreparedStatement ps = connection.prepareStatement(
					"INSERT INTO logins(username, password) VALUES (?, ?)");
			ps.setString(1, username);
			ps.setString(2, password);
			ps.execute();
			ps.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return 1;
	}
	
	// adding a favorite ride
	public static void addFavorite(int user_id, String XXX) {
		Boolean exists = false;
		try {
			PreparedStatement ps_try = connection.prepareStatement(
					"SELECT 1 id FROM locations WHERE userID=? AND XXX=?"
					);
			ps_try.setInt(1, user_id);
			ps_try.setString(2, XXX);
			ResultSet rs = ps_try.executeQuery();
			if (rs.next()) {
				exists = true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		if (exists == true) {
			// already exists dont add.
			return;
		} else {
			try {
				PreparedStatement ps = connection.prepareStatement(
						"INSERT INTO locations (userID, XXX) VALUES (?, ?)"
						);
				ps.setInt(1, user_id);
				ps.setString(2, XXX);
				ps.execute();
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	// remove a favorite
	public static void removeFavorite(int user_id, String XXX) {
		try {
			PreparedStatement ps = connection.prepareStatement(
					"DELETE FROM locations WHERE userID=? AND XXX=?"
					);
			ps.setInt(1, user_id);
			ps.setString(2, XXX);
			ps.execute();
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// is favorite 
	public static Boolean isFavorite(int user_id, String XXX) {
		Boolean isfav = false;
		try {
			PreparedStatement ps_try = connection.prepareStatement(
					"SELECT 1 id FROM locations WHERE userID=? AND XXX=?"
					);
			ps_try.setInt(1, user_id);
			ps_try.setString(2, XXX);
			ResultSet rs = ps_try.executeQuery();
			if (rs.next()) {
				isfav = true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return isfav;
	}
	
	// get all favorites of a user
	public static List<String> getUserFavorites(int user_id) {
		List<String> favorites = new ArrayList<String>();
		try {
			PreparedStatement ps = connection.prepareStatement(
					"SELECT XXX FROM locations WHERE userID=? ORDER BY created_at DESC "
					);
			ps.setInt(1, user_id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				favorites.add(rs.getString("XXX"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return favorites;
	}
}

