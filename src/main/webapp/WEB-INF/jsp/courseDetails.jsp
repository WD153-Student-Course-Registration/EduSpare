<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${course.title} - Course Details</title>
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
                    <i class="fas fa-book w-5 text-center"></i> Course Schedule
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
                <h1 class="text-2xl font-bold text-slate-900">Course Itinerary</h1>
                <p class="text-sm text-slate-500 mt-1">Review upcoming assessments and deadlines for your module.</p>
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
            </div>
        </header>

        <div class="p-8 max-w-5xl mx-auto">
            
            <!-- Course Hero Header -->
            <div class="bg-gradient-to-r from-blue-600 to-indigo-700 rounded-3xl p-8 mb-8 text-white shadow-lg relative overflow-hidden">
                <div class="absolute -right-10 -top-10 w-64 h-64 bg-white opacity-10 rounded-full blur-3xl"></div>
                <div class="relative z-10 flex flex-col md:flex-row justify-between items-start md:items-end gap-4">
                    <div>
                        <div class="inline-flex items-center gap-2 px-3 py-1 rounded-lg bg-white/20 backdrop-blur-md text-white text-xs font-bold font-mono border border-white/20 tracking-wider shadow-sm mb-4">
                            ${course.code}
                        </div>
                        <h2 class="text-4xl font-extrabold mb-2 leading-tight">${course.title}</h2>
                        <p class="text-blue-100 flex items-center gap-2 text-lg">
                            <i class="fas fa-chalkboard-teacher"></i> ${course.instructor} &nbsp;&bull;&nbsp; ${course.credits} Credits
                        </p>
                    </div>
                </div>
            </div>

            <!-- Schedule Grid -->
            <h3 class="text-xl font-bold text-slate-900 mb-6">Upcoming Assessments</h3>
            
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-8">
                
                <!-- Lab Tests -->
                <div class="bg-white p-6 rounded-2xl border border-slate-200 shadow-sm hover:shadow-md transition-shadow relative overflow-hidden group">
                    <div class="absolute top-0 right-0 w-24 h-24 bg-cyan-50 rounded-bl-full z-0 transition-transform group-hover:scale-110"></div>
                    <div class="relative z-10">
                        <div class="w-12 h-12 bg-cyan-100 text-cyan-600 rounded-xl flex items-center justify-center text-xl mb-4">
                            <i class="fas fa-vial"></i>
                        </div>
                        <h4 class="text-lg font-bold text-slate-900 mb-2">Lab Test 1 & 2</h4>
                        <p class="text-sm text-slate-500 mb-4">Practical examinations evaluating your hands-on coding and lab skills.</p>
                        
                        <div class="space-y-3">
                            <div class="flex justify-between items-center p-3 rounded-lg bg-slate-50 border border-slate-100">
                                <span class="text-sm font-semibold text-slate-700">Lab Test 1</span>
                                <span class="text-xs font-bold text-blue-600 bg-blue-50 px-2 py-1 rounded">Week 5</span>
                            </div>
                            <div class="flex justify-between items-center p-3 rounded-lg bg-slate-50 border border-slate-100">
                                <span class="text-sm font-semibold text-slate-700">Lab Test 2</span>
                                <span class="text-xs font-bold text-blue-600 bg-blue-50 px-2 py-1 rounded">Week 10</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Mid Exams -->
                <div class="bg-white p-6 rounded-2xl border border-slate-200 shadow-sm hover:shadow-md transition-shadow relative overflow-hidden group">
                    <div class="absolute top-0 right-0 w-24 h-24 bg-purple-50 rounded-bl-full z-0 transition-transform group-hover:scale-110"></div>
                    <div class="relative z-10">
                        <div class="w-12 h-12 bg-purple-100 text-purple-600 rounded-xl flex items-center justify-center text-xl mb-4">
                            <i class="fas fa-file-alt"></i>
                        </div>
                        <h4 class="text-lg font-bold text-slate-900 mb-2">Mid Semester Exam</h4>
                        <p class="text-sm text-slate-500 mb-4">Comprehensive written assessment covering the first half of the syllabus.</p>
                        
                        <div class="space-y-3 mt-auto">
                            <div class="flex justify-between items-center p-3 rounded-lg bg-slate-50 border border-slate-100">
                                <span class="text-sm font-semibold text-slate-700">Mid Exam</span>
                                <span class="text-xs font-bold text-purple-600 bg-purple-50 px-2 py-1 rounded">Week 7</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Lab Submission & Viva -->
                <div class="bg-white p-6 rounded-2xl border border-slate-200 shadow-sm hover:shadow-md transition-shadow relative overflow-hidden group">
                    <div class="absolute top-0 right-0 w-24 h-24 bg-orange-50 rounded-bl-full z-0 transition-transform group-hover:scale-110"></div>
                    <div class="relative z-10">
                        <div class="w-12 h-12 bg-orange-100 text-orange-600 rounded-xl flex items-center justify-center text-xl mb-4">
                            <i class="fas fa-project-diagram"></i>
                        </div>
                        <h4 class="text-lg font-bold text-slate-900 mb-2">Lab Submission + Viva</h4>
                        <p class="text-sm text-slate-500 mb-4">Final project submission followed by a one-on-one oral examination.</p>
                        
                        <div class="space-y-3">
                            <div class="flex justify-between items-center p-3 rounded-lg bg-slate-50 border border-slate-100">
                                <span class="text-sm font-semibold text-slate-700">Submission</span>
                                <span class="text-xs font-bold text-orange-600 bg-orange-50 px-2 py-1 rounded">Week 13</span>
                            </div>
                            <div class="flex justify-between items-center p-3 rounded-lg bg-slate-50 border border-slate-100">
                                <span class="text-sm font-semibold text-slate-700">Viva Dates</span>
                                <span class="text-xs font-bold text-orange-600 bg-orange-50 px-2 py-1 rounded">Week 14</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Final Exams -->
                <div class="bg-white p-6 rounded-2xl border border-slate-200 shadow-sm hover:shadow-md transition-shadow relative overflow-hidden group">
                    <div class="absolute top-0 right-0 w-24 h-24 bg-emerald-50 rounded-bl-full z-0 transition-transform group-hover:scale-110"></div>
                    <div class="relative z-10">
                        <div class="w-12 h-12 bg-emerald-100 text-emerald-600 rounded-xl flex items-center justify-center text-xl mb-4">
                            <i class="fas fa-graduation-cap"></i>
                        </div>
                        <h4 class="text-lg font-bold text-slate-900 mb-2">Final Examination</h4>
                        <p class="text-sm text-slate-500 mb-4">End of semester assessment covering all course materials.</p>
                        
                        <div class="space-y-3 mt-auto">
                            <div class="flex justify-between items-center p-3 rounded-lg bg-slate-50 border border-slate-100">
                                <span class="text-sm font-semibold text-slate-700">Final Exam</span>
                                <span class="text-xs font-bold text-emerald-600 bg-emerald-50 px-2 py-1 rounded">Week 16</span>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>
    </main>
</body>
</html>