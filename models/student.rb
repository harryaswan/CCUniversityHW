class Student

attr_accessor(:id, :name)

  def initialize(options)
    @id = options['id'].to_s
    @name = options['name']
  end


  def save
    sql = "INSERT INTO students (name) VALUES '#{name}' RETURNING *"
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


  def self.map_items
    students = SqlRunner.run(sql)
    result = students.map {|student| Student.new}
    return result
  end


  def self.map_item
    Student.map_items(sql).first
  end

end