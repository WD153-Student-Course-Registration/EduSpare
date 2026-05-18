// Declares the package this class belongs to, organizing it within the "com.example.WD153.model" folder structure.
package com.example.WD153.model;
// Imports the Serializable interface from the Java Input/Output library. This allows the object to be converted into a byte stream for storage or network transmission.
import java.io.Serializable;
// Defines a public class named User. By implementing Serializable, we tell Java that instances of this class can be serialized (e.g., saved to a hard drive or sent over a network to another server).
public class User implements Serializable {
    // A unique identifier used during the deserialization process. It ensures that the saved object's version matches the current class definition so it doesn't break when loading.
    private static final long serialVersionUID = 1L;

    protected Long id;// Declares a protected Long variable to store the user's unique database ID. 'protected' means it can only be accessed by this class, classes in the same package, and subclasses.
    protected String fullname;// Declares a protected String variable to hold the user's complete name.
    protected String email;// Declares a protected String variable to hold the user's email address.
    protected String password;// Declares a protected String variable to hold the user's password. (Note: In a real-world production app, this should be a hashed value, never plain text).
    protected String role; // "STUDENT" or "ADMIN"

    // This is the default, no-argument constructor. It creates an empty User object. It is required by many frameworks (like Spring or Hibernate) to create the object behind the scenes before populating its data.
    public User() {
    }
    // This is a parameterized constructor. It allows you to create a new User object and set all of its data (id, name, email, password, role) at the exact moment of creation.
    public User(Long id, String fullname, String email, String password, String role) {
        this.id = id;
        this.fullname = fullname;
        this.email = email;
        this.password = password;
        this.role = role;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
