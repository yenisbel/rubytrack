class Bootcamp
    def initialize( name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers = []
        @students = []
        @grades = Hash.new { |hash, key| hash[key] =[] }
    end
  
    def name
        @name
    end
  
    def slogan
        @slogan
    end
  
    def teachers
        @teachers
    end
  
    def students
        @students
    end
  
    def grades
        @grades
    end
  
    def hire(name_teacher)
        @teachers << name_teacher
    end
  
    def enroll(name_student)
        if @students.length < @student_capacity
            @students << name_student
            return true
        end
        false
    end
  
    def enrolled?(name_student)
        @students.include?(name_student)
    end
  
    def student_to_teacher_ratio
      @students.length / @teachers.length
    end
  
    def add_grade(name_student, grade)
        if enrolled?(name_student)
            @grades[name_student] << grade
            return true
        end
        false
    end
  
    def num_grades(name_student)
        @grades[name_student].length
    end
  
    def average_grade(name_student)
      grade_student = @grades[name_student]
      if grade_student.empty?
        return nil
      end
      return grade_student.sum / grade_student.length
    end 
end
