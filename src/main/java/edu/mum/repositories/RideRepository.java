package edu.mum.repositories;

import edu.mum.models.Ride;
import edu.mum.models.User;
import edu.mum.utils.PasswordUtils;
import org.apache.log4j.Logger;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.function.Function;

public class RideRepository extends BaseRepository<Ride> {
	private static final String GET_USER_BY_EMAIL_PASSWORD = 
			"SELECT * FROM Users WHERE email=? AND password=? LIMIT 1";
	private static final String GET_USER_BY_ID = 
			"SELECT * FROM User WHERE id=? LIMIT 1";
	private static final String CREATE_RIDE =
			"insert into Ride(pickupPoint, dropoffPoint, isRoundTrip, startDatetime, returnDatetime, price," +
					"numOfSeat, startRideDetail, returnRideDetail, maxLuggage, pickupFlexibility, emailUser) " +
					"values (?,?,?,?,?,?,?,?,?,?,?,?)";
	private static final String UPDATE_USER = 
			"UPDATE User SET email = ?, firstName = ?, lastName = ?, gender = ?, birthday = ? WHERE id = ?";

	static Logger logger = Logger.getLogger(RideRepository.class);
	
	private Function<ResultSet, User> getRide = (ResultSet rs) -> {
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
	
	public boolean createRide(String pickupPoint, String dropoffPoint, String isRoundTrip, String startDatetime, String returnDatetime,
							  String price, String numOfSeat, String startRideDetail, String returnRideDetail, String maxLuggage, String pickupFlexibility, String emailUser) {
		return save(CREATE_RIDE, pickupPoint, dropoffPoint, isRoundTrip, startDatetime, returnDatetime, price,
				numOfSeat, startRideDetail, returnRideDetail, maxLuggage, pickupFlexibility, emailUser);
	}
	
//	public User getUser(String email, String password) {
//		User user = super.get(GET_USER_BY_EMAIL_PASSWORD, getUser, email, PasswordUtils.generateHash(password));
//
//		if (user != null) {
//			logger.info("User found with details=" + user);
//		}
//
//		return user;
//	}
//
//	public User getUser(int userId) {
//		User user = super.get(GET_USER_BY_ID, getUser, String.valueOf(userId));
//
//		if (user != null) {
//			logger.info("User found with details=" + user);
//		}
//
//		return user;
//	}
//
//	public boolean update(String email, String firstName, String lastName, String gender, String birthday, int userId) {
//		return save(UPDATE_USER, email, firstName, lastName, gender, birthday, String.valueOf(userId));
//	}
}