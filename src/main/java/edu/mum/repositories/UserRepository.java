package edu.mum.repositories;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.function.Function;

import org.apache.log4j.Logger;

import edu.mum.models.User;
import edu.mum.utils.PasswordUtils;

public class UserRepository extends BaseRepository<User> {
	private static final String GET_USER_BY_EMAIL_PASSWORD = 
			"SELECT * FROM Users WHERE email=? AND password=? LIMIT 1";
	private static final String GET_USER_BY_EMAIL =
			"SELECT * FROM Users WHERE email=? LIMIT 1";
	private static final String CREATE_USER = 
			"insert into Users(firstName, lastName, email, password, yearOfBirth, gender) values (?,?,?,?,?,?)";
	private static final String UPDATE_USER = 
			"UPDATE User SET email = ?, firstName = ?, lastName = ?, gender = ?, birthday = ? WHERE id = ?";

	static Logger logger = Logger.getLogger(UserRepository.class);
	
	private Function<ResultSet, User> getUser = (ResultSet rs) -> {
		User user = null;
		try {
			user = new User(rs.getInt("id"),
					rs.getString("firstName"),
					rs.getString("lastName"),
					rs.getString("email"),
					rs.getInt("yearOfBirth"),
					rs.getInt("gender"));
		} catch (SQLException e) {
			e.printStackTrace();
			logger.error("Database connection problem");
		}
		return user;
	};
	
	public boolean createUser(String firstName, String lastName, String email, String password, String yearOfBirth, String gender) {
		return save(CREATE_USER, firstName, lastName, email, PasswordUtils.generateHash(password), yearOfBirth, gender);
	}
	
	public User getUser(String email, String password) {
		User user = super.get(GET_USER_BY_EMAIL_PASSWORD, getUser, email, PasswordUtils.generateHash(password));
		
		if (user != null) { 
			logger.info("User found with details=" + user);
		}
		
		return user;
	}
	
	public User getUserByEmail(String email) {
		User user = super.get(GET_USER_BY_EMAIL, getUser, email);
		
		if (user != null) { 
			logger.info("User found with details=" + user);
		}
		
		return user;
	}
	
	public boolean update(String email, String firstName, String lastName, String gender, String birthday, int userId) {
		return save(UPDATE_USER, email, firstName, lastName, gender, birthday, String.valueOf(userId));
	}
}