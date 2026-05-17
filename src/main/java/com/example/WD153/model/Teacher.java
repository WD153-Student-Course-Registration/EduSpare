// Overall Purpose: This file defines the Teacher model, representing an instructor within the educational system.
package com.example.WD153.model;
/**
 * The Teacher class holds data related to faculty members,
 * including their name, academic title, and department.
 */

public class Teacher {
    private String name;
    private String title;
    private String department;



    /**
     * Default constructor for frameworks.
     */

    public Teacher() {}
    /**
     * Parameterized constructor for easy object creation.
     */

    public Teacher(String name, String title, String department) {
        this.name = name;
        this.title = title;
        this.department = department;
    }

    // --- Getters and Setters ---

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    /**
     * Overrides equals to compare Teachers based solely on their names.
     * This ensures uniqueness in sets and correct behavior in collections.
     */

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Teacher teacher = (Teacher) o;
        return name != null ? name.equals(teacher.name) : teacher.name == null;
    }

    /**
     * Overrides hashCode to match the logic of equals (hashing by name).
     */
    @Override
    public int hashCode() {
        return name != null ? name.hashCode() : 0;
    }
}
