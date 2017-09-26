package edu.mum.models;

/**
 * Created by Bi on 9/26/17.
 */
public enum PICKUP_FLEXIBILITY {
    Rightontime("Right on time"),
    Ina15minutewindow("In a 15 minute window"),
    Ina30minutewindow("In a 30 minute window"),
    Ina1hourwindow("In a 1 hour window"),
    Ina2hourwindow("RIn a 2 hour window");

    private String name;

    PICKUP_FLEXIBILITY(String name) {
        this.name = name;
    }

    public String getName() {
        return this.name;
    }
}
