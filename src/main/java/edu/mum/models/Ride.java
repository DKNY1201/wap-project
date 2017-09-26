package edu.mum.models;

import java.io.Serializable;
import edu.mum.models.*;

/**
 * Created by Bi on 9/25/17.
 */

public class Ride implements Serializable {
    private int id;
    private String pickupPoint;
    private String dropoffPoint;
    private boolean isRoundTrip;
    private String startDatetime;
    private String returnDatetime;
    private int price;
    private int numOfSeat;
    private String startRideDetail;
    private String returnRideDetail;
    private MAX_LUGGAGE maxLuggage;
    private PICKUP_FLEXIBILITY pickupFlexibility;
    private User user;

    public Ride(int id, String pickupPoint, String dropoffPoint, boolean isRoundTrip, String startDatetime, String returnDatetime, int price, int numOfSeat, String startRideDetail, String returnRideDetail, MAX_LUGGAGE maxLuggage, PICKUP_FLEXIBILITY pickupFlexibility, User user) {
        this.id = id;
        this.pickupPoint = pickupPoint;
        this.dropoffPoint = dropoffPoint;
        this.isRoundTrip = isRoundTrip;
        this.startDatetime = startDatetime;
        this.returnDatetime = returnDatetime;
        this.price = price;
        this.numOfSeat = numOfSeat;
        this.startRideDetail = startRideDetail;
        this.returnRideDetail = returnRideDetail;
        this.maxLuggage = maxLuggage;
        this.pickupFlexibility = pickupFlexibility;
        this.user = user;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPickupPoint() {
        return pickupPoint;
    }

    public void setPickupPoint(String pickupPoint) {
        this.pickupPoint = pickupPoint;
    }

    public String getDropoffPoint() {
        return dropoffPoint;
    }

    public void setDropoffPoint(String dropoffPoint) {
        this.dropoffPoint = dropoffPoint;
    }

    public boolean isRoundTrip() {
        return isRoundTrip;
    }

    public void setRoundTrip(boolean roundTrip) {
        isRoundTrip = roundTrip;
    }

    public String getStartDatetime() {
        return startDatetime;
    }

    public void setStartDatetime(String startDatetime) {
        this.startDatetime = startDatetime;
    }

    public String getReturnDatetime() {
        return returnDatetime;
    }

    public void setReturnDatetime(String returnDatetime) {
        this.returnDatetime = returnDatetime;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getNumOfSeat() {
        return numOfSeat;
    }

    public void setNumOfSeat(int numOfSeat) {
        this.numOfSeat = numOfSeat;
    }

    public String getStartRideDetail() {
        return startRideDetail;
    }

    public void setStartRideDetail(String startRideDetail) {
        this.startRideDetail = startRideDetail;
    }

    public String getReturnRideDetail() {
        return returnRideDetail;
    }

    public void setReturnRideDetail(String returnRideDetail) {
        this.returnRideDetail = returnRideDetail;
    }

    public MAX_LUGGAGE getMaxLuggage() {
        return maxLuggage;
    }

    public void setMaxLuggage(MAX_LUGGAGE maxLuggage) {
        this.maxLuggage = maxLuggage;
    }

    public PICKUP_FLEXIBILITY getPickupFlexibility() {
        return pickupFlexibility;
    }

    public void setPickupFlexibility(PICKUP_FLEXIBILITY pickupFlexibility) {
        this.pickupFlexibility = pickupFlexibility;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
