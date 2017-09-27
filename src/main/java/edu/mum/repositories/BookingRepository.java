package edu.mum.repositories;

import edu.mum.models.Booking;
import edu.mum.models.Ride;
import edu.mum.models.User;
import org.apache.log4j.Logger;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.util.function.Function;

public class BookingRepository extends BaseRepository<Booking> {
	private static final String CREATE_BOOKING =
			"insert into Booking(idUser, idRide, numOfSeat, bookingDateTime) values (?,?,?,?)";
	private static final String GET_BOOKING_BY_RIDE_ID =
			"select * from Booking where idRide = ?";
	private static final String GET_BOOKING_BY_USER_ID =
			"select * from Booking where idUser = ?";

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

			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.S");
			LocalDateTime date = LocalDateTime.parse(rs.getString("bookingDateTime"), formatter);

			booking = new Booking(rs.getInt("id"),
					user,
					ride,
					rs.getInt("numOfSeat"),
					date);
		} catch (SQLException e) {
			e.printStackTrace();
			logger.error("Database connection problem");
		}
		return booking;
	};
	
	public boolean createBooking(String idUser, String idRide, String numOfSeat) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		return save(CREATE_BOOKING, idUser, idRide, numOfSeat, dateFormat.format(date));
	}
	
	public List<Booking> getBookingByRideID(String rideID) {
		return super.getList(GET_BOOKING_BY_RIDE_ID, getBooking, rideID);
	}

	public List<Booking> getBookingByUserID(String userID) {
		return super.getList(GET_BOOKING_BY_USER_ID, getBooking, userID);
	}
}