class Student

attr_accessor(:id, :name)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end


  def save
    sql = "INSERT INTO students (name) VALUES ('#{name}') RETURNING *"
    return Student.map_items(sql, false)
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

  def self.map_items(sql, multi=true) #2nd parameter returns true if no
      result = SqlRunner.run(sql)     #2nd argument is passed when method
      res = result.map {|r| Student.new(r)} #called
      if multi
          return res
      else
          return res.first
      end
  end

end