package edu.mum.repositories;

import edu.mum.models.MAX_LUGGAGE;
import edu.mum.models.PICKUP_FLEXIBILITY;
import edu.mum.models.Ride;
import org.apache.log4j.Logger;
import sun.print.UnixPrintServiceLookup;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.function.Function;

import edu.mum.models.*;

public class RideRepository extends BaseRepository<Ride> {
	private static final String GET_ALL_RIDES =
			"SELECT * FROM Ride";
	private static final String CREATE_RIDE =
			"insert into Ride(pickupPoint, dropoffPoint, isRoundTrip, startDatetime, returnDatetime, price," +
					"numOfSeat, startRideDetail, returnRideDetail, maxLuggage, pickupFlexibility, emailUser) " +
					"values (?,?,?,?,?,?,?,?,?,?,?,?)";
	private static final String GET_RIDE_BY_PICKUP_DROP_POINTS =
			"SELECT * FROM Ride WHERE pickupPoint LIKE ? AND dropoffPoint LIKE ? ORDER BY price";
	private static final String GET_RIDE_BY_ID =
			"SELECT * FROM Ride WHERE id = ? LIMIT 1";
	private static final String GET_RIDES_BY_USER_EMAIL =
			"SELECT * FROM Ride WHERE emailUser = ?";

	static Logger logger = Logger.getLogger(RideRepository.class);
	
	private Function<ResultSet, Ride> getRide = (ResultSet rs) -> {
		Ride ride = null;
		try {
			String maxLuggageStr = rs.getString("maxLuggage");
			MAX_LUGGAGE maxLuggage = MAX_LUGGAGE.valueOf(maxLuggageStr);
			String pickupFlexibilityStr = rs.getString("pickupFlexibility");
			PICKUP_FLEXIBILITY pickupFlexibility = PICKUP_FLEXIBILITY.valueOf(pickupFlexibilityStr);

			String userEmail = rs.getString("emailUser");
			UserRepository userRepository = new UserRepository();
			User user = userRepository.getUserByEmail(userEmail);


			ride = new Ride(rs.getInt("id"),
					rs.getString("pickupPoint"),
					rs.getString("dropoffPoint"),
					rs.getBoolean("isRoundTrip"),
					rs.getString("startDatetime"),
					rs.getString("returnDatetime"),
					rs.getInt("price"),
					rs.getInt("numOfSeat"),
					rs.getString("startRideDetail"),
					rs.getString("returnRideDetail"),
					maxLuggage,
					pickupFlexibility,
					user);
		} catch (SQLException e) {
			e.printStackTrace();
			logger.error("Database connection problem");
		}
		return ride;
	};
	
	public boolean createRide(String pickupPoint, String dropoffPoint, String isRoundTrip, String startDatetime, String returnDatetime,
							  String price, String numOfSeat, String startRideDetail, String returnRideDetail, String maxLuggage, String pickupFlexibility, String emailUser) {
		return save(CREATE_RIDE, pickupPoint, dropoffPoint, isRoundTrip, startDatetime, returnDatetime, price,
				numOfSeat, startRideDetail, returnRideDetail, maxLuggage, pickupFlexibility, emailUser);
	}

	public List<Ride> getRides(String pickupPoint, String dropoffPoint) {
		if (pickupPoint == null || pickupPoint.isEmpty() || dropoffPoint == null || dropoffPoint.isEmpty()) {
			return super.getList(GET_ALL_RIDES, getRide);
		} else {
			return super.getList(GET_RIDE_BY_PICKUP_DROP_POINTS, getRide, "%" + pickupPoint + "%", "%" + dropoffPoint + "%");
		}
	}

	public List<Ride> getRidesByUserEmail(String email) {
		return super.getList(GET_RIDES_BY_USER_EMAIL, getRide, email);
	}

	public Ride getRideById(String id) {
		Ride ride = super.get(GET_RIDE_BY_ID, getRide, id);

		if (ride != null) {
			logger.info("User found with details=" + ride);
		}

		return ride;
	}
}