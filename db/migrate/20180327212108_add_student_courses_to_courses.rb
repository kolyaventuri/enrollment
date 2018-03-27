class AddStudentCoursesToCourses < ActiveRecord::Migration[5.1]
  def change
    add_reference :courses, :student_courses, foreign_key: true
  end
end
