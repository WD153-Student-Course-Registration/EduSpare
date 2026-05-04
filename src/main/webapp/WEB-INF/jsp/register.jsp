<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Register as a new student to the Student Registration System.">
    <title>Register - Student Portal</title>
    <link rel="stylesheet" href="/style.css">
</head>
<body>
    <!-- Animated Background Blobs -->
    <div class="bg-blobs">
        <div class="blob blob-1"></div>
        <div class="blob blob-2"></div>
    </div>

    <!-- Navigation -->
    <nav>
        <a href="/" class="logo">
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M4 19.5v-15A2.5 2.5 0 0 1 6.5 2H20v20H6.5a2.5 2.5 0 0 1 0-5H20"/></svg>
            EduPortal
        </a>
        <div class="nav-links">
            <a href="/">Home</a>
            <a href="/login" class="btn btn-outline" style="padding: 0.5rem 1rem;">Sign In</a>
        </div>
    </nav>

    <!-- Registration Form -->
    <main class="container">
        <div class="form-container glass-panel">
            <div class="form-header">
                <h2>Create Account</h2>
                <p>Register to access the student portal</p>
            </div>
            
            <!-- Phase 2 Integration: Action points to Java Servlet -->
            <form action="/RegisterEndpoint" method="POST" id="registrationForm">
                
                <div class="form-group">
                    <label for="fullname">Full Name</label>
                    <input type="text" id="fullname" name="fullname" class="form-control" placeholder="John Doe" required>
                </div>
                
                <div class="form-group">
                    <label for="email">Email Address</label>
                    <input type="email" id="email" name="email" class="form-control" placeholder="john.doe@student.edu" required>
                </div>
                
                <div class="form-group">
                    <label for="studentId">Proposed Student ID (Optional)</label>
                    <input type="text" id="studentId" name="studentId" class="form-control" placeholder="e.g., 2024-XXXX">
                </div>
                
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" class="form-control" placeholder="••••••••" required minlength="8">
                </div>
                
                <button type="submit" class="btn btn-primary form-submit">Register Now</button>
                
            </form>
            
            <div class="form-footer">
                <p>Already have an account? <a href="/login">Sign in here</a></p>
            </div>
        </div>
    </main>
</body>
</html>
