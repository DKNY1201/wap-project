package edu.mum.models;

/**
 * Created by Bi on 9/26/17.
 */
public class RideBooking {
    private Ride ride;

    private int numOfBookedSeat;

    public RideBooking(Ride ride, int numOfBookedSeat) {
        this.ride = ride;
        this.numOfBookedSeat = numOfBookedSeat;
    }

    public Ride getRide() {
        return ride;
    }

    public int getNumOfBookedSeat() {
        return numOfBookedSeat;
    }
}
