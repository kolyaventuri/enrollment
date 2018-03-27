class AddStudentCoursesToStudents < ActiveRecord::Migration[5.1]
  def change
    add_reference :students, :student_courses, foreign_key: true
  end
end
