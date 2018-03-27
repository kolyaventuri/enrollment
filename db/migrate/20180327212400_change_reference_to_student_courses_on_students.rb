class ChangeReferenceToStudentCoursesOnStudents < ActiveRecord::Migration[5.1]
  def change
    remove_reference :courses, :student_courses, foreign_key: true
    add_reference :courses, :student_course, foreign_key: true
  end
end
