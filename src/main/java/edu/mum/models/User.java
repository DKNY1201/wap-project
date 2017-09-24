package edu.mum.models;

import java.io.Serializable;

/**
 * Created by Bi on 9/24/17.
 */
public class User implements Serializable {
    private String name;
    private String email;
    private String country;
    private int id;

    public User(String name, String email, String country, int id) {
        this.name = name;
        this.email = email;
        this.country = country;
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "Name = " + this.name + ", Email = " + this.email + ", Country = " + this.country;
    }
}
