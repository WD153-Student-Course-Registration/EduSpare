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
        // The 'this' keyword refers to the current object. This line takes the 'id' passed into the constructor and assigns it to the object's internal 'id' variable.
        this.id = id;
        // Assigns the passed 'fullname' parameter to the object's internal 'fullname' variable.
        this.fullname = fullname;
        this.email = email;;// Assigns the passed 'email' parameter to the object's internal 'email' variable.
        this.password = password;// Assigns the passed 'password' parameter to the object's internal 'password' variable.
        this.role = role;// Assigns the passed 'role' parameter to the object's internal 'role' variable.
    }

    public Long getId() {// A public "getter" method. It allows other parts of the application to read the protected 'id' variable.
        return id;// Returns the current value stored in the object's 'id' variable.
    }

    public void setId(Long id) {// A public "setter" method. It allows other parts of the application to change the value of the protected 'id' variable.
        this.id = id;// Takes the new 'id' provided and updates the object's internal 'id' variable.
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
