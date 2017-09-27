package edu.mum.models;

import java.io.Serializable;

/**
 * Created by Bi on 9/26/17.
 */
public class Booking implements Serializable {
    int id;
    User user;
    Ride ride;
    int numOfSeat;

    public Booking(int id, User user, Ride ride, int numOfSeat) {
        this.id = id;
        this.user = user;
        this.ride = ride;
        this.numOfSeat = numOfSeat;
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
}
