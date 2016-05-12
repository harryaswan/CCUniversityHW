require_relative('db/sql_runner')
require_relative( 'models/course.rb' )
require_relative( 'models/student.rb' )
require_relative( 'models/attending.rb' )
require( 'pry-byebug' )

Course.delete_all()
Student.delete_all()

c1 = Course.new('Computing').save()
c2 = Course.new('Maths').save()
c3 = Course.new('English').save()
s1 = Student.new('Nigel').save()
s2 = Student.new('Donald').save()
s3 = Student.new('Harry').save()


courses = Course.all();
students = Student.all();



binding.pry
nil
