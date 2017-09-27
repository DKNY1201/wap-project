package edu.mum.models;

/**
 * Created by Bi on 9/26/17.
 */
public class RideBookingSeat {
    private Ride ride;

    private int numOfBookedSeat;

    public RideBookingSeat(Ride ride, int numOfBookedSeat) {
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
