<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - EduSphere</title>
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
        .tab-content { display: none; animation: fadeIn 0.3s ease-out forwards; }
        .tab-content.active { display: block; }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(5px); }
            to { opacity: 1; transform: translateY(0); }
        }
        /* Custom Scrollbar */
        ::-webkit-scrollbar { width: 6px; height: 6px; }
        ::-webkit-scrollbar-track { background: transparent; }
        ::-webkit-scrollbar-thumb { background: #cbd5e1; border-radius: 10px; }
        ::-webkit-scrollbar-thumb:hover { background: #94a3b8; }
    </style>
    <script>
        function showTab(tabId, element) {
            document.querySelectorAll('.tab-content').forEach(tab => tab.classList.remove('active'));
            document.querySelectorAll('.nav-link').forEach(link => {
                link.classList.remove('bg-blue-50', 'text-blue-700', 'font-semibold');
                link.classList.add('text-slate-600', 'hover:bg-slate-50');
            });
            
            document.getElementById(tabId).classList.add('active');
            if (element) {
                element.classList.remove('text-slate-600', 'hover:bg-slate-50');
                element.classList.add('bg-blue-50', 'text-blue-700', 'font-semibold');
            }
        }

        function openEditCourseModal(code, title, instructor, credits, maxCapacity) {
            document.getElementById('edit-old-code').value = code;
            document.getElementById('edit-code').value = code;
            document.getElementById('edit-title').value = title;
            document.getElementById('edit-instructor').value = instructor;
            document.getElementById('edit-credits').value = credits;
            document.getElementById('edit-maxCapacity').value = maxCapacity;
            document.getElementById('editCourseModal').classList.remove('hidden');
        }

        function openAddCourseModal() { document.getElementById('addCourseModal').classList.remove('hidden'); }
        function closeModals() { document.querySelectorAll('.modal').forEach(m => m.classList.add('hidden')); }
    </script>
    <style>
        /* Hide Google Translate completely */
        .goog-te-banner-frame.skiptranslate, .goog-te-gadget-icon, #goog-gt-tt, .goog-tooltip, .goog-te-spinner { display: none !important; visibility: hidden !important; }
        body { top: 0px !important; position: static !important; }
        font { background: transparent !important; color: inherit !important; box-shadow: none !important; }
    </style>
    <script type="text/javascript">
        function googleTranslateElementInit() {
            new google.translate.TranslateElement({pageLanguage: 'en', includedLanguages: 'en,si,ta', autoDisplay: false}, 'google_translate_element');
        }
        function changeLanguage(langCode, langName) {
            document.getElementById('current-lang').innerText = langName;
            document.cookie = "googtrans=/en/" + langCode + "; path=/";
            document.cookie = "googtrans=/en/" + langCode + "; domain=" + window.location.hostname + "; path=/";
            var selectField = document.querySelector("select.goog-te-combo");
            if (selectField) {
                selectField.value = langCode;
                selectField.dispatchEvent(new Event("change"));
            } else {
                window.location.reload();
            }
        }
    </script>
    <script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
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
                <a onclick="showTab('tab-home', this)" class="nav-link flex items-center gap-3 px-4 py-3 rounded-xl cursor-pointer transition-all bg-blue-50 text-blue-700 font-semibold">
                    <i class="fas fa-chart-pie w-5 text-center"></i> Dashboard
                </a>
                <a onclick="showTab('tab-courses', this)" class="nav-link flex items-center gap-3 px-4 py-3 rounded-xl cursor-pointer transition-all text-slate-600 hover:bg-slate-50">
                    <i class="fas fa-layer-group w-5 text-center"></i> Course Catalog
                </a>
                <c:if test="${user.role == 'ADMIN'}">
                    <a onclick="showTab('tab-users', this)" class="nav-link flex items-center gap-3 px-4 py-3 rounded-xl cursor-pointer transition-all text-slate-600 hover:bg-slate-50">
                        <i class="fas fa-users-cog w-5 text-center"></i> User Management
                    </a>
                </c:if>
                <a href="/teachers" class="nav-link flex items-center gap-3 px-4 py-3 rounded-xl cursor-pointer transition-all text-slate-600 hover:bg-slate-50">
                    <i class="fas fa-chalkboard-teacher w-5 text-center"></i> Teacher Details
                </a>
            </nav>
            
            <p class="text-xs font-bold text-slate-400 uppercase tracking-wider mt-8 mb-4">Preferences</p>
            <nav class="space-y-1.5">
                <a onclick="showTab('tab-settings', this)" class="nav-link flex items-center gap-3 px-4 py-3 rounded-xl cursor-pointer transition-all text-slate-600 hover:bg-slate-50">
                    <i class="fas fa-cog w-5 text-center"></i> Settings
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
        
        <!-- Top Header bar -->
        <header class="bg-white border-b border-slate-200 px-8 py-5 sticky top-0 z-10 flex justify-between items-center">
            <div>
                <h1 class="text-2xl font-bold text-slate-900">Welcome back, ${user.fullname.split(' ')[0]} 👋</h1>
                <p class="text-sm text-slate-500 mt-1">Here is what's happening with your courses today.</p>
            </div>
            <div class="flex items-center gap-4">
                <div id="google_translate_element" style="display:none;"></div>
                <div class="relative inline-block text-left group z-50">
                    <button type="button" class="inline-flex justify-center items-center px-4 py-2 text-sm font-semibold text-slate-700 bg-white border border-slate-200 rounded-full hover:bg-slate-50 focus:outline-none shadow-sm transition-all">
                        <i class="fas fa-language mr-2 text-blue-600 text-lg"></i>
                        <span id="current-lang">English</span>
                        <i class="fas fa-chevron-down ml-2 text-slate-400 text-xs"></i>
                    </button>
                    <div class="origin-top-right absolute right-0 mt-2 w-48 rounded-2xl shadow-xl bg-white ring-1 ring-black ring-opacity-5 divide-y divide-slate-100 hidden group-hover:block transition-all opacity-0 group-hover:opacity-100 transform scale-95 group-hover:scale-100 overflow-hidden">
                        <div class="py-1">
                            <a href="javascript:void(0)" onclick="changeLanguage('en', 'English')" class="block px-4 py-2.5 text-sm font-medium text-slate-700 hover:bg-blue-50 hover:text-blue-700 transition-colors">English</a>
                            <a href="javascript:void(0)" onclick="changeLanguage('si', 'සිංහල')" class="block px-4 py-2.5 text-sm font-medium text-slate-700 hover:bg-blue-50 hover:text-blue-700 transition-colors">සිංහල (Sinhala)</a>
                            <a href="javascript:void(0)" onclick="changeLanguage('ta', 'தமிழ்')" class="block px-4 py-2.5 text-sm font-medium text-slate-700 hover:bg-blue-50 hover:text-blue-700 transition-colors">தமிழ் (Tamil)</a>
                        </div>
                    </div>
                </div>
                <button class="w-10 h-10 rounded-full bg-slate-100 text-slate-500 hover:bg-slate-200 hover:text-slate-700 transition-colors flex items-center justify-center">
                    <i class="fas fa-bell"></i>
                </button>
            </div>
        </header>

        <div class="p-8 max-w-7xl mx-auto">
            
            <!-- Tab: Home (Dashboard) -->
            <div id="tab-home" class="tab-content active">
                <c:choose>
                    <c:when test="${user.role == 'STUDENT'}">
                        <!-- Stats Row -->
                        <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
                            <div class="bg-white rounded-2xl p-6 border border-slate-200 shadow-sm flex items-center gap-5 relative overflow-hidden">
                                <div class="w-16 h-16 rounded-2xl bg-blue-50 flex items-center justify-center text-blue-600 text-2xl"><i class="fas fa-book-reader"></i></div>
                                <div><p class="text-sm font-medium text-slate-500">Enrolled Courses</p><p class="text-3xl font-extrabold text-slate-900">${enrolledCourses.size()}</p></div>
                            </div>
                            <div class="bg-white rounded-2xl p-6 border border-slate-200 shadow-sm flex items-center gap-5 relative overflow-hidden">
                                <div class="w-16 h-16 rounded-2xl bg-indigo-50 flex items-center justify-center text-indigo-600 text-2xl"><i class="fas fa-award"></i></div>
                                <div><p class="text-sm font-medium text-slate-500">Total Credits</p><p class="text-3xl font-extrabold text-slate-900">${totalCredits}</p></div>
                            </div>
                            <div class="bg-gradient-to-br from-blue-600 to-indigo-700 rounded-2xl p-6 shadow-md flex items-center gap-5 relative overflow-hidden text-white">
                                <div class="absolute -right-6 -top-6 w-32 h-32 rounded-full bg-white/10 blur-2xl"></div>
                                <div class="w-16 h-16 rounded-2xl bg-white/20 flex items-center justify-center text-2xl border border-white/20 backdrop-blur-sm"><i class="fas fa-chart-line"></i></div>
                                <div><p class="text-sm font-medium text-blue-100">Cumulative GPA</p><p class="text-4xl font-extrabold">${gpa}</p></div>
                            </div>
                        </div>

                        <!-- My Schedule -->
                        <div class="bg-white rounded-2xl border border-slate-200 shadow-sm overflow-hidden">
                            <div class="px-6 py-5 border-b border-slate-100 flex justify-between items-center bg-slate-50/50">
                                <h3 class="text-lg font-bold text-slate-900">Current Semester Schedule</h3>
                                <button onclick="document.querySelectorAll('.nav-link')[1].click()" class="text-sm font-semibold text-blue-600 hover:text-blue-700">Browse Catalog &rarr;</button>
                            </div>
                            <div class="overflow-x-auto">
                                <table class="w-full text-left border-collapse">
                                    <thead>
                                        <tr class="bg-white text-slate-500 text-xs uppercase tracking-wider border-b border-slate-200">
                                            <th class="px-6 py-4 font-semibold">Course Details</th>
                                            <th class="px-6 py-4 font-semibold">Instructor</th>
                                            <th class="px-6 py-4 font-semibold text-center">Credits</th>
                                            <th class="px-6 py-4 font-semibold text-right">Manage</th>
                                        </tr>
                                    </thead>
                                    <tbody class="divide-y divide-slate-100 text-slate-700 bg-white">
                                        <c:forEach var="c" items="${enrolledCourses}">
                                            <tr class="hover:bg-slate-50/80 transition-colors group">
                                                <td class="px-6 py-4">
                                                    <div class="flex items-center gap-4">
                                                        <div class="w-10 h-10 rounded-xl bg-blue-50 text-blue-600 font-bold flex items-center justify-center text-xs border border-blue-100">
                                                            ${c.code.substring(0,2)}
                                                        </div>
                                                        <div>
                                                            <a href="/courseDetails?code=${c.code}" class="font-bold text-slate-900 group-hover:text-blue-600 hover:underline transition-colors block">${c.title}</a>
                                                            <p class="text-xs text-slate-500 font-mono mt-0.5">${c.code}</p>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="px-6 py-4 text-sm font-medium text-slate-600">
                                                    <div class="flex items-center gap-2">
                                                        <img src="https://ui-avatars.com/api/?name=${c.instructor}&background=random&color=fff&size=32&rounded=true" alt="Instructor" class="w-8 h-8 rounded-full shadow-sm">
                                                        ${c.instructor}
                                                    </div>
                                                </td>
                                                <td class="px-6 py-4 text-center">
                                                    <span class="inline-flex items-center justify-center px-3 py-1 rounded-lg bg-slate-100 text-sm font-semibold text-slate-700">
                                                        ${c.credits} CR
                                                    </span>
                                                </td>
                                                <td class="px-6 py-4 text-right">
                                                    <div class="flex items-center justify-end gap-3">
                                                        <a href="/exam?courseCode=${c.code}" class="px-4 py-2 rounded-xl text-sm font-semibold text-blue-600 bg-blue-50 hover:bg-blue-100 border border-blue-200 transition-colors shadow-sm">
                                                            <i class="fas fa-pen-alt mr-1"></i> Take Exam
                                                        </a>
                                                        <form action="/DropCourse" method="post" class="m-0" onsubmit="return confirm('Are you sure you want to drop ${c.title}?');">
                                                            <input type="hidden" name="courseCode" value="${c.code}">
                                                            <button type="submit" class="px-4 py-2 rounded-xl text-sm font-semibold text-red-600 bg-white hover:bg-red-50 border border-slate-200 hover:border-red-200 transition-colors shadow-sm">
                                                                Drop
                                                            </button>
                                                        </form>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        <c:if test="${empty enrolledCourses}">
                                            <tr>
                                                <td colspan="4" class="px-6 py-16 text-center">
                                                    <div class="w-16 h-16 bg-slate-100 rounded-full flex items-center justify-center text-slate-400 text-2xl mx-auto mb-4"><i class="fas fa-calendar-times"></i></div>
                                                    <h4 class="text-lg font-bold text-slate-900 mb-1">No courses found</h4>
                                                    <p class="text-slate-500">You haven't enrolled in any courses for this semester yet.</p>
                                                </td>
                                            </tr>
                                        </c:if>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </c:when>

                    <c:otherwise>
                        <!-- Admin Dashboard -->
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                            <div class="bg-white p-8 rounded-3xl border border-slate-200 shadow-sm flex flex-col justify-center relative overflow-hidden">
                                <div class="absolute right-0 bottom-0 w-64 h-64 bg-gradient-to-tl from-blue-100 to-transparent rounded-tl-full opacity-50"></div>
                                <div class="w-16 h-16 rounded-2xl bg-blue-600 text-white flex items-center justify-center text-2xl shadow-lg shadow-blue-600/30 mb-6"><i class="fas fa-server"></i></div>
                                <h2 class="text-3xl font-extrabold text-slate-900 mb-2">System Overview</h2>
                                <p class="text-slate-500 mb-8 max-w-sm">Manage the entire educational ecosystem from this unified control center.</p>
                                <div class="flex gap-4">
                                    <button onclick="document.querySelectorAll('.nav-link')[1].click()" class="px-6 py-3 bg-slate-900 hover:bg-slate-800 text-white rounded-xl font-semibold shadow-md transition-all">Course Catalog</button>
                                    <button onclick="document.querySelectorAll('.nav-link')[2].click()" class="px-6 py-3 bg-white border border-slate-300 hover:bg-slate-50 text-slate-700 rounded-xl font-semibold transition-all">User Directory</button>
                                </div>
                            </div>
                            
                            <div class="grid grid-cols-1 sm:grid-cols-2 gap-6">
                                <div class="bg-white rounded-3xl p-6 border border-slate-200 shadow-sm flex flex-col justify-between">
                                    <div class="w-12 h-12 rounded-xl bg-indigo-50 text-indigo-600 flex items-center justify-center text-xl mb-4"><i class="fas fa-users"></i></div>
                                    <div>
                                        <p class="text-slate-500 font-medium mb-1">Total Users</p>
                                        <p class="text-4xl font-extrabold text-slate-900">${users.size()}</p>
                                    </div>
                                </div>
                                <div class="bg-white rounded-3xl p-6 border border-slate-200 shadow-sm flex flex-col justify-between">
                                    <div class="w-12 h-12 rounded-xl bg-emerald-50 text-emerald-600 flex items-center justify-center text-xl mb-4"><i class="fas fa-book"></i></div>
                                    <div>
                                        <p class="text-slate-500 font-medium mb-1">Active Courses</p>
                                        <p class="text-4xl font-extrabold text-slate-900">${availableCourses.size()}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>

            <!-- Tab: Course Catalog -->
            <div id="tab-courses" class="tab-content">
                <div class="flex flex-col md:flex-row justify-between items-start md:items-end mb-8 gap-4">
                    <div>
                        <h2 class="text-2xl font-bold text-slate-900">Explore Courses</h2>
                        <p class="text-slate-500 mt-1">Discover programs built by industry experts and top universities.</p>
                    </div>
                    <c:if test="${user.role == 'ADMIN'}">
                        <button onclick="openAddCourseModal()" class="px-5 py-2.5 bg-blue-600 hover:bg-blue-700 text-white font-semibold rounded-xl shadow-md transition-all flex items-center gap-2">
                            <i class="fas fa-plus"></i> Create Course
                        </button>
                    </c:if>
                </div>

                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
                    <c:forEach var="c" items="${availableCourses}" varStatus="loop">
                        <c:set var="isEnrolled" value="false" />
                        <c:forEach var="code" items="${enrolledCodes}">
                            <c:if test="${code eq c.code}"><c:set var="isEnrolled" value="true" /></c:if>
                        </c:forEach>
                        
                        <div class="bg-white rounded-3xl overflow-hidden shadow-sm border border-slate-200 hover:shadow-xl transition-all duration-300 flex flex-col group h-full">
                            <!-- Header Graphic -->
                            <div class="h-32 bg-gradient-to-r p-6 relative flex flex-col justify-between
                                ${loop.index % 4 == 0 ? 'from-blue-500 to-indigo-600' : 
                                  loop.index % 4 == 1 ? 'from-emerald-400 to-teal-500' : 
                                  loop.index % 4 == 2 ? 'from-purple-500 to-pink-500' : 'from-orange-400 to-rose-400'}">
                                <div class="absolute inset-0 bg-white/10 mix-blend-overlay"></div>
                                <div class="flex justify-between items-start relative z-10">
                                    <span class="px-3 py-1 bg-white/20 backdrop-blur-md rounded-lg text-white text-xs font-bold font-mono tracking-wider border border-white/20 shadow-sm">
                                        ${c.code}
                                    </span>
                                    <span class="px-3 py-1 bg-white rounded-full text-xs font-bold text-slate-800 shadow-sm flex items-center gap-1.5">
                                        <div class="w-1.5 h-1.5 rounded-full bg-green-500"></div> ${c.maxCapacity} Seats
                                    </span>
                                </div>
                            </div>
                            
                            <div class="p-6 flex-1 flex flex-col">
                                <h3 class="font-extrabold text-xl text-slate-900 mb-3 leading-tight group-hover:text-blue-600 transition-colors">${c.title}</h3>
                                
                                <div class="mt-auto space-y-3 pt-4 border-t border-slate-100">
                                    <div class="flex items-center gap-3">
                                        <img src="https://ui-avatars.com/api/?name=${c.instructor}&background=f1f5f9&color=64748b&size=32&rounded=true" alt="Instructor" class="w-8 h-8 rounded-full border border-slate-200">
                                        <span class="text-sm font-medium text-slate-600">${c.instructor}</span>
                                    </div>
                                    <div class="flex items-center justify-between text-sm">
                                        <span class="text-slate-500 flex items-center gap-1.5"><i class="fas fa-clock text-slate-400"></i> ${c.credits} Credits</span>
                                        <span class="text-slate-500 flex items-center gap-1.5"><i class="fas fa-signal text-slate-400"></i> Intermediate</span>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="p-6 pt-0 mt-auto">
                                <c:choose>
                                    <c:when test="${user.role == 'ADMIN'}">
                                        <div class="flex gap-3">
                                            <button onclick="openEditCourseModal('${c.code}', '${c.title}', '${c.instructor}', ${c.credits}, ${c.maxCapacity})" class="flex-1 py-2.5 bg-slate-100 hover:bg-slate-200 text-slate-700 rounded-xl font-semibold transition-colors text-sm">Edit</button>
                                            <form action="/DeleteCourse" method="post" class="flex-1 m-0 p-0" onsubmit="return confirm('Delete this course?');">
                                                <input type="hidden" name="code" value="${c.code}">
                                                <button type="submit" class="w-full py-2.5 bg-white border border-red-200 text-red-600 hover:bg-red-50 hover:border-red-300 rounded-xl font-semibold transition-colors text-sm">Delete</button>
                                            </form>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <form action="/EnrollCourse" method="post" class="m-0 p-0">
                                            <input type="hidden" name="courseCode" value="${c.code}">
                                            <button type="submit" class="w-full py-3 rounded-xl font-bold transition-all ${isEnrolled ? 'bg-slate-100 text-slate-400 cursor-not-allowed' : 'bg-blue-600 hover:bg-blue-700 text-white shadow-md shadow-blue-600/20 hover:-translate-y-0.5'}" ${isEnrolled ? 'disabled' : ''}>
                                                ${isEnrolled ? 'Already Enrolled' : 'Enroll Now'}
                                            </button>
                                        </form>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <!-- Tab: Users (Admin Only) -->
            <c:if test="${user.role == 'ADMIN'}">
                <div id="tab-users" class="tab-content">
                    <div class="flex justify-between items-end mb-6">
                        <div>
                            <h2 class="text-2xl font-bold text-slate-900">User Directory</h2>
                            <p class="text-slate-500 mt-1">Manage system access and student roles.</p>
                        </div>
                    </div>

                    <div class="bg-white rounded-2xl border border-slate-200 shadow-sm overflow-hidden">
                        <!-- Toolbar -->
                        <div class="p-5 border-b border-slate-100 bg-slate-50/50 flex justify-between items-center">
                            <div class="relative w-80">
                                <i class="fas fa-search absolute left-4 top-1/2 -translate-y-1/2 text-slate-400"></i>
                                <input type="text" placeholder="Search by name or email..." class="w-full pl-10 pr-4 py-2.5 bg-white border border-slate-200 rounded-xl text-sm focus:outline-none focus:border-blue-500 focus:ring-2 focus:ring-blue-100 transition-all">
                            </div>
                        </div>

                        <!-- Table -->
                        <div class="overflow-x-auto">
                            <table class="w-full text-left border-collapse">
                                <thead>
                                    <tr class="bg-white text-slate-500 text-xs uppercase tracking-wider border-b border-slate-200">
                                        <th class="px-6 py-4 font-semibold">User Details</th>
                                        <th class="px-6 py-4 font-semibold">Role</th>
                                        <th class="px-6 py-4 font-semibold">Status</th>
                                        <th class="px-6 py-4 font-semibold text-right">Actions</th>
                                    </tr>
                                </thead>
                                <tbody class="divide-y divide-slate-100 text-slate-700 bg-white">
                                    <c:forEach var="u" items="${users}">
                                        <tr class="hover:bg-slate-50/80 transition-colors">
                                            <td class="px-6 py-4">
                                                <div class="flex items-center gap-4">
                                                    <div class="w-10 h-10 rounded-full bg-gradient-to-tr from-slate-100 to-slate-200 flex items-center justify-center text-slate-600 font-bold border border-slate-200 shadow-sm">
                                                        ${u.fullname.substring(0,1)}
                                                    </div>
                                                    <div>
                                                        <p class="font-bold text-slate-900">${u.fullname}</p>
                                                        <p class="text-sm text-slate-500">${u.email}</p>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="px-6 py-4">
                                                <span class="inline-flex items-center justify-center px-3 py-1 rounded-full text-xs font-bold border 
                                                    ${u.role == 'ADMIN' ? 'bg-purple-50 text-purple-700 border-purple-200' : 'bg-blue-50 text-blue-700 border-blue-200'}">
                                                    ${u.role}
                                                </span>
                                            </td>
                                            <td class="px-6 py-4">
                                                <span class="flex items-center gap-1.5 text-sm font-medium text-slate-600">
                                                    <div class="w-2 h-2 rounded-full bg-green-500"></div> Active
                                                </span>
                                            </td>
                                            <td class="px-6 py-4 text-right">
                                                <c:if test="${u.role == 'STUDENT'}">
                                                    <a href="/studentProfile?email=${u.email}" class="w-8 h-8 rounded-lg text-blue-500 hover:bg-blue-50 hover:text-blue-700 inline-flex items-center justify-center transition-colors border border-transparent hover:border-blue-100 mr-1" title="View Profile">
                                                        <i class="fas fa-eye"></i>
                                                    </a>
                                                </c:if>
                                                <form action="/DeleteUser" method="post" class="m-0 inline-block" onsubmit="return confirm('Permanently delete this user?');">
                                                    <input type="hidden" name="email" value="${u.email}">
                                                    <button type="submit" class="w-8 h-8 rounded-lg text-red-500 hover:bg-red-50 hover:text-red-700 inline-flex items-center justify-center transition-colors border border-transparent hover:border-red-100" title="Delete">
                                                        <i class="fas fa-trash-alt"></i>
                                                    </button>
                                                </form>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </c:if>

            <!-- Tab: Settings -->
            <div id="tab-settings" class="tab-content">
                <h2 class="text-2xl font-bold text-slate-900 mb-6">Account Settings</h2>
                
                <div class="grid grid-cols-1 lg:grid-cols-2 gap-8">
                    <!-- Profile -->
                    <div class="bg-white rounded-2xl border border-slate-200 shadow-sm overflow-hidden">
                        <div class="px-6 py-5 border-b border-slate-100 bg-slate-50/50">
                            <h3 class="text-lg font-bold text-slate-900">Personal Information</h3>
                        </div>
                        <div class="p-6">
                            <form action="/UpdateProfile" method="post" class="space-y-5">
                                <div>
                                    <label class="block text-sm font-semibold text-slate-700 mb-1.5">Full Name</label>
                                    <input type="text" name="fullname" value="${user.fullname}" class="w-full px-4 py-2.5 rounded-xl border border-slate-200 focus:border-blue-500 focus:ring-2 focus:ring-blue-100 outline-none transition-all bg-white text-slate-900">
                                </div>
                                <div>
                                    <label class="block text-sm font-semibold text-slate-700 mb-1.5">Email Address</label>
                                    <input type="text" value="${user.email}" readonly class="w-full px-4 py-2.5 rounded-xl border border-slate-200 bg-slate-50 text-slate-500 cursor-not-allowed outline-none">
                                </div>
                                <div class="pt-2">
                                    <button type="submit" class="px-6 py-3 bg-blue-600 hover:bg-blue-700 text-white font-semibold rounded-xl shadow-md transition-all">Save Changes</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    
                    <!-- Security -->
                    <div class="bg-white rounded-2xl border border-slate-200 shadow-sm overflow-hidden">
                        <div class="px-6 py-5 border-b border-slate-100 bg-slate-50/50">
                            <h3 class="text-lg font-bold text-slate-900">Security</h3>
                        </div>
                        <div class="p-6">
                            <form action="/ChangePassword" method="post" class="space-y-5">
                                <div>
                                    <label class="block text-sm font-semibold text-slate-700 mb-1.5">New Password</label>
                                    <input type="password" name="newPassword" required placeholder="••••••••" class="w-full px-4 py-2.5 rounded-xl border border-slate-200 focus:border-blue-500 focus:ring-2 focus:ring-blue-100 outline-none transition-all bg-white text-slate-900">
                                </div>
                                <div class="pt-2">
                                    <button type="submit" class="px-6 py-3 bg-slate-900 hover:bg-slate-800 text-white font-semibold rounded-xl shadow-md transition-all">Update Password</button>
                                </div>
                            </form>
                            <c:if test="${param.passwordChanged == 'true'}">
                                <div class="mt-5 p-4 rounded-xl bg-green-50 text-green-700 text-sm font-semibold flex items-center gap-2 border border-green-100">
                                    <i class="fas fa-check-circle"></i> Password updated successfully
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <!-- Modal: Add/Edit Components Hidden for brevity, keeping functionality intact -->
    <div id="addCourseModal" class="modal hidden fixed inset-0 z-50 overflow-y-auto">
        <div class="flex items-center justify-center min-h-screen px-4 pt-4 pb-20 text-center sm:p-0">
            <div class="fixed inset-0 bg-slate-900/40 backdrop-blur-sm transition-opacity" onclick="closeModals()"></div>
            <div class="inline-block bg-white rounded-2xl text-left overflow-hidden shadow-2xl transform transition-all sm:my-8 sm:align-middle sm:max-w-lg w-full border border-slate-200">
                <div class="px-6 py-5 border-b border-slate-100 flex justify-between items-center bg-slate-50">
                    <h3 class="text-lg font-bold text-slate-900">Create Course</h3>
                    <button onclick="closeModals()" class="text-slate-400 hover:text-slate-600"><i class="fas fa-times text-xl"></i></button>
                </div>
                <form action="/AddCourse" method="post">
                    <div class="p-6 space-y-4">
                        <div><label class="block text-sm font-semibold text-slate-700 mb-1">Code</label><input type="text" name="code" class="w-full px-3 py-2 border border-slate-200 rounded-lg focus:border-blue-500 focus:ring-2 focus:ring-blue-100 outline-none" required></div>
                        <div><label class="block text-sm font-semibold text-slate-700 mb-1">Title</label><input type="text" name="title" class="w-full px-3 py-2 border border-slate-200 rounded-lg focus:border-blue-500 focus:ring-2 focus:ring-blue-100 outline-none" required></div>
                        <div><label class="block text-sm font-semibold text-slate-700 mb-1">Instructor</label><input type="text" name="instructor" class="w-full px-3 py-2 border border-slate-200 rounded-lg focus:border-blue-500 focus:ring-2 focus:ring-blue-100 outline-none" required></div>
                        <div class="grid grid-cols-2 gap-4">
                            <div><label class="block text-sm font-semibold text-slate-700 mb-1">Credits</label><input type="number" name="credits" class="w-full px-3 py-2 border border-slate-200 rounded-lg focus:border-blue-500 focus:ring-2 focus:ring-blue-100 outline-none" required></div>
                            <div><label class="block text-sm font-semibold text-slate-700 mb-1">Capacity</label><input type="number" name="maxCapacity" class="w-full px-3 py-2 border border-slate-200 rounded-lg focus:border-blue-500 focus:ring-2 focus:ring-blue-100 outline-none" required></div>
                        </div>
                    </div>
                    <div class="px-6 py-4 bg-slate-50 border-t border-slate-100 flex justify-end gap-3">
                        <button type="button" onclick="closeModals()" class="px-4 py-2 bg-white border border-slate-200 text-slate-700 rounded-xl font-semibold hover:bg-slate-50">Cancel</button>
                        <button type="submit" class="px-4 py-2 bg-blue-600 text-white rounded-xl font-semibold hover:bg-blue-700 shadow-md">Save Course</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    <div id="editCourseModal" class="modal hidden fixed inset-0 z-50 overflow-y-auto">
        <div class="flex items-center justify-center min-h-screen px-4 pt-4 pb-20 text-center sm:p-0">
            <div class="fixed inset-0 bg-slate-900/40 backdrop-blur-sm transition-opacity" onclick="closeModals()"></div>
            <div class="inline-block bg-white rounded-2xl text-left overflow-hidden shadow-2xl transform transition-all sm:my-8 sm:align-middle sm:max-w-lg w-full border border-slate-200">
                <div class="px-6 py-5 border-b border-slate-100 flex justify-between items-center bg-slate-50">
                    <h3 class="text-lg font-bold text-slate-900">Edit Course</h3>
                    <button onclick="closeModals()" class="text-slate-400 hover:text-slate-600"><i class="fas fa-times text-xl"></i></button>
                </div>
                <form action="/UpdateCourse" method="post">
                    <div class="p-6 space-y-4">
                        <input type="hidden" name="oldCode" id="edit-old-code">
                        <div><label class="block text-sm font-semibold text-slate-700 mb-1">Code</label><input type="text" name="code" id="edit-code" class="w-full px-3 py-2 border border-slate-200 rounded-lg focus:border-blue-500 focus:ring-2 focus:ring-blue-100 outline-none" required></div>
                        <div><label class="block text-sm font-semibold text-slate-700 mb-1">Title</label><input type="text" name="title" id="edit-title" class="w-full px-3 py-2 border border-slate-200 rounded-lg focus:border-blue-500 focus:ring-2 focus:ring-blue-100 outline-none" required></div>
                        <div><label class="block text-sm font-semibold text-slate-700 mb-1">Instructor</label><input type="text" name="instructor" id="edit-instructor" class="w-full px-3 py-2 border border-slate-200 rounded-lg focus:border-blue-500 focus:ring-2 focus:ring-blue-100 outline-none" required></div>
                        <div class="grid grid-cols-2 gap-4">
                            <div><label class="block text-sm font-semibold text-slate-700 mb-1">Credits</label><input type="number" name="credits" id="edit-credits" class="w-full px-3 py-2 border border-slate-200 rounded-lg focus:border-blue-500 focus:ring-2 focus:ring-blue-100 outline-none" required></div>
                            <div><label class="block text-sm font-semibold text-slate-700 mb-1">Capacity</label><input type="number" name="maxCapacity" id="edit-maxCapacity" class="w-full px-3 py-2 border border-slate-200 rounded-lg focus:border-blue-500 focus:ring-2 focus:ring-blue-100 outline-none" required></div>
                        </div>
                    </div>
                    <div class="px-6 py-4 bg-slate-50 border-t border-slate-100 flex justify-end gap-3">
                        <button type="button" onclick="closeModals()" class="px-4 py-2 bg-white border border-slate-200 text-slate-700 rounded-xl font-semibold hover:bg-slate-50">Cancel</button>
                        <button type="submit" class="px-4 py-2 bg-blue-600 text-white rounded-xl font-semibold hover:bg-blue-700 shadow-md">Save Changes</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>