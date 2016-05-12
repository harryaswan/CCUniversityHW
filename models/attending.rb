class Attending

    attr_reader(:id, :student_id, :course_id)

    def initialize(options)
        @id = options['id']
        @student_id = options['student_id'].to_i()
        @course_id = options['course_id'].to_i()
    end

    def save()
        sql = "INSERT INTO attending (student_id, course_id) VALUES (#{@student_id}, #{@course_id}) RETURNING *;"
        return Attending.map_items(sql, false)
    end

    def self.delete_all()
        sql = "DELETE FROM attending;"
        SqlRunner.run(sql)
    end

    def self.all()
        sql = "SELECT * FROM attending;"
        return Attending.map_items(sql)
    end

    def self.map_items(sql, multi=true) #2nd parameter returns true if no
        result = SqlRunner.run(sql)     #2nd argument is passed when method
        res = result.map {|r| Attending.new(r)} #called
        if multi
            return res
        else
            return res.first
        end
    end

    # def self.map_item(sql)
    #     return Attending.map_items(sql).first
    # end
end
