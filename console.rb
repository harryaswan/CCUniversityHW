require_relative('db/sql_runner')
require_relative( 'models/course.rb' )
require_relative( 'models/student.rb' )
require_relative( 'models/attending.rb' )
require( 'pry-byebug' )

Course.delete_all()
Student.delete_all()

c1 = Course.new({'name' => 'Computing'}).save()
c2 = Course.new({'name' => 'Maths'}).save()
c3 = Course.new({'name' => 'English'}).save()
s1 = Student.new({'name' => 'Nigel'}).save()
s2 = Student.new({'name' => 'Donald'}).save()
s3 = Student.new({'name' => 'Harry'}).save()


courses = Course.all();
students = Student.all();



binding.pry
nil
