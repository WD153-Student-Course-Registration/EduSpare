<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${course.title} - Final Assessment</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>body { font-family: 'Plus Jakarta Sans', sans-serif; background-color: #f8fafc; }</style>
    <script>
        function submitExam(e) {
            e.preventDefault();
            // Automatically calculate a random score between 75 and 100 for simulation purposes
            const score = Math.floor(Math.random() * (100 - 75 + 1) + 75);
            document.getElementById('marks').value = score;
            document.getElementById('examForm').submit();
        }
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
<body class="flex flex-col min-h-screen">
    
    <!-- Top Nav -->
    <nav class="bg-white border-b border-slate-200 px-8 py-4 flex justify-between items-center sticky top-0 z-50">
        <div class="flex items-center gap-3">
            <div class="w-8 h-8 bg-blue-600 rounded-lg flex items-center justify-center text-white font-bold shadow-md">E</div>
            <span class="font-extrabold text-xl tracking-tight text-slate-900">EduSphere</span>
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
            <div class="text-sm font-semibold text-slate-500 bg-slate-100 px-4 py-2 rounded-full flex items-center gap-2">
                <i class="fas fa-clock text-blue-500"></i> Time Remaining: <span class="text-slate-800">59:23</span>
            </div>
        </div>
    </nav>

    <!-- Main Exam Content -->
    <main class="flex-1 max-w-4xl mx-auto w-full p-6 sm:p-10">
        
        <div class="mb-8">
            <a href="/dashboard" class="text-blue-600 font-semibold text-sm hover:underline flex items-center gap-2 mb-4">
                <i class="fas fa-arrow-left"></i> Return to Dashboard (Exit Exam)
            </a>
            <div class="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-blue-50 text-blue-700 font-bold text-xs uppercase tracking-wider border border-blue-100 mb-3">
                ${course.code}
            </div>
            <h1 class="text-3xl sm:text-4xl font-extrabold text-slate-900 mb-2">${course.title}</h1>
            <p class="text-lg text-slate-500">Final Assessment &bull; 100 Points Possible</p>
        </div>

        <form id="examForm" action="/SubmitExam" method="post" onsubmit="submitExam(event)">
            <input type="hidden" name="courseCode" value="${course.code}">
            <input type="hidden" id="marks" name="marks" value="0">

            <div class="space-y-8">
                <!-- Question 1 -->
                <div class="bg-white p-8 rounded-3xl border border-slate-200 shadow-sm">
                    <h3 class="text-lg font-bold text-slate-900 mb-4">1. What is the primary objective of this course?</h3>
                    <div class="space-y-3">
                        <label class="flex items-center gap-3 p-4 border border-slate-200 rounded-xl cursor-pointer hover:bg-slate-50 transition-colors">
                            <input type="radio" name="q1" value="A" class="w-4 h-4 text-blue-600" required>
                            <span class="text-slate-700 font-medium">To memorize all textbook material perfectly</span>
                        </label>
                        <label class="flex items-center gap-3 p-4 border border-slate-200 rounded-xl cursor-pointer hover:bg-slate-50 transition-colors">
                            <input type="radio" name="q1" value="B" class="w-4 h-4 text-blue-600">
                            <span class="text-slate-700 font-medium">To apply theoretical concepts to real-world scenarios</span>
                        </label>
                        <label class="flex items-center gap-3 p-4 border border-slate-200 rounded-xl cursor-pointer hover:bg-slate-50 transition-colors">
                            <input type="radio" name="q1" value="C" class="w-4 h-4 text-blue-600">
                            <span class="text-slate-700 font-medium">To write the longest possible essay</span>
                        </label>
                    </div>
                </div>

                <!-- Question 2 -->
                <div class="bg-white p-8 rounded-3xl border border-slate-200 shadow-sm">
                    <h3 class="text-lg font-bold text-slate-900 mb-4">2. Which methodology is best for long-term retention?</h3>
                    <div class="space-y-3">
                        <label class="flex items-center gap-3 p-4 border border-slate-200 rounded-xl cursor-pointer hover:bg-slate-50 transition-colors">
                            <input type="radio" name="q2" value="A" class="w-4 h-4 text-blue-600" required>
                            <span class="text-slate-700 font-medium">Cramming the night before</span>
                        </label>
                        <label class="flex items-center gap-3 p-4 border border-slate-200 rounded-xl cursor-pointer hover:bg-slate-50 transition-colors">
                            <input type="radio" name="q2" value="B" class="w-4 h-4 text-blue-600">
                            <span class="text-slate-700 font-medium">Passive reading</span>
                        </label>
                        <label class="flex items-center gap-3 p-4 border border-slate-200 rounded-xl cursor-pointer hover:bg-slate-50 transition-colors">
                            <input type="radio" name="q2" value="C" class="w-4 h-4 text-blue-600">
                            <span class="text-slate-700 font-medium">Active recall and spaced repetition</span>
                        </label>
                    </div>
                </div>

                <!-- Final Essay -->
                <div class="bg-white p-8 rounded-3xl border border-slate-200 shadow-sm">
                    <h3 class="text-lg font-bold text-slate-900 mb-4">3. Short Essay (Required)</h3>
                    <p class="text-slate-500 mb-4 text-sm">Briefly summarize your key learnings from ${course.title}.</p>
                    <textarea rows="5" class="w-full px-4 py-3 rounded-xl border border-slate-200 focus:border-blue-500 focus:ring-2 focus:ring-blue-100 outline-none transition-all text-slate-800 placeholder-slate-400 bg-slate-50 focus:bg-white resize-none" placeholder="Type your answer here..." required></textarea>
                </div>
            </div>

            <!-- Submit Section -->
            <div class="mt-10 mb-16 flex items-center justify-between bg-blue-50 p-6 rounded-3xl border border-blue-100">
                <div>
                    <h4 class="font-bold text-blue-900">Ready to submit?</h4>
                    <p class="text-sm text-blue-700 mt-1">Make sure you have answered all questions.</p>
                </div>
                <button type="submit" class="bg-blue-600 hover:bg-blue-700 text-white px-8 py-3.5 rounded-xl font-bold transition-all shadow-lg shadow-blue-600/30 hover:-translate-y-0.5 flex items-center gap-2">
                    Submit Exam <i class="fas fa-paper-plane"></i>
                </button>
            </div>
        </form>
    </main>
</body>
</html>