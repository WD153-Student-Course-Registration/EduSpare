<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EduSphere - World Class Education</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body { font-family: 'Plus Jakarta Sans', sans-serif; background-color: #f8fafc; }
        .hero-gradient { background: linear-gradient(135deg, #f0f9ff 0%, #e0e7ff 100%); }
        .text-gradient { background-clip: text; -webkit-background-clip: text; -webkit-text-fill-color: transparent; background-image: linear-gradient(90deg, #2563eb, #7c3aed); }
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
<body class="antialiased text-slate-800">
    <!-- Navbar -->
    <nav class="fixed w-full z-50 bg-white/80 backdrop-blur-md border-b border-slate-200 transition-all duration-300">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="flex justify-between items-center h-20">
                <div class="flex items-center gap-2">
                    <div class="w-10 h-10 bg-blue-600 rounded-xl flex items-center justify-center text-white font-bold text-xl shadow-lg shadow-blue-600/30">E</div>
                    <span class="font-extrabold text-2xl tracking-tight text-slate-900">EduSphere</span>
                </div>
                <div class="hidden md:flex items-center space-x-8 font-medium text-slate-600">
                    <a href="#" class="hover:text-blue-600 transition-colors">Degrees</a>
                    <a href="#" class="hover:text-blue-600 transition-colors">Courses</a>
                    <a href="#" class="hover:text-blue-600 transition-colors">For Enterprise</a>
                </div>
                <div class="flex items-center space-x-4">
                    <div id="google_translate_element" style="display:none;"></div>
                    <div class="relative inline-block text-left group z-50">
                        <button type="button" class="inline-flex justify-center items-center px-4 py-2.5 text-sm font-semibold text-slate-700 bg-white border border-slate-200 rounded-full hover:bg-slate-50 focus:outline-none shadow-sm transition-all">
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
                    <a href="/login" class="text-slate-600 font-semibold hover:text-blue-600 transition-colors">Log In</a>
                    <a href="/register" class="bg-blue-600 hover:bg-blue-700 text-white px-6 py-2.5 rounded-full font-semibold transition-all shadow-md hover:shadow-xl hover:-translate-y-0.5">Join for Free</a>
                </div>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="relative pt-32 pb-20 lg:pt-48 lg:pb-32 overflow-hidden hero-gradient">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10">
            <div class="grid lg:grid-cols-2 gap-12 items-center">
                <div class="max-w-2xl">
                    <div class="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-blue-100 text-blue-700 font-semibold text-sm mb-6">
                        <span class="relative flex h-2 w-2"><span class="animate-ping absolute inline-flex h-full w-full rounded-full bg-blue-400 opacity-75"></span><span class="relative inline-flex rounded-full h-2 w-2 bg-blue-500"></span></span>
                        New Fall 2026 Courses Available
                    </div>
                    <h1 class="text-5xl lg:text-7xl font-extrabold tracking-tight mb-6 leading-[1.1]">
                        Learn without <br>limits with <br><span class="text-gradient">EduSphere Portal</span>
                    </h1>
                    <p class="text-lg text-slate-600 mb-8 leading-relaxed">
                        Build skills with courses, certificates, and degrees online from world-class universities and companies. Join millions of learners shaping their future.
                    </p>
                    <div class="flex flex-col sm:flex-row gap-4">
                        <a href="/register" class="bg-blue-600 text-white px-8 py-4 rounded-full font-bold text-lg text-center hover:bg-blue-700 transition-all shadow-lg hover:shadow-blue-600/30">Start Learning Today</a>
                        <a href="/login" class="bg-white text-slate-700 border border-slate-200 px-8 py-4 rounded-full font-bold text-lg text-center hover:bg-slate-50 transition-all shadow-sm">Explore Courses</a>
                    </div>
                </div>
                <div class="relative hidden lg:block">
                    <div class="absolute inset-0 bg-blue-400 rounded-3xl blur-3xl opacity-20 transform translate-x-10 translate-y-10"></div>
                    <img src="https://images.unsplash.com/photo-1522202176988-66273c2fd55f?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80" alt="Students collaborating" class="relative rounded-3xl shadow-2xl border border-white/50 object-cover h-[600px] w-full">
                    
                    <!-- Floating Badge -->
                    <div class="absolute top-10 -left-10 bg-white p-4 rounded-2xl shadow-xl border border-slate-100 flex items-center gap-4 animate-bounce" style="animation-duration: 3s;">
                        <div class="w-12 h-12 bg-green-100 rounded-full flex items-center justify-center text-green-600 text-xl"><i class="fas fa-certificate"></i></div>
                        <div>
                            <p class="text-sm text-slate-500 font-medium">Verified</p>
                            <p class="font-bold text-slate-800">Certificates</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <!-- Stats -->
    <section class="py-12 bg-white border-b border-slate-200">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="grid grid-cols-2 md:grid-cols-4 gap-8 text-center divide-x divide-slate-100">
                <div><p class="text-4xl font-extrabold text-blue-600 mb-2">50K+</p><p class="text-slate-500 font-medium">Active Learners</p></div>
                <div><p class="text-4xl font-extrabold text-blue-600 mb-2">1,200+</p><p class="text-slate-500 font-medium">Courses</p></div>
                <div><p class="text-4xl font-extrabold text-blue-600 mb-2">95%</p><p class="text-slate-500 font-medium">Completion Rate</p></div>
                <div><p class="text-4xl font-extrabold text-blue-600 mb-2">200+</p><p class="text-slate-500 font-medium">Partner Institutions</p></div>
            </div>
        </div>
    </section>
</body>
</html>