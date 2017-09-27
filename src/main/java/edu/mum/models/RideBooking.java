package edu.mum.models;

/**
 * Created by Bi on 9/26/17.
 */
public class RideBooking {
    private Ride ride;

    private Booking booking;

    public RideBooking(Ride ride, Booking booking) {
        this.ride = ride;
        this.booking = booking;
    }

    public Ride getRide() {
        return ride;
    }

    public Booking getBooking() {
        return booking;
    }
}
