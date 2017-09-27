package edu.mum.models;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * Created by Bi on 9/26/17.
 */
public class Booking implements Serializable {
    int id;
    User user;
    Ride ride;
    int numOfSeat;
    LocalDateTime bookingDateTime;

    public Booking(int id, User user, Ride ride, int numOfSeat, LocalDateTime bookingDateTime) {
        this.id = id;
        this.user = user;
        this.ride = ride;
        this.numOfSeat = numOfSeat;
        this.bookingDateTime = bookingDateTime;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Ride getRide() {
        return ride;
    }

    public void setRide(Ride ride) {
        this.ride = ride;
    }

    public int getNumOfSeat() {
        return numOfSeat;
    }

    public void setNumOfSeat(int numOfSeat) {
        this.numOfSeat = numOfSeat;
    }

    public LocalDateTime getBookingDateTime() {
        return bookingDateTime;
    }

    public void setBookingDateTime(LocalDateTime bookingDateTime) {
        this.bookingDateTime = bookingDateTime;
    }
}
