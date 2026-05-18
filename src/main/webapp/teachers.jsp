<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Teacher Details - EduSphere</title>
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
    </style>
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
                <a href="/dashboard" class="nav-link flex items-center gap-3 px-4 py-3 rounded-xl cursor-pointer transition-all text-slate-600 hover:bg-slate-50">
                    <i class="fas fa-arrow-left w-5 text-center"></i> Back to Dashboard
                </a>
                <a href="#" class="nav-link flex items-center gap-3 px-4 py-3 rounded-xl cursor-pointer transition-all bg-blue-50 text-blue-700 font-semibold">
                    <i class="fas fa-chalkboard-teacher w-5 text-center"></i> Teacher Details
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
                <h1 class="text-2xl font-bold text-slate-900">Faculty Directory</h1>
                <p class="text-sm text-slate-500 mt-1">Discover our world-class instructors and their associated courses.</p>
            </div>
            <div class="flex items-center gap-4">
                <c:if test="${user.role == 'ADMIN'}">
                    <button onclick="document.getElementById('addTeacherModal').classList.remove('hidden')" class="px-5 py-2.5 bg-blue-600 hover:bg-blue-700 text-white font-semibold rounded-xl shadow-md transition-all flex items-center gap-2">
                        <i class="fas fa-plus"></i> Add Teacher
                    </button>
                </c:if>
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
            </div>
        </header>

        <div class="p-8 max-w-7xl mx-auto">
            
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
                <c:forEach var="entry" items="${teacherProfiles}">
                    <c:set var="teacher" value="${entry.key}" />
                    <c:set var="instructorCourses" value="${entry.value}" />
                    
                    <div class="bg-white rounded-3xl overflow-hidden shadow-sm border border-slate-200 hover:shadow-xl transition-all duration-300 flex flex-col group h-full">
                        <div class="h-24 bg-gradient-to-r from-slate-800 to-slate-700 p-6 relative">
                            <div class="absolute inset-0 bg-[url('https://www.transparenttextures.com/patterns/cubes.png')] opacity-10"></div>
                        </div>
                        
                        <div class="px-6 flex-1 flex flex-col relative -mt-12">
                            <img src="https://ui-avatars.com/api/?name=${teacher.name}&background=random&color=fff&size=96&rounded=true" alt="${teacher.name}" class="w-20 h-20 rounded-full border-4 border-white shadow-md bg-white">
                            
                            <div class="mt-4">
                                <h3 class="font-extrabold text-xl text-slate-900 leading-tight">${teacher.name}</h3>
                                <p class="text-blue-600 font-medium text-sm mt-1">${teacher.title} &bull; ${teacher.department}</p>
                            </div>
                            
                            <div class="mt-6 p-4 rounded-xl bg-slate-50 border border-slate-100 flex-1">
                                <h4 class="text-xs font-bold text-slate-400 uppercase tracking-wider mb-3">Teaches</h4>
                                <div class="space-y-4">
                                    <c:forEach var="c" items="${instructorCourses}">
                                        <div class="flex items-start gap-3">
                                            <div class="w-8 h-8 rounded-lg bg-blue-100 text-blue-600 flex flex-shrink-0 items-center justify-center font-bold text-xs">${c.code.substring(0,2)}</div>
                                            <div>
                                                <p class="font-bold text-slate-800 leading-tight text-sm">${c.title}</p>
                                                <p class="text-xs text-slate-500 mt-1">${c.credits} Credits &bull; Max Capacity: ${c.maxCapacity}</p>
                                            </div>
                                        </div>
                                    </c:forEach>
                                    <c:if test="${empty instructorCourses}">
                                        <div class="flex flex-col items-center justify-center py-4 text-center">
                                            <div class="w-10 h-10 bg-slate-200 rounded-full flex items-center justify-center text-slate-400 mb-2"><i class="fas fa-book-open"></i></div>
                                            <p class="text-sm font-medium text-slate-500">No courses assigned yet</p>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                        
                        <div class="p-6 pt-4 mt-auto space-y-2">
                            <button class="w-full py-2.5 rounded-xl border border-slate-200 text-slate-700 font-semibold hover:bg-slate-50 transition-colors text-sm">
                                View Full Profile
                            </button>
                            <c:if test="${user.role == 'ADMIN'}">
                                <form action="/RemoveTeacher" method="post" class="m-0" onsubmit="return confirm('Are you sure you want to remove ${teacher.name}? Their courses will be marked as Unassigned.');">
                                    <input type="hidden" name="instructor" value="${teacher.name}">
                                    <button type="submit" class="w-full py-2.5 rounded-xl border border-red-200 text-red-600 font-semibold hover:bg-red-50 transition-colors text-sm">
                                        Remove Teacher
                                    </button>
                                </form>
                            </c:if>
                        </div>
                    </div>
                </c:forEach>
            </div>
            
            <c:if test="${empty teacherProfiles}">
                <div class="bg-white p-12 rounded-3xl border border-slate-200 shadow-sm text-center">
                    <div class="w-16 h-16 bg-slate-100 rounded-full flex items-center justify-center text-slate-400 text-2xl mx-auto mb-4"><i class="fas fa-users-slash"></i></div>
                    <h3 class="text-xl font-bold text-slate-900 mb-2">No Faculty Found</h3>
                    <p class="text-slate-500">There are currently no instructors in the system.</p>
                </div>
            </c:if>

        </div>
    </main>

    <div id="addTeacherModal" class="hidden fixed inset-0 z-50 overflow-y-auto">
        <div class="flex items-center justify-center min-h-screen px-4 pt-4 pb-20 text-center sm:p-0">
            <div class="fixed inset-0 bg-slate-900/40 backdrop-blur-sm transition-opacity" onclick="document.getElementById('addTeacherModal').classList.add('hidden')"></div>
            <div class="inline-block bg-white rounded-2xl text-left overflow-hidden shadow-2xl transform transition-all sm:my-8 sm:align-middle sm:max-w-lg w-full border border-slate-200">
                <div class="px-6 py-5 border-b border-slate-100 flex justify-between items-center bg-slate-50">
                    <h3 class="text-lg font-bold text-slate-900">Add New Teacher</h3>
                    <button onclick="document.getElementById('addTeacherModal').classList.add('hidden')" class="text-slate-400 hover:text-slate-600"><i class="fas fa-times text-xl"></i></button>
                </div>
                <form action="/AddTeacher" method="post">
                    <div class="p-6 space-y-4">
                        <div><label class="block text-sm font-semibold text-slate-700 mb-1">Full Name</label><input type="text" name="name" class="w-full px-3 py-2 border border-slate-200 rounded-lg focus:border-blue-500 focus:ring-2 focus:ring-blue-100 outline-none" required></div>
                        <div><label class="block text-sm font-semibold text-slate-700 mb-1">Title</label><input type="text" name="title" value="Instructor" class="w-full px-3 py-2 border border-slate-200 rounded-lg focus:border-blue-500 focus:ring-2 focus:ring-blue-100 outline-none" required></div>
                        <div><label class="block text-sm font-semibold text-slate-700 mb-1">Department</label><input type="text" name="department" value="General" class="w-full px-3 py-2 border border-slate-200 rounded-lg focus:border-blue-500 focus:ring-2 focus:ring-blue-100 outline-none" required></div>
                    </div>
                    <div class="px-6 py-4 bg-slate-50 border-t border-slate-100 flex justify-end gap-3">
                        <button type="button" onclick="document.getElementById('addTeacherModal').classList.add('hidden')" class="px-4 py-2 bg-white border border-slate-200 text-slate-700 rounded-xl font-semibold hover:bg-slate-50">Cancel</button>
                        <button type="submit" class="px-4 py-2 bg-blue-600 text-white rounded-xl font-semibold hover:bg-blue-700 shadow-md">Add Teacher</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>