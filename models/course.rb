class Course

    attr_reader(:id, :name)
    def initialize(options)
        @id = options['id'].to_i()
        @name = options['name']
    end

    def save()
        sql = "INSERT INTO courses (name) VALUES ('#{@name}') RETURNING *;"
        return Course.map_items(sql, false)
    end

    def students()
        sql = "SELECT s.* FROM students s INNER JOIN attending a ON s.id = a.student_id WHERE a.course_id = #{@id};"
        return Student.map_items(sql)
    end

    def self.all()
        sql = "SELECT * FROM courses;"
        return Course.map_items(sql)
    end

    def self.delete_all()
        sql = "DELETE FROM courses;"
        SqlRunner.run(sql)
    end

    def self.map_items(sql, multi=true) #2nd parameter returns true if no
        result = SqlRunner.run(sql)     #2nd argument is passed when method
        res = result.map {|r| Course.new(r)} #called
        if multi
            return res
        else
            return res.first
        end
    end

end
