<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Student Dashboard.">
    <title>Dashboard - Student Portal</title>
    <link rel="stylesheet" href="/style.css">
    <style>
        .data-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 1rem;
            color: var(--text-primary);
        }
        .data-table th, .data-table td {
            padding: 1rem;
            text-align: left;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }
        .data-table th {
            color: var(--accent-primary);
            font-weight: 600;
        }
        .profile-info {
            display: grid;
            gap: 1.5rem;
            max-width: 500px;
        }
        .info-group label {
            display: block;
            color: var(--text-secondary);
            font-size: 0.9rem;
            margin-bottom: 0.25rem;
        }
        .info-group p {
            font-size: 1.1rem;
            font-weight: 500;
        }
    </style>
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
            <span style="color: var(--text-secondary); margin-right: 1rem;">Welcome, ${sessionScope.user.fullname}</span>
            <a href="/logout" class="btn btn-outline" style="padding: 0.5rem 1rem;">Logout</a>
        </div>
    </nav>

    <!-- Dashboard Layout -->
    <div class="dashboard-layout">
        <!-- Sidebar -->
        <aside class="sidebar">
            <a href="/dashboard?tab=overview" class="sidebar-item ${activeTab == 'overview' ? 'active' : ''}">
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="3" width="7" height="7"></rect><rect x="14" y="3" width="7" height="7"></rect><rect x="14" y="14" width="7" height="7"></rect><rect x="3" y="14" width="7" height="7"></rect></svg>
                Overview
            </a>
            <a href="/dashboard?tab=courses" class="sidebar-item ${activeTab == 'courses' ? 'active' : ''}">
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z"></path><path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z"></path></svg>
                My Courses
            </a>
            <a href="/dashboard?tab=grades" class="sidebar-item ${activeTab == 'grades' ? 'active' : ''}">
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path><polyline points="22 4 12 14.01 9 11.01"></polyline></svg>
                Grades
            </a>
            <a href="/dashboard?tab=profile" class="sidebar-item ${activeTab == 'profile' ? 'active' : ''}">
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>
                Profile Settings
            </a>
        </aside>

        <!-- Main Content -->
        <main class="main-content">
            
            <c:choose>
                <c:when test="${activeTab == 'courses'}">
                    <div class="dashboard-header">
                        <h2>My Enrolled Courses</h2>
                    </div>
                    <div class="glass-panel" style="padding: 1rem;">
                        <table class="data-table">
                            <thead>
                                <tr>
                                    <th>Code</th>
                                    <th>Course Name</th>
                                    <th>Instructor</th>
                                    <th>Credits</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${courses}" var="course">
                                    <tr>
                                        <td>${course.code}</td>
                                        <td>${course.name}</td>
                                        <td>${course.instructor}</td>
                                        <td>${course.credits}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:when>

                <c:when test="${activeTab == 'grades'}">
                    <div class="dashboard-header">
                        <h2>Academic Grades</h2>
                    </div>
                    <div class="glass-panel" style="padding: 1rem;">
                        <table class="data-table">
                            <thead>
                                <tr>
                                    <th>Course</th>
                                    <th>Grade</th>
                                    <th>Semester</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${grades}" var="grade">
                                    <tr>
                                        <td>${grade.courseName}</td>
                                        <td><span class="text-gradient" style="font-weight: bold;">${grade.grade}</span></td>
                                        <td>${grade.semester}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:when>

                <c:when test="${activeTab == 'profile'}">
                    <div class="dashboard-header">
                        <h2>Profile Settings</h2>
                    </div>
                    <div class="glass-panel" style="padding: 2rem;">
                        <div class="profile-info">
                            <div class="info-group">
                                <label>Full Name</label>
                                <p>${sessionScope.user.fullname}</p>
                            </div>
                            <div class="info-group">
                                <label>Email Address</label>
                                <p>${sessionScope.user.email}</p>
                            </div>
                            <div class="info-group">
                                <label>Student ID</label>
                                <p>${not empty sessionScope.user.studentId ? sessionScope.user.studentId : 'Not Assigned'}</p>
                            </div>
                            <button class="btn btn-primary" style="width: fit-content; margin-top: 1rem;">Update Profile</button>
                        </div>
                    </div>
                </c:when>

                <c:otherwise>
                    <div class="dashboard-header">
                        <h2>Dashboard Overview</h2>
                        <button class="btn btn-primary">Enroll in New Course</button>
                    </div>

                    <div class="stats-grid">
                        <div class="stat-card">
                            <h3>Enrolled Courses</h3>
                            <div class="value">${enrolledCount}</div>
                        </div>
                        <div class="stat-card">
                            <h3>Upcoming Assignments</h3>
                            <div class="value">3</div>
                        </div>
                        <div class="stat-card">
                            <h3>Current GPA</h3>
                            <div class="value text-gradient">3.8</div>
                        </div>
                    </div>

                    <div class="glass-panel" style="padding: 1.5rem;">
                        <h3 style="margin-bottom: 1rem;">Recent Announcements</h3>
                        <div style="border-left: 3px solid var(--accent-primary); padding-left: 1rem; margin-bottom: 1rem;">
                            <h4 style="margin-bottom: 0.25rem;">Fall Registration Opens Next Week</h4>
                            <p style="font-size: 0.9rem;">Make sure to meet with your advisor before the registration window opens.</p>
                        </div>
                        <div style="border-left: 3px solid var(--success); padding-left: 1rem;">
                            <h4 style="margin-bottom: 0.25rem;">Grades Posted for Midterms</h4>
                            <p style="font-size: 0.9rem;">Check the grades tab to see your recent exam scores.</p>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>

        </main>
    </div>
</body>
</html>
