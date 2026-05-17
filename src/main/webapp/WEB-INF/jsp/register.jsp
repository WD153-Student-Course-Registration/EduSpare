<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - EduSphere</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>body { font-family: 'Plus Jakarta Sans', sans-serif; }</style>
    <script>
        function toggleStudentFields() {
            const role = document.querySelector('input[name="role"]:checked').value;
            const fields = document.getElementById('student-fields');
            if (role === 'STUDENT') {
                fields.style.display = 'grid';
            } else {
                fields.style.display = 'none';
            }
        }
        window.onload = toggleStudentFields;
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
<body class="bg-slate-50 min-h-screen flex items-center justify-center p-4 sm:p-8">
    
    <div class="w-full max-w-6xl bg-white rounded-3xl shadow-2xl overflow-hidden flex flex-col lg:flex-row border border-slate-100">
        
        <!-- Left: Branding/Info -->
        <div class="w-full lg:w-5/12 bg-blue-600 p-12 text-white flex flex-col justify-between relative overflow-hidden">
            <div class="absolute top-0 right-0 -mr-20 -mt-20 w-64 h-64 rounded-full bg-blue-500 opacity-50 blur-3xl"></div>
            <div class="absolute bottom-0 left-0 -ml-20 -mb-20 w-80 h-80 rounded-full bg-purple-500 opacity-30 blur-3xl"></div>
            
            <div class="relative z-10">
                <a href="/" class="flex items-center gap-3 text-white mb-12 hover:opacity-80 transition-opacity">
                    <div class="w-10 h-10 bg-white rounded-xl flex items-center justify-center text-blue-600 font-bold text-xl shadow-lg">E</div>
                    <span class="font-extrabold text-2xl tracking-tight">EduSphere</span>
                </a>
                <h2 class="text-4xl font-extrabold mb-6 leading-tight">Start your learning journey today.</h2>
                <p class="text-blue-100 text-lg mb-12">Join a global community. Learn from experts. Advance your career.</p>
                
                <div class="space-y-6">
                    <div class="flex items-center gap-4">
                        <div class="w-12 h-12 rounded-full bg-blue-500/50 flex items-center justify-center text-xl backdrop-blur-sm border border-blue-400/50"><i class="fas fa-laptop-code"></i></div>
                        <div><p class="font-bold">World-class Curriculum</p><p class="text-sm text-blue-200">Access materials from top institutions.</p></div>
                    </div>
                    <div class="flex items-center gap-4">
                        <div class="w-12 h-12 rounded-full bg-blue-500/50 flex items-center justify-center text-xl backdrop-blur-sm border border-blue-400/50"><i class="fas fa-certificate"></i></div>
                        <div><p class="font-bold">Recognized Credentials</p><p class="text-sm text-blue-200">Earn certificates to boost your resume.</p></div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Right: Form -->
        <div class="w-full lg:w-7/12 p-8 sm:p-12 lg:p-16">
            <div class="max-w-md mx-auto">
                <div class="flex justify-between items-center mb-2">
                    <h1 class="text-3xl font-extrabold text-slate-900">Create an account</h1>
                    <div id="google_translate_element" style="display:none;"></div>
                    <div class="relative inline-block text-left group z-50">
                        <button type="button" class="inline-flex justify-center items-center px-3 py-1.5 text-sm font-semibold text-slate-700 bg-white border border-slate-200 rounded-full hover:bg-slate-50 focus:outline-none shadow-sm transition-all">
                            <i class="fas fa-language mr-1.5 text-blue-600"></i>
                            <span id="current-lang">English</span>
                            <i class="fas fa-chevron-down ml-1.5 text-slate-400 text-xs"></i>
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
                <p class="text-slate-500 mb-8">Already have an account? <a href="/login" class="text-blue-600 font-semibold hover:underline">Log in</a></p>

                <form action="/RegisterEndpoint" method="post" class="space-y-5">
                    <% if (request.getParameter("error") != null) { %>
                        <div class="p-4 rounded-xl bg-red-50 text-red-600 text-sm font-medium flex items-center gap-2 border border-red-100">
                            <i class="fas fa-exclamation-circle"></i> <%= request.getParameter("error") %>
                        </div>
                    <% } %>

                    <div class="grid grid-cols-1 md:grid-cols-2 gap-5">
                        <div>
                            <label class="block text-sm font-semibold text-slate-700 mb-1">Full Name</label>
                            <input type="text" name="fullname" required placeholder="John Doe" class="w-full px-4 py-3 rounded-xl border border-slate-200 focus:border-blue-500 focus:ring-2 focus:ring-blue-200 outline-none transition-all text-slate-800 placeholder-slate-400 bg-slate-50 focus:bg-white">
                        </div>
                        <div>
                            <label class="block text-sm font-semibold text-slate-700 mb-1">Email</label>
                            <input type="email" name="email" required placeholder="john@example.com" class="w-full px-4 py-3 rounded-xl border border-slate-200 focus:border-blue-500 focus:ring-2 focus:ring-blue-200 outline-none transition-all text-slate-800 placeholder-slate-400 bg-slate-50 focus:bg-white">
                        </div>
                    </div>

                    <div>
                        <label class="block text-sm font-semibold text-slate-700 mb-1">Password</label>
                        <input type="password" name="password" required placeholder="Create a strong password" class="w-full px-4 py-3 rounded-xl border border-slate-200 focus:border-blue-500 focus:ring-2 focus:ring-blue-200 outline-none transition-all text-slate-800 placeholder-slate-400 bg-slate-50 focus:bg-white">
                    </div>

                    <div class="pt-2">
                        <label class="block text-sm font-semibold text-slate-700 mb-3">I am registering as a:</label>
                        <div class="grid grid-cols-2 gap-4">
                            <label class="relative flex cursor-pointer">
                                <input type="radio" name="role" value="STUDENT" checked onclick="toggleStudentFields()" class="peer sr-only">
                                <div class="w-full p-4 rounded-xl border-2 border-slate-200 bg-white peer-checked:border-blue-600 peer-checked:bg-blue-50 hover:bg-slate-50 transition-all text-center font-bold text-slate-700 peer-checked:text-blue-700">
                                    <i class="fas fa-user-graduate block text-2xl mb-2 text-blue-500"></i>
                                    Student
                                </div>
                            </label>
                            <label class="relative flex cursor-pointer">
                                <input type="radio" name="role" value="ADMIN" onclick="toggleStudentFields()" class="peer sr-only">
                                <div class="w-full p-4 rounded-xl border-2 border-slate-200 bg-white peer-checked:border-blue-600 peer-checked:bg-blue-50 hover:bg-slate-50 transition-all text-center font-bold text-slate-700 peer-checked:text-blue-700">
                                    <i class="fas fa-user-shield block text-2xl mb-2 text-purple-500"></i>
                                    Administrator
                                </div>
                            </label>
                        </div>
                    </div>

                    <div id="student-fields" class="grid grid-cols-1 md:grid-cols-2 gap-5 pt-2">
                        <div>
                            <label class="block text-sm font-semibold text-slate-700 mb-1">Student ID</label>
                            <input type="text" name="studentId" placeholder="e.g. S12345" class="w-full px-4 py-3 rounded-xl border border-slate-200 focus:border-blue-500 focus:ring-2 focus:ring-blue-200 outline-none transition-all text-slate-800 placeholder-slate-400 bg-slate-50 focus:bg-white">
                        </div>
                        <div>
                            <label class="block text-sm font-semibold text-slate-700 mb-1">Major</label>
                            <input type="text" name="major" placeholder="e.g. Computer Science" class="w-full px-4 py-3 rounded-xl border border-slate-200 focus:border-blue-500 focus:ring-2 focus:ring-blue-200 outline-none transition-all text-slate-800 placeholder-slate-400 bg-slate-50 focus:bg-white">
                        </div>
                    </div>

                    <div class="pt-6">
                        <button type="submit" class="w-full py-4 px-4 bg-blue-600 hover:bg-blue-700 text-white rounded-xl font-bold text-lg shadow-lg shadow-blue-600/30 transition-all hover:-translate-y-0.5">
                            Create Account
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>