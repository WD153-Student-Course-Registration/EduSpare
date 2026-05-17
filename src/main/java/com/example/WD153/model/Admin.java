package com.example.janani.model;

public class Admin extends User {
    public Admin() {
        super();
        this.role = "ADMIN";
    }

    public Admin(Long id, String fullname, String email, String password) {
        super(id, fullname, email, password, "ADMIN");
    }
}
