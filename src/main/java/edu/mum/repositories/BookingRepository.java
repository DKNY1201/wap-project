package edu.mum.repositories;

import edu.mum.models.Booking;
import edu.mum.models.Ride;
import edu.mum.models.User;
import org.apache.log4j.Logger;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.function.Function;

public class BookingRepository extends BaseRepository<Booking> {
	private static final String CREATE_BOOKING =
			"insert into Booking(idUser, idRide, numOfSeat) values (?,?,?)";
	private static final String GET_BOOKING_BY_RIDE_ID =
			"select * from Booking where idRide = ?";

	static Logger logger = Logger.getLogger(BookingRepository.class);
	
	private Function<ResultSet, Booking> getBooking = (ResultSet rs) -> {
		Booking booking = null;
		try {
			String idUser = rs.getString("idUser");
			String idRide = rs.getString("idRide");

			UserRepository userRepository = new UserRepository();
			User user = userRepository.getUserById(idUser);

			RideRepository rideRepository = new RideRepository();
			Ride ride = rideRepository.getRideById(idRide);

			booking = new Booking(rs.getInt("id"),
					user,
					ride,
					rs.getInt("numOfSeat"));
		} catch (SQLException e) {
			e.printStackTrace();
			logger.error("Database connection problem");
		}
		return booking;
	};
	
	public boolean createBooking(String idUser, String idRide, String numOfSeat) {
		return save(CREATE_BOOKING, idUser, idRide, numOfSeat);
	}
	
	public List<Booking> getBookingByRideID(String rideID) {
		return super.getList(GET_BOOKING_BY_RIDE_ID, getBooking, rideID);
	}
}