class ChangeReferenceToStudentCoursesOnCourses < ActiveRecord::Migration[5.1]
  def change
    remove_reference :students, :student_courses, foreign_key: true
    add_reference :students, :student_course, foreign_key: true
  end
end
