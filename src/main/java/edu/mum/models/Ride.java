package edu.mum.models;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * Created by Bi on 9/25/17.
 */

enum MAX_LUGGAGE {
    Small, Medium, Lagre
}

enum PICKUP_FLEXIBILITY {
    RightOnTime("Right on time"),
    Ina15minutewindow("In a 15 minute window"),
    Ina30minutewindow("In a 30 minute window"),
    Ina1hourwindow("In a 1 hour window"),
    Ina2hourwindow("RIn a 2 hour window");

    private String name;

    PICKUP_FLEXIBILITY(String name) {
        this.name = name;
    }

    public String displayName() {
        return this.name;
    }

}

public class Ride implements Serializable {
    private String pickupPoint;
    private String dropoffPoint;
    private boolean isRoundTrip;
    private LocalDateTime startDatetime;
    private LocalDateTime returnDatetime;
    private int price;
    private int numOfSeat;
    private String startRideDetail;
    private String returnRideDetail;
    private MAX_LUGGAGE maxLuggage;
    private PICKUP_FLEXIBILITY pickupFlexibility;
    private String emailUser;

    public Ride(String pickupPoint, String dropoffPoint, boolean isRoundTrip, LocalDateTime startDatetime, LocalDateTime returnDatetime, int price, int numOfSeat, String startRideDetail, String returnRideDetail, MAX_LUGGAGE maxLuggage, PICKUP_FLEXIBILITY pickupFlexibility, String emailUser) {
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
        this.emailUser = emailUser;
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

    public LocalDateTime getStartDatetime() {
        return startDatetime;
    }

    public void setStartDatetime(LocalDateTime startDatetime) {
        this.startDatetime = startDatetime;
    }

    public LocalDateTime getReturnDatetime() {
        return returnDatetime;
    }

    public void setReturnDatetime(LocalDateTime returnDatetime) {
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

    public String getEmailUser() {
        return emailUser;
    }

    public void setEmailUser(String emailUser) {
        this.emailUser = emailUser;
    }
}
