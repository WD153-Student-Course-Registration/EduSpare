package com.example.WD153.model;

public class Course {
    private String code;
    private String title;
    private String instructor;
    private String description; // New field for content
    private int credits;
    private int maxCapacity;

    public Course(String code, String title, String instructor, int credits, int maxCapacity) {
        this.code = code;
        this.title = title;
        this.instructor = instructor;
        this.description = "Learn the fundamentals of " + title;
        this.credits = credits;
        this.maxCapacity = maxCapacity;
    }

    public Course(String code, String title, String instructor, String description, int credits, int maxCapacity) {
        this.code = code;
        this.title = title;
        this.instructor = instructor;
        this.description = description;
        this.credits = credits;
        this.maxCapacity = maxCapacity;
    }

    public String getCode() { return code; }
    public void setCode(String code) { this.code = code; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getInstructor() { return instructor; }
    public void setInstructor(String instructor) { this.instructor = instructor; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public int getCredits() { return credits; }
    public void setCredits(int credits) { this.credits = credits; }

    public int getMaxCapacity() { return maxCapacity; }
    public void setMaxCapacity(int maxCapacity) { this.maxCapacity = maxCapacity; }
}
