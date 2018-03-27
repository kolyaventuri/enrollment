class RenameStudentsAndCoursesInStudentCourses < ActiveRecord::Migration[5.1]
  def change
    rename_column :student_courses, :students_id, :student_id
    rename_column :student_courses, :courses_id, :course_id

  end
end
