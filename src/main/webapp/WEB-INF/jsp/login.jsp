<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - EduSphere</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>body { font-family: 'Plus Jakarta Sans', sans-serif; }</style>
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
<body class="bg-white min-h-screen flex">
    
    <!-- Left: Image Section -->
    <div class="hidden lg:flex lg:w-1/2 relative bg-slate-900 overflow-hidden">
        <img src="https://images.unsplash.com/photo-1513258496099-48168024aec0?ixlib=rb-4.0.3&auto=format&fit=crop&w=1500&q=80" alt="Library" class="absolute inset-0 w-full h-full object-cover opacity-50 mix-blend-overlay">
        <div class="absolute inset-0 bg-gradient-to-t from-blue-900/80 to-transparent"></div>
        <div class="relative z-10 flex flex-col justify-end p-16 w-full">
            <a href="/" class="w-12 h-12 bg-blue-600 rounded-xl flex items-center justify-center text-white font-bold text-2xl mb-8 hover:bg-blue-500 transition-colors cursor-pointer">E</a>
            <h2 class="text-4xl font-bold text-white mb-4">Welcome back to your educational journey.</h2>
            <p class="text-blue-100 text-lg max-w-md">Access your courses, connect with peers, and track your progress on the world's leading learning platform.</p>
        </div>
    </div>

    <!-- Right: Form Section -->
    <div class="w-full lg:w-1/2 flex items-center justify-center p-8 sm:p-12 lg:p-24 bg-white">
        <div class="w-full max-w-md">
            <div class="lg:hidden flex items-center gap-2 mb-8">
                <a href="/" class="w-10 h-10 bg-blue-600 rounded-xl flex items-center justify-center text-white font-bold text-xl">E</a>
                <span class="font-extrabold text-2xl tracking-tight text-slate-900">EduSphere</span>
            </div>

            <div class="flex justify-between items-center mb-2">
                <h1 class="text-3xl font-extrabold text-slate-900">Log In</h1>
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
            <p class="text-slate-500 mb-8">Don't have an account? <a href="/register" class="text-blue-600 font-semibold hover:underline">Sign up for free</a></p>

            <form action="/LoginEndpoint" method="post" class="space-y-5">
                <% if ("invalid".equals(request.getParameter("error"))) { %>
                    <div class="p-4 rounded-xl bg-red-50 text-red-600 text-sm font-medium flex items-center gap-2 border border-red-100">
                        <i class="fas fa-exclamation-circle"></i> Invalid email or password.
                    </div>
                <% } %>
                <% if ("true".equals(request.getParameter("registered"))) { %>
                    <div class="p-4 rounded-xl bg-green-50 text-green-600 text-sm font-medium flex items-center gap-2 border border-green-100">
                        <i class="fas fa-check-circle"></i> Account created! Please log in.
                    </div>
                <% } %>

                <div>
                    <label class="block text-sm font-semibold text-slate-700 mb-1">Email Address</label>
                    <input type="email" name="email" required placeholder="name@example.com" class="w-full px-4 py-3 rounded-xl border border-slate-200 focus:border-blue-500 focus:ring-2 focus:ring-blue-200 outline-none transition-all text-slate-800 placeholder-slate-400 bg-slate-50 focus:bg-white">
                </div>
                
                <div>
                    <div class="flex justify-between items-center mb-1">
                        <label class="block text-sm font-semibold text-slate-700">Password</label>
                        <a href="#" class="text-sm font-semibold text-blue-600 hover:text-blue-700">Forgot password?</a>
                    </div>
                    <input type="password" name="password" required placeholder="••••••••" class="w-full px-4 py-3 rounded-xl border border-slate-200 focus:border-blue-500 focus:ring-2 focus:ring-blue-200 outline-none transition-all text-slate-800 placeholder-slate-400 bg-slate-50 focus:bg-white">
                </div>

                <div class="flex items-center gap-2 pt-2">
                    <input type="checkbox" id="remember" class="w-4 h-4 text-blue-600 rounded border-slate-300 focus:ring-blue-500">
                    <label for="remember" class="text-sm text-slate-600 font-medium cursor-pointer">Remember me for 30 days</label>
                </div>

                <button type="submit" class="w-full py-3.5 px-4 bg-blue-600 hover:bg-blue-700 text-white rounded-xl font-bold text-lg shadow-lg shadow-blue-600/30 transition-all hover:-translate-y-0.5 mt-4">
                    Log In
                </button>
            </form>
        </div>
    </div>
</body>
</html>