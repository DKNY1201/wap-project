package edu.mum.models;

import java.io.Serializable;

/**
 * Created by Bi on 9/24/17.
 */
public class User implements Serializable {
    private String firstName;
    private String lastName;
    private String email;
    private int yearOfBirth;
    private int gender;
    private int id;

    public User(int id, String firstName, String lastName, String email, int yearOfBirth, int gender) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.yearOfBirth = yearOfBirth;
        this.gender = gender;
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getYearOfBirth() {
        return yearOfBirth;
    }

    public void setYearOfBirth(int yearOfBirth) {
        this.yearOfBirth = yearOfBirth;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "Name = " + this.firstName + " " + this.lastName + ", Email = " + this.email + ", Gender = " + this.gender + ", Year of Birth = " + this.yearOfBirth;
    }
}
