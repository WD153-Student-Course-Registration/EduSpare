package com.example.janani.model;

public class Course {
    private String code;
    private String name;
    private String instructor;
    private int credits;

    public Course(String code, String name, String instructor, int credits) {
        this.code = code;
        this.name = name;
        this.instructor = instructor;
        this.credits = credits;
    }

    public String getCode() { return code; }
    public String getName() { return name; }
    public String getInstructor() { return instructor; }
    public int getCredits() { return credits; }
}
