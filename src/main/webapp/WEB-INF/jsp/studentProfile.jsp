<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${student.fullname} - Student Profile</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    fontFamily: { sans: ['Plus Jakarta Sans', 'sans-serif'] }
                }
            }
        }
    </script>
    <style>
        body { background-color: #f8fafc; color: #334155; }
        /* Hide Google Translate completely */
        .goog-te-banner-frame.skiptranslate, .goog-te-gadget-icon, #goog-gt-tt, .goog-tooltip, .goog-te-spinner { display: none !important; visibility: hidden !important; }
        body { top: 0px !important; position: static !important; }
        font { background: transparent !important; color: inherit !important; box-shadow: none !important; }
    </style>
</head>
<body class="flex h-screen overflow-hidden">

    <!-- Premium Sidebar -->
    <aside class="w-72 bg-white border-r border-slate-200 flex flex-col z-20 flex-shrink-0">
        <div class="h-20 flex items-center px-8 border-b border-slate-100">
            <a href="/" class="flex items-center gap-3 hover:opacity-80 transition-opacity">
                <div class="w-8 h-8 bg-blue-600 rounded-lg flex items-center justify-center text-white font-bold shadow-md">E</div>
                <span class="font-extrabold text-xl tracking-tight text-slate-900">EduSphere</span>
            </a>
        </div>
        
        <div class="px-6 py-6">
            <p class="text-xs font-bold text-slate-400 uppercase tracking-wider mb-4">Main Menu</p>
            <nav class="space-y-1.5">
                <a href="/dashboard" class="nav-link flex items-center gap-3 px-4 py-3 rounded-xl cursor-pointer transition-all text-slate-600 hover:bg-slate-50">
                    <i class="fas fa-arrow-left w-5 text-center"></i> Back to Dashboard
                </a>
                <a href="#" class="nav-link flex items-center gap-3 px-4 py-3 rounded-xl cursor-pointer transition-all bg-blue-50 text-blue-700 font-semibold">
                    <i class="fas fa-user-graduate w-5 text-center"></i> Student Profile
                </a>
            </nav>
        </div>
        
        <!-- User Profile Footer -->
        <div class="mt-auto p-6 border-t border-slate-100">
            <div class="flex items-center gap-3 mb-4">
                <div class="w-10 h-10 rounded-full bg-gradient-to-tr from-blue-100 to-indigo-100 border border-blue-200 flex items-center justify-center text-blue-700 font-bold">
                    ${user.fullname.substring(0,1)}
                </div>
                <div class="overflow-hidden">
                    <p class="text-sm font-bold text-slate-900 truncate">${user.fullname}</p>
                    <p class="text-xs text-slate-500 truncate">${user.role}</p>
                </div>
            </div>
            <a href="/logout" class="flex items-center justify-center gap-2 w-full py-2.5 rounded-xl text-sm font-semibold text-slate-600 hover:bg-red-50 hover:text-red-600 transition-colors border border-slate-200 hover:border-red-200">
                <i class="fas fa-sign-out-alt"></i> Sign out
            </a>
        </div>
    </aside>

    <!-- Main Content Area -->
    <main class="flex-1 overflow-y-auto bg-slate-50 relative">
        
        <header class="bg-white border-b border-slate-200 px-8 py-5 sticky top-0 z-10 flex justify-between items-center">
            <div>
                <h1 class="text-2xl font-bold text-slate-900">Student Profile Overview</h1>
                <p class="text-sm text-slate-500 mt-1">Reviewing academic details for ${student.fullname}.</p>
            </div>
        </header>

        <div class="p-8 max-w-6xl mx-auto">
            
            <!-- Student Header Profile -->
            <div class="bg-white rounded-3xl p-8 border border-slate-200 shadow-sm flex flex-col md:flex-row items-center md:items-start gap-8 mb-8 relative overflow-hidden">
                <div class="absolute right-0 top-0 w-64 h-64 bg-gradient-to-bl from-blue-50 to-transparent rounded-bl-full opacity-50 z-0"></div>
                <div class="relative z-10 w-24 h-24 rounded-full bg-gradient-to-tr from-blue-500 to-indigo-600 text-white flex items-center justify-center text-4xl font-bold shadow-lg flex-shrink-0">
                    ${student.fullname.substring(0,1)}
                </div>
                <div class="relative z-10 flex-1 w-full text-center md:text-left">
                    <h2 class="text-3xl font-extrabold text-slate-900 mb-1">${student.fullname}</h2>
                    <p class="text-slate-500 mb-6">${student.email}</p>
                    
                    <div class="grid grid-cols-2 md:grid-cols-4 gap-4">
                        <div class="bg-slate-50 p-4 rounded-xl border border-slate-100">
                            <p class="text-xs font-bold text-slate-400 uppercase tracking-wider mb-1">Student ID</p>
                            <p class="font-semibold text-slate-800">${empty student.studentId ? 'N/A' : student.studentId}</p>
                        </div>
                        <div class="bg-slate-50 p-4 rounded-xl border border-slate-100">
                            <p class="text-xs font-bold text-slate-400 uppercase tracking-wider mb-1">Major</p>
                            <p class="font-semibold text-slate-800">${empty student.major ? 'Undecided' : student.major}</p>
                        </div>
                        <div class="bg-slate-50 p-4 rounded-xl border border-slate-100">
                            <p class="text-xs font-bold text-slate-400 uppercase tracking-wider mb-1">Total Credits</p>
                            <p class="font-semibold text-slate-800">${totalCredits}</p>
                        </div>
                        <div class="bg-blue-50 p-4 rounded-xl border border-blue-100">
                            <p class="text-xs font-bold text-blue-400 uppercase tracking-wider mb-1">Cumulative GPA</p>
                            <p class="font-bold text-blue-700 text-lg leading-none">${gpa}</p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="grid grid-cols-1 xl:grid-cols-3 gap-8">
                
                <!-- Enrolled Courses -->
                <div class="xl:col-span-2">
                    <div class="bg-white rounded-2xl border border-slate-200 shadow-sm overflow-hidden h-full">
                        <div class="px-6 py-5 border-b border-slate-100 bg-slate-50/50">
                            <h3 class="text-lg font-bold text-slate-900">Current Semester Schedule</h3>
                        </div>
                        <div class="overflow-x-auto">
                            <table class="w-full text-left border-collapse">
                                <thead>
                                    <tr class="bg-white text-slate-500 text-xs uppercase tracking-wider border-b border-slate-200">
                                        <th class="px-6 py-4 font-semibold">Course Code</th>
                                        <th class="px-6 py-4 font-semibold">Title</th>
                                        <th class="px-6 py-4 font-semibold">Instructor</th>
                                        <th class="px-6 py-4 font-semibold text-center">Credits</th>
                                    </tr>
                                </thead>
                                <tbody class="divide-y divide-slate-100 text-slate-700 bg-white">
                                    <c:forEach var="c" items="${enrolledCourses}">
                                        <tr class="hover:bg-slate-50/80 transition-colors">
                                            <td class="px-6 py-4 font-mono text-sm font-semibold text-blue-600">${c.code}</td>
                                            <td class="px-6 py-4 font-medium text-slate-900">${c.title}</td>
                                            <td class="px-6 py-4 text-sm text-slate-600">${c.instructor}</td>
                                            <td class="px-6 py-4 text-center">
                                                <span class="px-2 py-1 bg-slate-100 rounded text-sm font-medium">${c.credits}</span>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    <c:if test="${empty enrolledCourses}">
                                        <tr>
                                            <td colspan="4" class="px-6 py-12 text-center text-slate-500">
                                                No courses enrolled.
                                            </td>
                                        </tr>
                                    </c:if>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <!-- Recent Exam Results -->
                <div class="xl:col-span-1">
                    <div class="bg-white rounded-2xl border border-slate-200 shadow-sm overflow-hidden h-full">
                        <div class="px-6 py-5 border-b border-slate-100 bg-slate-50/50">
                            <h3 class="text-lg font-bold text-slate-900">Exam Results</h3>
                        </div>
                        <div class="p-6">
                            <c:if test="${not empty studentExams}">
                                <div class="space-y-4">
                                    <c:forEach var="e" items="${studentExams}">
                                        <div class="p-4 rounded-xl border border-slate-100 bg-slate-50">
                                            <div class="flex justify-between items-start mb-2">
                                                <div>
                                                    <p class="text-xs font-bold text-blue-600 font-mono mb-0.5">${e.courseCode}</p>
                                                    <p class="font-semibold text-slate-800 text-sm">${e.examName}</p>
                                                </div>
                                                <span class="text-xs font-bold px-2 py-1 rounded bg-white border border-slate-200">
                                                    ${e.marks} / ${e.maxMarks}
                                                </span>
                                            </div>
                                            <div class="w-full bg-slate-200 rounded-full h-1.5 mt-3 overflow-hidden">
                                                <div class="bg-blue-500 h-1.5 rounded-full" style="width: ${(e.marks / e.maxMarks) * 100}%"></div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </c:if>
                            <c:if test="${empty studentExams}">
                                <div class="text-center py-8 text-slate-500 text-sm">
                                    <div class="w-12 h-12 bg-slate-100 rounded-full flex items-center justify-center text-slate-400 text-xl mx-auto mb-3"><i class="fas fa-clipboard"></i></div>
                                    No exam results available.
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </main>
</body>
</html>