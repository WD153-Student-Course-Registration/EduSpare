@echo off
set TARGET=divided_parts
mkdir %TARGET% 2>nul
mkdir %TARGET%\exams 2>nul
mkdir %TARGET%\user 2>nul
mkdir %TARGET%\teacher 2>nul
mkdir %TARGET%\Course 2>nul
mkdir %TARGET%\enrolments 2>nul
mkdir %TARGET%\dashboard 2>nul
mkdir %TARGET%\grade 2>nul

copy "src\main\java\com\example\WD153\controller\ExamController.java" "%TARGET%\exams\" >nul 2>&1
copy "src\main\java\com\example\WD153\model\Exam.java" "%TARGET%\exams\" >nul 2>&1
copy "src\main\java\com\example\WD153\service\ExamService.java" "%TARGET%\exams\" >nul 2>&1
copy "src\main\webapp\WEB-INF\jsp\exam.jsp" "%TARGET%\exams\" >nul 2>&1
copy "data\exams.txt" "%TARGET%\exams\" >nul 2>&1

copy "src\main\java\com\example\WD153\controller\AuthController.java" "%TARGET%\user\" >nul 2>&1
copy "src\main\java\com\example\WD153\model\User.java" "%TARGET%\user\" >nul 2>&1
copy "src\main\java\com\example\WD153\model\Admin.java" "%TARGET%\user\" >nul 2>&1
copy "src\main\java\com\example\WD153\model\Student.java" "%TARGET%\user\" >nul 2>&1
copy "src\main\java\com\example\WD153\service\UserService.java" "%TARGET%\user\" >nul 2>&1
copy "src\main\webapp\WEB-INF\jsp\login.jsp" "%TARGET%\user\" >nul 2>&1
copy "src\main\webapp\WEB-INF\jsp\register.jsp" "%TARGET%\user\" >nul 2>&1
copy "src\main\webapp\WEB-INF\jsp\studentProfile.jsp" "%TARGET%\user\" >nul 2>&1
copy "data\users.txt" "%TARGET%\user\" >nul 2>&1

copy "src\main\java\com\example\WD153\model\Teacher.java" "%TARGET%\teacher\" >nul 2>&1
copy "src\main\java\com\example\WD153\service\TeacherService.java" "%TARGET%\teacher\" >nul 2>&1
copy "src\main\webapp\WEB-INF\jsp\teachers.jsp" "%TARGET%\teacher\" >nul 2>&1
copy "data\teachers.txt" "%TARGET%\teacher\" >nul 2>&1

copy "src\main\java\com\example\WD153\controller\CourseController.java" "%TARGET%\Course\" >nul 2>&1
copy "src\main\java\com\example\WD153\model\Course.java" "%TARGET%\Course\" >nul 2>&1
copy "src\main\java\com\example\WD153\service\CourseService.java" "%TARGET%\Course\" >nul 2>&1
copy "src\main\webapp\WEB-INF\jsp\courseDetails.jsp" "%TARGET%\Course\" >nul 2>&1
copy "data\courses.txt" "%TARGET%\Course\" >nul 2>&1

copy "src\main\java\com\example\WD153\model\Enrollment.java" "%TARGET%\enrolments\" >nul 2>&1
copy "src\main\java\com\example\WD153\service\EnrollmentService.java" "%TARGET%\enrolments\" >nul 2>&1
copy "data\enrollments.txt" "%TARGET%\enrolments\" >nul 2>&1

copy "src\main\java\com\example\WD153\controller\DashboardController.java" "%TARGET%\dashboard\" >nul 2>&1
copy "src\main\java\com\example\WD153\controller\PageController.java" "%TARGET%\dashboard\" >nul 2>&1
copy "src\main\webapp\WEB-INF\jsp\dashboard.jsp" "%TARGET%\dashboard\" >nul 2>&1
copy "src\main\webapp\WEB-INF\jsp\index.jsp" "%TARGET%\dashboard\" >nul 2>&1

copy "src\main\java\com\example\WD153\model\Grade.java" "%TARGET%\grade\" >nul 2>&1
copy "src\main\java\com\example\WD153\service\GradeService.java" "%TARGET%\grade\" >nul 2>&1

echo Copy complete.