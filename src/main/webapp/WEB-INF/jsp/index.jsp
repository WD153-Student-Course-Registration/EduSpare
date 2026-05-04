<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Welcome to the modern Student Registration System portal.">
    <title>Student Registration System</title>
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
            <a href="#">Programs</a>
            <a href="#">About</a>
            <a href="/login" class="btn btn-outline" style="padding: 0.5rem 1rem;">Sign In</a>
        </div>
    </nav>

    <!-- Main Hero Section -->
    <main class="hero container">
        <div class="hero-content">
            <h1>Empower Your Future with <br><span class="text-gradient">EduPortal</span></h1>
            <p>Join thousands of students in our state-of-the-art learning management system. Register today to access your courses, grades, and academic resources.</p>
            <div class="hero-btns">
                <a href="/register" class="btn btn-primary">Start Registration</a>
                <a href="/login" class="btn btn-outline">Student Login</a>
            </div>
        </div>
    </main>
</body>
</html>
