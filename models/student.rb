class Student

attr_accessor(:id, :name)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end


  def save
    sql = "INSERT INTO students (name) VALUES ('#{name}') RETURNING *"
    return Student.map_item(sql)
  end


  def self.all
    sql = "SELECT * FROM students"
    return Student.map_items(sql)
  end


  def self.delete_all
    sql = "DELETE FROM students"
    SqlRunner.run(sql)
  end


  def courses
    sql = "SELECT c.* from courses c INNER JOIN attending a on a.course_id=c.id WHERE a.student_id = #{@id};"
    return Course.map_items(sql)
  end


  def self.map_items(sql)
    students = SqlRunner.run(sql)
    result = students.map {|student| Student.new(student)}
    return result
  end


  def self.map_item(sql)
    return Student.map_items(sql).first
  end

end